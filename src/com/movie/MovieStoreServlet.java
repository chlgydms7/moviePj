package com.movie;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBCPConn;
import com.util.FileManager;
import com.util.Myutil;

public class MovieStoreServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException{
		doPost(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp,String url) throws ServletException,IOException{
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		MovieStoreDAO dao = new MovieStoreDAO(DBCPConn.getConnection());
		MovieStoreOrderDAO orderdao = new MovieStoreOrderDAO(DBCPConn.getConnection());
		MovieTicketDAO ticketdao = new MovieTicketDAO(DBCPConn.getConnection());
		
		Myutil Myutil = new Myutil();
		String url;
		String root = getServletContext().getRealPath("/");
		String path = root+File.separator+"pds"+File.separator +"storeFile";
		File f = new File(path);
		if(!f.exists())
			f.mkdirs();
		if(uri.indexOf("write.do")!=-1) {
			url = "/mvproject/write.jsp";
			forward(req, resp, url);		
		}else if(uri.indexOf("write_ok.do")!=-1) {
			String encType = "UTF-8";
			int maxSize = 10*10*1024;
			MultipartRequest mr = new MultipartRequest(req,path,maxSize,encType,new DefaultFileRenamePolicy());
			if(mr.getFile("upload")!=null) {
				MovieStoreDTO dto = new MovieStoreDTO();
				dto.setNum(dao.getMaxNum()+1);
				dto.setSubject(mr.getParameter("subject"));
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				dto.setOriginalFileName(mr.getOriginalFileName("upload"));
				dto.setPrice(Integer.parseInt(mr.getParameter("price")));
				dao.insertData(dto);
			}
			url = cp +"/store/list.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("list.do")!=-1) {
			List<MovieStoreDTO> snacklists = dao.getLists();
			String imagePath = cp +"/pds/storeFile";
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("lists",snacklists);		
			url = "/mvproject/list.jsp";
			forward(req, resp, url);	
		}else if(uri.indexOf("storeInfo.do")!=-1) {
			List<MovieStoreDTO> lists = new ArrayList<MovieStoreDTO>();
			int num = Integer.parseInt(req.getParameter("num"));
			MovieStoreDTO dto = dao.getReadData(num);
			lists = dao.getLists();
			String imagePath = cp +"/pds/storeFile";
			req.setAttribute("imagePath", imagePath);	
			req.setAttribute("dto",dto);
			req.setAttribute("lists",lists);
			url="/mvproject/priceInfo.jsp";
			forward(req, resp, url);	
		}else if(uri.indexOf("payment.do")!=-1) {
			
			
			HttpSession session = req.getSession();
			CustomInfo customInfo = (CustomInfo)session.getAttribute("customInfo");
			String userId = customInfo.getUserId();
			MovieTicketDTO ticketdto = ticketdao.getReadData(userId);
			String imagePath = cp +"/pds/storeFile";
			List<MovieStoreOrderDTO> orderlists = orderdao.ordergetList(userId);

			int totalSum = 0;
			for (int i = 0; i < orderlists.size(); i++) {
				totalSum += orderlists.get(i).getStoreSum();
			}
			req.setAttribute("ticketdto", ticketdto);
			req.setAttribute("totalSum", totalSum);
			req.setAttribute("orderlists",orderlists);
			req.setAttribute("imagePath",imagePath);	
			url = "/mvproject/payment.jsp";
			forward(req, resp, url);	
			
		}else if(uri.indexOf("bill.do")!=-1){	
			
			CustomInfo custominfo = (CustomInfo)req.getSession().getAttribute("customInfo");
			String userId = custominfo.getUserId();
			System.out.println(userId);
			MovieTicketDTO ticketdto = ticketdao.getReadData(userId);
			String cardType = req.getParameter("cardType");
			System.out.println(cardType);
			System.out.println("bill.do :"+userId);
			String imagePath = cp +"/pds/storeFile";
			List<MovieStoreOrderDTO> orderlists = orderdao.paymentgetList(userId);
			int totalSum = 0;
			for (int i = 0; i < orderlists.size(); i++) {
				totalSum += orderlists.get(i).getStoreSum();
			}
			orderdao.OrderUpdateData(userId, cardType);
			req.setAttribute("ticketdto", ticketdto);	
			req.setAttribute("totalSum", totalSum);
			req.setAttribute("orderlists",orderlists);
			req.setAttribute("imagePath",imagePath);			
			req.setAttribute("cardType",cardType);
			
			url = "/mvproject/bill.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("shoppingBasket.do")!=-1){
			String userid = "test";
			int num = Integer.parseInt(req.getParameter("num"));
			int storeSum = Integer.parseInt(req.getParameter("storeSum"));;
			int amount = Integer.parseInt(req.getParameter("amount"));
			MovieStoreDTO dto = dao.getReadData(num);
			MovieStoreOrderDTO orderdto = new MovieStoreOrderDTO();		
				orderdto.setOrder_number(orderdao.getMaxNum()+1);
				orderdto.setUserid(userid);
				orderdto.setNum(dto.getNum());
				orderdto.setAmount(amount);
				orderdto.setStoreSum(storeSum);
				orderdao.OrderInsertData(orderdto);				
			url= cp+"/store/list.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("paymentInsertData.do")!=-1){ 
			HttpSession session = req.getSession();
			CustomInfo customInfo = (CustomInfo)session.getAttribute("customInfo");
			String userId = customInfo.getUserId();	
			int num = Integer.parseInt(req.getParameter("num"));
			int storeSum = Integer.parseInt(req.getParameter("storeSum"));;
			int amount = Integer.parseInt(req.getParameter("amount"));
			MovieStoreDTO dto = dao.getReadData(num);
			MovieStoreOrderDTO orderdto = new MovieStoreOrderDTO();	
				orderdto.setOrder_number(orderdao.getMaxNum()+1);
				orderdto.setUserid(userId);
				orderdto.setNum(dto.getNum());
				orderdto.setAmount(amount);
				orderdto.setStoreSum(storeSum);
				orderdao.OrderInsertData(orderdto);				
			url= cp+"/store/payment.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("storeDeleteDate.do")!=-1){	
			int order_number = Integer.parseInt(req.getParameter("order_number"));
			orderdao.orderDateDelete(order_number);
			url= cp+"/store/payment.do";
			resp.sendRedirect(url);
		}
	}	
}

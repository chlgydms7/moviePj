package com.movie;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBCPConn;
import com.util.Myutil;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MovieTicketServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	protected void forward(HttpServletRequest req, HttpServletResponse resp,String url) throws ServletException, IOException {
		RequestDispatcher rd=req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("UTF-8");

		String cp = req.getContextPath();
		Connection conn=DBCPConn.getConnection();
		//----------------------------------------------------------------------------------------------
		//----------------------------------------------------------------------------------------------

		Myutil Myutil=new Myutil();
		String uri=req.getRequestURI();
		String url;
		MovieTicketDAO dao = new MovieTicketDAO(conn);


		// 회원가입
		if(uri.indexOf("signUp.do")!=-1) {		//indexOf는 값을 못찾으면 -1을 반환한다.

			url = "/jspProject/signUpMember/signUpMember.jsp";
			forward(req,resp,url);
		}
		else if(uri.indexOf("signUp_ok.do")!=-1) {
			MovieTicketDTO dto = new MovieTicketDTO();
			dto.setUserName(req.getParameter("userName"));
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			dto.setUserEmail(req.getParameter("userEmail"));
			dao.insertData(dto);
			url = cp + "/movie/login.do";	
			resp.sendRedirect(url);
		}

		else if(uri.indexOf("login.do")!=-1) {

			url = "/jspProject/login/movie_login.jsp";
			forward(req,resp,url);
		}

		else if (uri.indexOf("login_ok.do")!=-1){

			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			
			
			
			MovieTicketDTO dto = dao.getReadData(userId);

			if(dto==null||!dto.getUserPwd().equals(userPwd)) {

				req.setAttribute("message", "아이디 또는 패스워드가 맞지 않습니다. 확인 후 입력해주세요.");
				
				url = "/jspProject/login/movie_login.jsp";
				forward(req,resp,url);					
				return;
			}

			//세션에 id 올려둠
			HttpSession session = req.getSession(true);
			CustomInfo info = new CustomInfo();
			info.setUserId(dto.getUserId());
			session.setAttribute("customInfo", info);
			session.setMaxInactiveInterval(60*60);
			url = cp+"/movie/main.do";
			resp.sendRedirect(url);
		}

		// 아이디 찾기 구역
		else if(uri.indexOf("findId.do")!=-1) {

			url = "/jspProject/findId/movie_fidId.jsp";
			forward(req,resp,url);
		}

		else if(uri.indexOf("findId_ok.do")!=-1) {

			String userName = req.getParameter("userName");
			String userBirth = req.getParameter("userBirth");
			String userTel = req.getParameter("userTel");

			MovieTicketDTO dto = dao.getReadDataByName(userName);

			if(dto==null||!dto.getUserName().equals(userName)) {

				req.setAttribute("message1", "아이디");
				req.setAttribute("message2", "회원정보가 존재하지 않습니다.");
				req.setAttribute("message3", "비밀번호 찾기");
				req.setAttribute("message4", "findPwd.do';");
				req.setAttribute("message5", "로그인");
				req.setAttribute("message6", "login.do';");

				url = "/movie/findIdConf.do";
				forward(req,resp,url);

				return;		// id/Name 가 틀리면 여기서 멈춰라

			}

			if(dto==null||!dto.getUserBirth().equals(userBirth)) {

				req.setAttribute("message1", "아이디");
				req.setAttribute("message2", "회원정보가 존재하지 않습니다.");
				req.setAttribute("message3", "비밀번호 찾기");
				req.setAttribute("message4", "findPwd.do';");
				req.setAttribute("message5", "로그인");
				req.setAttribute("message6", "login.do';");

				url = "/movie/findIdConf.do";
				forward(req,resp,url);

				return;		// id/Birth 가 틀리면 여기서 멈춰라

			}

			if(dto==null||!dto.getUserTel().equals(userTel)) {

				// class에서 jsp로 넘길때 setAttribute로 넘긴다.
				req.setAttribute("message1", "아이디");
				req.setAttribute("message2", "회원정보가 존재하지 않습니다.");
				req.setAttribute("message3", "비밀번호 찾기");
				req.setAttribute("message4", "findPwd.do';");
				req.setAttribute("message5", "로그인");
				req.setAttribute("message6", "login.do';");

				url = "/movie/findIdConf.do";
				forward(req,resp,url);

				return;		// id/tel 가 틀리면 여기서 멈춰라
			}

			req.setAttribute("message1", "아이디");
			req.setAttribute("message2", "확인하신 아이디는 [" + dto.getUserId() + "] 입니다");
			req.setAttribute("message3", "비밀번호 찾기");
			req.setAttribute("message4", "findPwd.do';");
			req.setAttribute("message5", "로그인");
			req.setAttribute("message6", "login.do';");

			url = "/movie/findIdConf.do";
			forward(req,resp,url);

		}

		else if(uri.indexOf("findIdConf.do")!=-1) {

			url = "/jspProject/movie_confirm.jsp";
			forward(req,resp,url);
		}


		// 비밀번호 찾기 구역
		else if(uri.indexOf("findPwd.do")!=-1) {

			url = "/jspProject/findPwd/movie_fidPwd.jsp";
			forward(req,resp,url);
		}


		else if(uri.indexOf("findPwd_ok.do")!=-1) {

			String userId = req.getParameter("userId");
			String userBirth = req.getParameter("userBirth");
			String userTel = req.getParameter("userTel");

			MovieTicketDTO dto = dao.getReadData(userId);

			if(dto==null||!dto.getUserId().equals(userId)) {

				req.setAttribute("message1", "아이디");
				req.setAttribute("message2", "회원정보가 존재하지 않습니다.");
				req.setAttribute("message3", "아이디 찾기");
				req.setAttribute("message4", "findId.do';");
				req.setAttribute("message5", "로그인");
				req.setAttribute("message6", "login.do';");

				url = "/movie/findPwdConf.do";
				forward(req,resp,url);

				return;		// id/Name 가 틀리면 여기서 멈춰라

			}

			if(dto==null||!dto.getUserBirth().equals(userBirth)) {

				req.setAttribute("message1", "아이디");
				req.setAttribute("message2", "회원정보가 존재하지 않습니다.");
				req.setAttribute("message3", "아이디 찾기");
				req.setAttribute("message4", "findId.do';");
				req.setAttribute("message5", "로그인");
				req.setAttribute("message6", "login.do';");

				url = "/movie/findPwdConf.do";
				forward(req,resp,url);

				return;		// id/Birth 가 틀리면 여기서 멈춰라

			}

			if(dto==null||!dto.getUserTel().equals(userTel)) {

				// class에서 jsp로 넘길때 setAttribute로 넘긴다.
				req.setAttribute("message1", "아이디");
				req.setAttribute("message2", "회원정보가 존재하지 않습니다.");
				req.setAttribute("message3", "아이디 찾기");
				req.setAttribute("message4", "findId.do';");
				req.setAttribute("message5", "로그인");
				req.setAttribute("message6", "login.do';");

				url = "/movie/findPwdConf.do";
				forward(req,resp,url);

				return;		// id/tel 가 틀리면 여기서 멈춰라
			}

			req.setAttribute("message1", "아이디");
			req.setAttribute("message2", "확인하신 비밀번호는 [" + dto.getUserPwd() + "] 입니다");
			req.setAttribute("message3", "아이디 찾기");
			req.setAttribute("message4", "findId.do';");
			req.setAttribute("message5", "로그인");
			req.setAttribute("message6", "login.do';");


			url = "/movie/findPwdConf.do";
			forward(req,resp,url);
		}


		else if(uri.indexOf("findPwdConf.do")!=-1) {

			url = "/jspProject/movie_confirm.jsp";
			forward(req,resp,url);
		}


		// 가입여부 확인
		else if(uri.indexOf("signConfirm.do")!=-1){

			url = "/jspProject/signUpMember/checkUpMember.jsp";
			forward(req,resp,url);
		}


		else if(uri.indexOf("signConfirm_ok.do")!=-1) {

			String userName = req.getParameter("userName");
			String userBirth = req.getParameter("userBirth");
			String userTel = req.getParameter("userTel");

			MovieTicketDTO dto = dao.getReadDataByName(userName);

			if(dto==null||!dto.getUserName().equals(userName)) {

				req.setAttribute("message1", "가입정보");
				req.setAttribute("message2", "회원정보가 존재하지 않습니다.");
				req.setAttribute("message3", "메인화면");
				req.setAttribute("message4", "main.do';");
				req.setAttribute("message5", "회원가입진행");
				req.setAttribute("message6", "signUpGo.do';");

				url = "/movie/signUpConfirm.do";
				forward(req,resp,url);
				return;		// id/Name 가 틀리면 여기서 멈춰라
			}


			if(dto==null||!dto.getUserBirth().equals(userBirth)) {

				req.setAttribute("message1", "가입정보");
				req.setAttribute("message2", "회원정보가 존재하지 않습니다.");
				req.setAttribute("message3", "메인화면");
				req.setAttribute("message4", "main.do';");
				req.setAttribute("message5", "회원가입진행");
				req.setAttribute("message6", "signUpGo.do';");

				url = "/movie/signUpConfirm.do";
				forward(req,resp,url);

				return;		// id/Birth 가 틀리면 여기서 멈춰라
			}

			if(dto==null||!dto.getUserTel().equals(userTel)) {

				// class에서 jsp로 넘길때 setAttribute로 넘긴다.
				req.setAttribute("message1", "가입정보");
				req.setAttribute("message2", "회원정보가 존재하지 않습니다.");
				req.setAttribute("message3", "메인화면");
				req.setAttribute("message4", "main.do';");
				req.setAttribute("message5", "회원가입진행");
				req.setAttribute("message6", "signUpGo.do';");

				url = "/movie/signUpConfirm.do";
				forward(req,resp,url);

				return;		// id/tel 가 틀리면 여기서 멈춰라
			}

			req.setAttribute("message1", "가입정보");
			req.setAttribute("message2", "확인하신 아이디는 [" + dto.getUserId() + "] 입니다");
			req.setAttribute("message3", "메인화면");
			req.setAttribute("message4", "main.do';");
			req.setAttribute("message5", "회원가입진행");
			req.setAttribute("message6", "signUpGo.do';");

			url = "/movie/signUpConfirm.do";
			forward(req,resp,url);
		}

		else if(uri.indexOf("signUpConfirm.do")!=-1){

			url = "/jspProject/movie_confirm.jsp";
			forward(req,resp,url);
		}
		
		else if(uri.indexOf("signUpGo.do")!=-1){

			url = "/jspProject/signUpMember/signUpMember.jsp";
			forward(req,resp,url);
		}
		

		
		else if(uri.indexOf("main.do")!=-1) {

			url = "/jspProject/cgvMain.jsp";
			forward(req,resp,url);

		}


		// logout작업
		else if(uri.indexOf("logout.do")!=-1) {

			HttpSession session = req.getSession();
			session.removeAttribute("customInfo");		// customInfo에 있는 값 삭제 
			session.invalidate();						// customInfo라는 변수도 삭제

			url = cp+"/movie/main.do";
			resp.sendRedirect(url);
		}
		//영화 좌석 확인
		else if(uri.indexOf("sit.do")!=-1) {
			HttpSession session=req.getSession();

			String movietype=req.getParameter("movietype");
			String timetype=req.getParameter("timetype");
			String roomtypestring=req.getParameter("roomtype");
			int roomtype=Integer.valueOf(roomtypestring);
			System.out.println(movietype+"영화"+timetype+"시간"+roomtype+"상영관 예매 시작");

			Movie_PaymentDAO msdao=new Movie_PaymentDAO(DBCPConn.getConnection());
			List<Movie_PaymentDTO> lists = msdao.getLists(movietype, timetype, roomtype);
			req.setAttribute("lists", lists);


			url="/jspProject/movie/sit.jsp";
			forward(req, resp, url);
		}

		//영화 평가 선택
		else if(uri.indexOf("movie_evaluation_select.do")!=-1) {
			url="/jspProject/movie/movie_evaluation_select.jsp";
			forward(req, resp, url);
		}

		//영화 평가 확인
		else if(uri.indexOf("movie_evaluation.do")!=-1) {
			HttpSession session=req.getSession();
			req.setCharacterEncoding("UTF-8");
			//-----------------------------------------------------------------------
			String movietype=req.getParameter("movietype");
			req.setAttribute("movietype", movietype);
			session.setAttribute("movietype", movietype);
			String userid;
			if(session.getAttribute("customInfo")!=null) {
				userid=((CustomInfo)session.getAttribute("customInfo")).getUserId();
			}else {
			}
			System.out.println(movietype+"영화 타입으로 들어 온 값");
			//-----------------------------------------------------------------------
			Movie_AppraisalDAO madao=new Movie_AppraisalDAO(DBCPConn.getConnection());

			String pageNum=req.getParameter("pageNum");
			int currentPage=1;//처음시행하는 페이지
			if(pageNum!=null){
				currentPage=Integer.parseInt(pageNum);
			}
			
			int dataCount=madao.countData(movietype);//전체 데이터 구하기
			req.setAttribute("dataCount",new Integer(dataCount));
			int numPerPage=10;//총 페이지수 구하기
			int totalPage=Myutil.getPageCount(numPerPage, dataCount);
			//전체페이지수보다 표시할 페이지가 더 큰 경우
			if(currentPage>totalPage)
				currentPage=totalPage;
			//db에서 가져올 데이터의 시작과 끝
			int start=(currentPage-1)*numPerPage+1;
			int end=currentPage*numPerPage;

			List<Movie_AppraisalDTO> lists=madao.getList(start, end, movietype);
			req.setAttribute("lists", lists);

			//System.out.println(lists.size());크기재기
			//페이지 처리
			String listUrl="/study/movie/movie_evaluation.do?movietype="+URLEncoder.encode(movietype,"UTF-8");
			String pageIndexList=Myutil.pageIndexList(currentPage, totalPage, listUrl);
			req.setAttribute("pageIndexList", pageIndexList);

			url="/jspProject/movie/movie_evaluation.jsp";
			forward(req, resp, url);
		}
		//영화 평과 작성
		else if(uri.indexOf("movie_evaluation_ok.do")!=-1) {

			HttpSession session=req.getSession();
			req.setCharacterEncoding("UTF-8");

			int star_select=Integer.valueOf(req.getParameter("star_select"));
			String content=req.getParameter("content");
			String movietype=(String)session.getAttribute("movietype");
			System.out.println(movietype+"이 값이 안넘어오는것 같아");

			//movietype="나쁜녀석들";
			Movie_AppraisalDTO dto=new Movie_AppraisalDTO();
			dto.setMovietype(movietype);
			dto.setMsg(content);
			dto.setStar_select(star_select);
			dto.setUserId(((CustomInfo)session.getAttribute("customInfo")).getUserId());

			Movie_AppraisalDAO madao=new Movie_AppraisalDAO(DBCPConn.getConnection());
			madao.insertData(dto);

			url=cp+"/movie/movie_evaluation.do?movietype="+URLEncoder.encode(movietype,"UTF-8");
			System.out.println(url);

			resp.sendRedirect(url);
		}


		//영화 예매 선택
		else if(uri.indexOf("movie_select.do")!=-1) {

			HttpSession session=req.getSession();

			if(session.getAttribute("customInfo")==null||((CustomInfo)session.getAttribute("customInfo")).getUserId().equals("")) {
				System.out.println("비로그인시..");
				url= cp+"/movie/main.do";
				resp.sendRedirect(url);
				return;
			}
			System.out.println(((CustomInfo)session.getAttribute("customInfo")).getUserId());

			List<Movie_selectDTO> lists=new ArrayList<Movie_selectDTO>();
			Movie_selectDAO msdao=new Movie_selectDAO(DBCPConn.getConnection());

			lists=msdao.getDataList();

			req.setAttribute("lists", lists);

			List<Movie_countDTO> listscount=new ArrayList<Movie_countDTO>();
			listscount=msdao.getDataCount();

			req.setAttribute("listscount", listscount);

			url="/jspProject/movie/movie_select.jsp";
			forward(req, resp, url);
		}

		//영화 결제 페이지로.
				else if(uri.indexOf("sit_ok.do")!=-1) {
					Movie_PaymentDAO mpdao=new Movie_PaymentDAO(conn);
					
					HttpSession session=req.getSession();
					CustomInfo customInfo = (CustomInfo)session.getAttribute("customInfo");
					String userId = customInfo.getUserId();

					Random rd=new Random();
					int reserveNum = rd.nextInt(10000)+1;
					List<Movie_PaymentDTO> lists=new ArrayList<>();
					for(int i=0;i<10;i++){
						for(int j=1;j<=10;j++){
							if(Integer.valueOf(req.getParameter("h"+Integer.valueOf((i*10)+j)))==2){
								Movie_PaymentDTO dto=new Movie_PaymentDTO();
								dto.setMovietype(req.getParameter("movietype"));
								dto.setTimetype(req.getParameter("timetype"));
								dto.setRoomtype(Integer.valueOf(req.getParameter("roomtype")));
								System.out.println(((CustomInfo)session.getAttribute("customInfo")).getUserId());
								dto.setUserId(((CustomInfo)session.getAttribute("customInfo")).getUserId());
								dto.setSitnum(((i*10)+j));
								dto.setReserveNum(reserveNum);
								lists.add(dto);
								mpdao.insert(dto);
							}
						}
					}

					String movietype = "";
					String timetype = "";
					int sitnum = 0;
					int roomtype = 0;
					int cost = 0;
					session.setAttribute("lists", lists);
					Movie_selectDAO msdao=new Movie_selectDAO(conn);
					for(Movie_PaymentDTO mpdto:lists) {
						movietype=mpdto.getMovietype();
						timetype=mpdto.getTimetype();
						roomtype=mpdto.getRoomtype();
						cost+=msdao.getcost(movietype, timetype, roomtype);
						
						sitnum=mpdto.getSitnum();
					}
					
			/*		Movie_PaymentDAO paymentdao = new Movie_PaymentDAO(DBCPConn.getConnection());
					Movie_PaymentDTO paymentdto = new Movie_PaymentDTO();
					paymentdto.setUserId(userId);
					paymentdto.setTimetype(timetype);
					paymentdto.setRoomtype(roomtype);
					paymentdto.setSitnum(sitnum);
					paymentdto.setPayMethod(payMethod);*/

					int member=lists.size();
				
					req.setAttribute("member", member);
					req.setAttribute("lists", lists);
					req.setAttribute("userId", userId);
					req.setAttribute("movietype", movietype);
					req.setAttribute("timetype", timetype);
					req.setAttribute("sitnum", sitnum);
					req.setAttribute("roomtype", roomtype);
					req.setAttribute("cost", cost);

					url ="/jspProject/buy.jsp";
					forward(req, resp, url);
					//resp.sendRedirect(url);
				}
		else if(uri.indexOf("updated.do")!=-1) {
			
			HttpSession session = req.getSession();
			CustomInfo customInfo = (CustomInfo)session.getAttribute("customInfo");
			
			MovieTicketDTO dto = dao.getReadData(customInfo.getUserId());
			session.setAttribute("dto", dto);
			
			url = "/jspProject/signUpMember/updateMember.jsp";
			forward(req, resp, url);
		
		}
		
		
		else if(uri.indexOf("updated_ok.do")!=-1) {
			
			String userId = req.getParameter("userId");
			
			MovieTicketDTO dto = new MovieTicketDTO();
			dto.setUserId(userId);
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			dto.setUserEmail(req.getParameter("userEmail"));	
			dao.update(dto);
			url = "/movie/main.do";
			forward(req, resp, url);			
			
		}
		//영화 결제 페이지로.
		else if(uri.indexOf("sit_ok.do")!=-1) {
			Movie_PaymentDAO mpdao=new Movie_PaymentDAO(conn);
			
			HttpSession session=req.getSession();
			CustomInfo customInfo = (CustomInfo)session.getAttribute("customInfo");
			String userId = customInfo.getUserId();
			
			List<Movie_PaymentDTO> lists=new ArrayList<>();
			for(int i=0;i<10;i++){
				for(int j=1;j<=10;j++){
					if(Integer.valueOf(req.getParameter("h"+Integer.valueOf((i*10)+j)))==2){
						Movie_PaymentDTO dto=new Movie_PaymentDTO();
						dto.setMovietype(req.getParameter("movietype"));
						dto.setTimetype(req.getParameter("timetype"));
						dto.setRoomtype(Integer.valueOf(req.getParameter("roomtype")));
						System.out.println(((CustomInfo)session.getAttribute("customInfo")).getUserId());
						dto.setUserId(((CustomInfo)session.getAttribute("customInfo")).getUserId());
						dto.setSitnum(((i*10)+j));
						Random rd=new Random();
						int reserveNum = rd.nextInt(10000)+1;
						dto.setReserveNum(reserveNum);
						lists.add(dto);
						mpdao.insert(dto);
					}
				}
			}
			
			String movietype = "";
			String timetype = "";
			int sitnum = 0;
			int roomtype = 0;
			int cost = 0;
			session.setAttribute("lists", lists);
			Movie_selectDAO msdao=new Movie_selectDAO(conn);
			for(Movie_PaymentDTO mpdto:lists) {
				movietype=mpdto.getMovietype();
				timetype=mpdto.getTimetype();
				roomtype=mpdto.getRoomtype();
				cost+=msdao.getcost(movietype, timetype, roomtype);
				sitnum=mpdto.getSitnum();
			}
			
			/*		Movie_PaymentDAO paymentdao = new Movie_PaymentDAO(DBCPConn.getConnection());
			Movie_PaymentDTO paymentdto = new Movie_PaymentDTO();
			paymentdto.setUserId(userId);
			paymentdto.setTimetype(timetype);
			paymentdto.setRoomtype(roomtype);
			paymentdto.setSitnum(sitnum);
			paymentdto.setPayMethod(payMethod);*/
			
			int member=lists.size();
			
			req.setAttribute("member", member);
			req.setAttribute("lists", lists);
			req.setAttribute("userId", userId);
			req.setAttribute("movietype", movietype);
			req.setAttribute("timetype", timetype);
			req.setAttribute("sitnum", sitnum);
			req.setAttribute("roomtype", roomtype);
			req.setAttribute("cost", cost);
			
			url ="/jspProject/buy.jsp";
			forward(req, resp, url);
			//resp.sendRedirect(url);
		}
		//결제페이지
		else if(uri.indexOf("buy.do")!=-1) {

			/*HttpSession session = req.getSession();
			List<Movie_PaymentDTO> lists = (List<Movie_PaymentDTO>)session.getAttribute("lists");

			Movie_discountDAO dao1 = new Movie_discountDAO(conn);
			String userId = "";
			String movietype = "";
			String timetype = "";
			int sitnum = 0;
			int roomtype = 0;
			int cost = 0;

			Movie_discountDTO dto = dao1.getReadData(userId);

			for(Movie_PaymentDTO mpdto:lists) {
				movietype=mpdto.getMovietype();
				timetype=mpdto.getTimetype();
				roomtype=mpdto.getRoomtype();
				Movie_selectDAO msdao=new Movie_selectDAO(conn);
				cost+=msdao.getcost(movietype, timetype, roomtype);
				sitnum=mpdto.getSitnum();
			}
//			int member=lists.size();
			req.setAttribute("member", member);
			req.setAttribute("lists", lists);
//			req.setAttribute("userId", userId);
//			req.setAttribute("movietype", movietype);
//			req.setAttribute("timetype", timetype);
//			req.setAttribute("sitnum", sitnum);
//			req.setAttribute("roomtype", roomtype);
			req.setAttribute("cost", cost);*/
			
			String payMethod = req.getParameter("payMethod");
			
			req.setAttribute("payMethod", payMethod);

			url = "/jspProject/buy.jsp";
			forward(req, resp, url);

		}
		

	else if(uri.indexOf("buy_ok.do")!=-1) {
		
		/*Movie_completeDTO dto = new Movie_completeDTO();
		Movie_completeDAO dao2 = new Movie_completeDAO(conn);
		*/Movie_PaymentDAO paymentdao = new Movie_PaymentDAO(conn);
		Random rd = new Random();

		//			for(int i=0;i<10000;i++) {
		int reserveNum = rd.nextInt(10000)+1;
		//				System.out.println(reserveNum);
		//			}
		//reserveNum=rd.nextInt();
		String userId = "";
		String movietype = "";
		String timetype = "";
		String userid="";
		int sitnum = 0;
		int roomtype = 0;
		int cost = 0;			
		HttpSession session = req.getSession();
		CustomInfo customInfo = (CustomInfo)session.getAttribute("customInfo");
		userId = customInfo.getUserId();
		System.out.println("payment userid : "+userId);
		String payMethod = req.getParameter("payMethod");
		System.out.println("paymentMethod : "+payMethod);
		int result =  paymentdao.paymentUpdateData(userId, payMethod);
		

		
		/*List<Movie_PaymentDTO> lists = (List<Movie_PaymentDTO>)session.getAttribute("lists");
		for(Movie_PaymentDTO mpdto:lists) {
			movietype=mpdto.getMovietype();
			timetype=mpdto.getTimetype();
			roomtype=mpdto.getRoomtype();
			sitnum=mpdto.getSitnum();
			userid=mpdto.getUserId();
			Movie_PaymentDAO mpdao=new Movie_PaymentDAO(conn);
			mpdao.insert(mpdto);
		}
		*/
		/*dto.setUserId(((CustomInfo)session.getAttribute("customInfo")).getUserId());
		dto.setReserveNum(reserveNum);
		dto.setMovietype(movietype);
		dto.setTimetype(timetype);
		dto.setRoomtype(roomtype);
		System.out.println("paymethod : "+req.getParameter(payMethod));
		dto.setPayMethod(payMethod);*/
		
		/*Movie_selectDAO msdao=new Movie_selectDAO(conn);
		cost=msdao.getcost(movietype, timetype, roomtype);
		dto.setCost(cost);*/
		
		/*int member=lists.size();
		req.setAttribute("member", member);
		*/
	/*	
	 * for(Movie_PaymentDTO mpdto:lists) {
		dto.setSitnum(mpdto.getSitnum());
		dao2.insertData(dto);
		}*/
		//dto.setPayMethod(req.getParameter("payMethod"));
		//dto.setPayInfo(req.getParameter("payInfo"));

		//dao2.insertData(dto);
		url = cp + "/movie/pay.do";
		resp.sendRedirect(url);

		
		}else if(uri.indexOf("pay.do")!=-1) {

			/*String userId = "";
			String movietype = "";
			String timetype = "";
			String userid="";
			int sitnum = 0;
			int roomtype = 0;
			int cost = 0;

			HttpSession session = req.getSession();
			List<Movie_PaymentDTO> lists = (List<Movie_PaymentDTO>)session.getAttribute("lists");

			for(Movie_PaymentDTO mpdto:lists) {
				movietype=mpdto.getMovietype();
				timetype=mpdto.getTimetype();
				roomtype=mpdto.getRoomtype();
				sitnum=mpdto.getSitnum();
				userid=mpdto.getUserId();
				Movie_PaymentDAO mpdao=new Movie_PaymentDAO(conn);
				mpdao.insert(mpdto);
			}*/
			HttpSession session = req.getSession();

			List<Movie_PaymentDTO> lists = (List<Movie_PaymentDTO>)session.getAttribute("lists");
			
			String userId = ((CustomInfo)session.getAttribute("customInfo")).getUserId();
			
			Movie_PaymentDAO dao2 = new Movie_PaymentDAO(conn);
			Movie_PaymentDTO dto = dao2.getReadData(userId);
			
//			userId = dto.getUserId();
			int reserveNum = dto.getReserveNum();
			String payMethod = dto.getPayMethod();
			String movietype = "";
			String timetype = "";
			int sitnum = 0;
			int roomtype = 0;
			int cost = 0;
			String sitString="";
			
			for(Movie_PaymentDTO mcdto : lists) {
				movietype=mcdto.getMovietype();
				timetype=mcdto.getTimetype();
				roomtype=mcdto.getRoomtype();
				Movie_selectDAO msdao=new Movie_selectDAO(conn);
				cost+=msdao.getcost(movietype, timetype, roomtype);
				sitString+=mcdto.getSitnum()+" ";
			}

			int member=lists.size();

			//req.setAttribute("listss", listss);
			req.setAttribute("userId", userId);
			req.setAttribute("reserveNum", reserveNum);
			req.setAttribute("movietype", movietype);
			req.setAttribute("timetype", timetype);
			req.setAttribute("sitnum", sitString);
			req.setAttribute("roomtype", roomtype);
			req.setAttribute("cost", cost);
			req.setAttribute("member", member);
			req.setAttribute("payMethod", payMethod);

			url = "/jspProject/pay.jsp";
			forward(req, resp, url);

		}else if(uri.indexOf("cjone.do")!=-1) {
			
			HttpSession session = req.getSession();

			List<Movie_PaymentDTO> lists = (List<Movie_PaymentDTO>)session.getAttribute("lists");
			
			String userId = ((CustomInfo)session.getAttribute("customInfo")).getUserId();
			
			Movie_PaymentDAO dao2 = new Movie_PaymentDAO(conn);
			Movie_PaymentDTO dto = dao2.getReadData(userId);
			
			String movietype = "";
			String timetype = "";
			int sitnum = 0;
			int roomtype = 0;
			int cost = 0;
			
			for(Movie_PaymentDTO mcdto : lists) {
				movietype=mcdto.getMovietype();
				timetype=mcdto.getTimetype();
				roomtype=mcdto.getRoomtype();
				Movie_selectDAO msdao=new Movie_selectDAO(conn);
				cost+=msdao.getcost(movietype, timetype, roomtype);
			}

			int member=lists.size();

			req.setAttribute("userId", userId);
			req.setAttribute("movietype", movietype);
			req.setAttribute("timetype", timetype);
			req.setAttribute("roomtype", roomtype);
			req.setAttribute("cost", cost);
			req.setAttribute("member", member);

			url ="/jspProject/cjone.jsp";
			forward(req, resp, url);
			
		}
		
		else if(uri.indexOf("cgv.do")!=-1) {
			
			HttpSession session = req.getSession();

			List<Movie_PaymentDTO> lists = (List<Movie_PaymentDTO>)session.getAttribute("lists");
			
			String userId = ((CustomInfo)session.getAttribute("customInfo")).getUserId();
			
			Movie_PaymentDAO dao2 = new Movie_PaymentDAO(conn);
			Movie_PaymentDTO dto = dao2.getReadData(userId);
			
			String movietype = "";
			String timetype = "";
			int sitnum = 0;
			int roomtype = 0;
			int cost = 0;
			
			for(Movie_PaymentDTO mcdto : lists) {
				movietype=mcdto.getMovietype();
				timetype=mcdto.getTimetype();
				roomtype=mcdto.getRoomtype();
				Movie_selectDAO msdao=new Movie_selectDAO(conn);
				cost+=msdao.getcost(movietype, timetype, roomtype);
			}

			int member=lists.size();

			req.setAttribute("userId", userId);
			req.setAttribute("movietype", movietype);
			req.setAttribute("timetype", timetype);
			req.setAttribute("roomtype", roomtype);
			req.setAttribute("cost", cost);
			req.setAttribute("member", member);

			url ="/jspProject/buy.jsp";
			forward(req, resp, url);
		
		}else if(uri.indexOf("moviebill.do")!=-1) {
		
			MovieTicketDAO ticketdao = new MovieTicketDAO(DBCPConn.getConnection());
			Movie_PaymentDAO paymentdao = new Movie_PaymentDAO(DBCPConn.getConnection());
			
			CustomInfo custominfo = (CustomInfo)req.getSession().getAttribute("customInfo");
			String userId = custominfo.getUserId();
			MovieTicketDTO ticketdto = ticketdao.getReadData(userId);
			List<Movie_PaymentDTO> paylist = paymentdao.getListDate(userId);
		
			req.setAttribute("paylist",paylist);
			req.setAttribute("ticketdto",ticketdto);
	
			url = "/jspProject/moviepaybill.jsp";
			forward(req, resp, url);
			
		}
	}
}










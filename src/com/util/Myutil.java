package com.util;


//page ó���� �ϴ� Ŭ���� �Դϴ�. 

public class Myutil {
	
	//��ü �������� ���ϱ� 
	public int getPageCount(int numPerPage,int dataCount) {
		
		int pageCount = 0;
		pageCount = dataCount/numPerPage;
		if(dataCount%numPerPage!=0) {
			pageCount++;
		}
		return pageCount;
	}
	//����¡ ó�� �޼ҵ� 
	//currentPage : ���� ǥ���� ������ 
	//totalPage : ��ü����������
	//listUrl : ��ũ�� ������ URL(list.jsp) 
	
	public String pageIndexList(int currentPage,int totalPage,String listUrl) {
		
		int numPerBlock = 5;
			
		int currentPageSetup; //ǥ���� ������ -1 (����)
		int page; 
		StringBuffer sb = new StringBuffer();
		if(currentPage==0 || totalPage == 0) {
			//�����Ͱ� �ƹ��͵� ������ null �� ��ȯ 
			return "";
		}
		//listUrl
		//list.jsp
		//list.jsp?searchKey='name'&searchValue='suzi'&pageNum=5
		if(listUrl.indexOf("?") != -1) {
			listUrl =listUrl+"&";
		}else {
			listUrl =listUrl+"?";
		}
		//ǥ���� ù ������ -1
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;		
		if(currentPage%numPerBlock ==0) {
			currentPageSetup=currentPage-numPerBlock;
		}
		//�� ���� 
		if(totalPage>numPerBlock && currentPageSetup>0) {
			sb.append("<a href=\""+ listUrl+"pageNum="+currentPageSetup+"\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=3">3</a>
		}
		//�ٷΰ��� ������ 
		page = currentPageSetup + 1;
		while(page<=totalPage && page<=(currentPageSetup+numPerBlock)) {
			
			if(page==currentPage) {
				sb.append("<font color=\"Fuchsia\">"+page+"</font>&nbsp;");	
				//<font color="Fuchsia">3</font> 
			}else {
				sb.append("<a href=\""+listUrl+"pageNum="+page+"\">"+page+"</a>&nbsp;");
				//<a href="list.jsp?pageNum=3">3</a>
			}
			page++;
		}
		//�� ���� 
		if(totalPage-currentPageSetup > numPerBlock) {
			sb.append("<a href=\""+listUrl+ "pageNum="+page+"\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=5"></a>
		}
		return sb.toString();
	}
}

package com.util;


//page 처리를 하는 클래스 입니다. 

public class Myutil {
	
	//전체 페이지수 구하기 
	public int getPageCount(int numPerPage,int dataCount) {
		
		int pageCount = 0;
		pageCount = dataCount/numPerPage;
		if(dataCount%numPerPage!=0) {
			pageCount++;
		}
		return pageCount;
	}
	//페이징 처리 메소드 
	//currentPage : 현재 표시할 페이지 
	//totalPage : 전체페이지갯수
	//listUrl : 링크를 설정할 URL(list.jsp) 
	
	public String pageIndexList(int currentPage,int totalPage,String listUrl) {
		
		int numPerBlock = 5;
			
		int currentPageSetup; //표시할 페이지 -1 (이전)
		int page; 
		StringBuffer sb = new StringBuffer();
		if(currentPage==0 || totalPage == 0) {
			//데이터가 아무것도 없을때 null 값 반환 
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
		//표시할 첫 페이지 -1
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock;		
		if(currentPage%numPerBlock ==0) {
			currentPageSetup=currentPage-numPerBlock;
		}
		//◀ 이전 
		if(totalPage>numPerBlock && currentPageSetup>0) {
			sb.append("<a href=\""+ listUrl+"pageNum="+currentPageSetup+"\">◀이전</a>&nbsp;");
			//<a href="list.jsp?pageNum=3">3</a>
		}
		//바로가기 페이지 
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
		//▶ 다음 
		if(totalPage-currentPageSetup > numPerBlock) {
			sb.append("<a href=\""+listUrl+ "pageNum="+page+"\">▶다음</a>&nbsp;");
			//<a href="list.jsp?pageNum=5"></a>
		}
		return sb.toString();
	}
}

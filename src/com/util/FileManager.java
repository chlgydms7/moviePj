package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
		
	//파일 다운로드 
	public static boolean doFileDownload(HttpServletResponse respons,String saveFileName,
										 String originalFileName,String path) {
		
		try {
			
			String fullpath = path+File.separator+saveFileName;
			//java 는 String 의 null 을 check 못할경우도 있습니다. 
			if(originalFileName == null || originalFileName.equals("")) {
				originalFileName = saveFileName;
			}
			//한글파일을 다운 받을때 깨짐 방지 
			originalFileName = new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1"); //8859_1
			File f = new File(fullpath);
			if(!f.exists()) {
				return false;
			}
			//octet file  내보낼 파일 형식 ContentType
			respons.setContentType("application/octet-stream");
			respons.setHeader("Content-disposition","attachment;fileName="+originalFileName);
			
			//먼저 파일을 하드웨어로 부터 읽어드린 다음 내보내야 합니다. 
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			//출력기 생성 
			OutputStream out = respons.getOutputStream();
			int data;
			byte[] bytes  = new byte[4096];
			while((data=bis.read(bytes,0,4096))!= -1) {
				out.write(bytes, 0, data);
			}
			
			out.flush();
			out.close();
			bis.close();
		} catch (Exception e) {
			System.out.println(e.toString());
			return false;
		}
		return true;
	}

	//파일 삭제 
	public static void doFileDelete(String fileName,String path) {
		
		try {	
			String fullPath = path+File.separator+fileName;
			File f = new File(fullPath);
			if(f.exists()) {
				f.delete();
			}else {
				System.out.println("경로에 파일이 없습니다.");
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}

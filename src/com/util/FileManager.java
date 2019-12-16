package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
		
	//���� �ٿ�ε� 
	public static boolean doFileDownload(HttpServletResponse respons,String saveFileName,
										 String originalFileName,String path) {
		
		try {
			
			String fullpath = path+File.separator+saveFileName;
			//java �� String �� null �� check ���Ұ�쵵 �ֽ��ϴ�. 
			if(originalFileName == null || originalFileName.equals("")) {
				originalFileName = saveFileName;
			}
			//�ѱ������� �ٿ� ������ ���� ���� 
			originalFileName = new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1"); //8859_1
			File f = new File(fullpath);
			if(!f.exists()) {
				return false;
			}
			//octet file  ������ ���� ���� ContentType
			respons.setContentType("application/octet-stream");
			respons.setHeader("Content-disposition","attachment;fileName="+originalFileName);
			
			//���� ������ �ϵ����� ���� �о�帰 ���� �������� �մϴ�. 
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			//��±� ���� 
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

	//���� ���� 
	public static void doFileDelete(String fileName,String path) {
		
		try {	
			String fullPath = path+File.separator+fileName;
			File f = new File(fullPath);
			if(f.exists()) {
				f.delete();
			}else {
				System.out.println("��ο� ������ �����ϴ�.");
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
}

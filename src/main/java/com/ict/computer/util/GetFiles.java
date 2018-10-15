package com.ict.computer.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class GetFiles {
	
	private static final int THRESHOLD_SIZE = 1024*1024*1;//1MB
	private static final int UP_TOTAL_SIZE = 1024*1024*200;//200MB
	private static final int UP_FILE_SIZE = 1024*1024*100;//100MB
	
	private static final File TEMP_REPOSITORY = new File(System.getProperty("java.io.tmpdir"));
	
	private static final String UP_PATH = "C:/jsp_study/workspace/prac_computer/src/main/webapp/resources/upload";
	
	public static Map<String,String> parseReqeust(HttpServletRequest request) {
		DiskFileItemFactory dfif = new DiskFileItemFactory(THRESHOLD_SIZE, TEMP_REPOSITORY);

		ServletFileUpload sfu = new ServletFileUpload(dfif);
		sfu.setHeaderEncoding("utf-8");
		sfu.setSizeMax(UP_TOTAL_SIZE);
		sfu.setFileSizeMax(UP_FILE_SIZE);
		
		try {
			List<FileItem> fList = sfu.parseRequest(request);
			Map<String,String> params = new HashMap<String,String>();
						
			for(FileItem fi:fList) {
				if(fi.isFormField()) {
					params.put(fi.getFieldName(), fi.getString("utf-8"));
					
				} else {
					if(fi.getName() != "") {						
					String fName = "/img" + System.currentTimeMillis() + fi.getName().substring(fi.getName().lastIndexOf("."));
					String fPath = UP_PATH + fName;
					
					if(fi.getName().equals("")) continue;
					
					File sFile = new File(fPath);
					
					fi.write(sFile);
					
					params.put(fi.getFieldName(), "/rsc/upload" +fName);
					}
				}
			}
			return params;
			
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("읭");
		return null;
	}
	
	public static void deleteFile(String img) {
		String fPath = "";
		
		if(img != "" && img !=null) {
			fPath = UP_PATH + img.substring(img.lastIndexOf("/"));			
		}
		
		System.out.println(fPath);
		File imgFile = new File(fPath);
		
		System.out.println(imgFile.exists());
		
		if(imgFile.exists()) {
			imgFile.delete();			
		}
		
	}
		
	

}

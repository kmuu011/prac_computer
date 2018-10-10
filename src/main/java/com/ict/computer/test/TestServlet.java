package com.ict.computer.test;

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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestServlet {
	
	private static final int THRESHOLD_SIZE = 1024*1024*1;//1MB
	private static final int UP_TOTAL_SIZE = 1024*1024*200;//200MB
	private static final int UP_FILE_SIZE = 1024*1024*100;//100MB
	
	private static final File TEMP_REPOSITORY = new File(System.getProperty("java.io.tmpdir"));
	
	private static final String UP_PATH = "C:/jsp_study/workspace/prac_computer/src/main/webapp/resources/upload";
	
	@RequestMapping(value="/testT", method=RequestMethod.POST)
	@ResponseBody
	public Integer test(HttpServletRequest request) {
		
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
					String fName = File.separator + fi.getName();
					String fPath = UP_PATH + fName;
					
					if(fi.getName().equals("")) continue;
					
					File sFile = new File(fPath);
					
					fi.write(sFile);
					
					params.put(fi.getFieldName(), "/rsc/upload" +fName);
				}
				
			}
			
			System.out.println(params);
			
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("읭");
		return 1;
	}

}

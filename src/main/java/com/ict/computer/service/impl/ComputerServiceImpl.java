package com.ict.computer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.computer.dao.ComputerDAO;
import com.ict.computer.service.ComputerService;
import com.ict.computer.util.GetFiles;
import com.ict.computer.vo.ComputerInfo;

@Service
public class ComputerServiceImpl implements ComputerService{
	
	@Autowired
	ComputerDAO cd;
	
	@Override
	public List<ComputerInfo> getComputerInfoList(ComputerInfo ci) {
		
		return cd.selectComputerInfoList(ci);
	}

	@Override
	public Integer getInsertResult(ComputerInfo ci) {
		if(ci.getCiimg() == null) {
			ci.setCiimg("");
		}
		
		return cd.insertComputerInfo(ci);
	}

	@Override
	public Integer getDeleteResult(List<Integer> deleteNo) {
		for(int cino : deleteNo) {
			ComputerInfo ci = new ComputerInfo();
			ci.setCino(cino);
			String img = cd.selectImg(ci);
			if(img !=null) {
				GetFiles.deleteFile(img);
			}
		}
		
		return cd.deleteComputerInfo(deleteNo);
	}

	@Override
	public Integer getUpdateResult(ComputerInfo ci) {
		String img = cd.selectImg(ci);
		
		if(ci.getCiimg() == null) {
			if(img == "") {
				ci.setCiimg("");
			}else {
				ci.setCiimg(img);
			}
		}
		
		if(img != ci.getCiimg()) {
			GetFiles.deleteFile(img);				
		}
		
		int result = cd.updateComputerInfo(ci);
		
		if(result == 0) {
			return null;
		}
		
		return ci.getCino();
	}

	@Override
	public List<ComputerInfo> getRecent() {
		return cd.selectRecent();
	}




}

package com.ict.computer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.computer.dao.ComputerDAO;
import com.ict.computer.service.ComputerService;
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
		return cd.insertComputerInfo(ci);
	}

	@Override
	public Integer getDeleteResult(List<Integer> deleteNo) {
		return cd.deleteComputerInfo(deleteNo);
	}

	@Override
	public Integer getUpdateResult(ComputerInfo ci) {
		return cd.updateComputerInfo(ci);
	}


}

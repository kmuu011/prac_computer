package com.ict.computer.dao;

import java.util.List;

import com.ict.computer.vo.ComputerInfo;

public interface ComputerDAO {
	
	public List<ComputerInfo> selectComputerInfoList(ComputerInfo ci);

	public Integer insertComputerInfo(ComputerInfo ci);
	

}

package com.ict.computer.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.computer.dao.ComputerDAO;
import com.ict.computer.vo.ComputerInfo;

@Repository
public class ComputerDAOImpl implements ComputerDAO{
	
	@Autowired
	private SqlSession ss;
	

	@Override
	public List<ComputerInfo> selectComputerInfoList(ComputerInfo ci) {
		return ss.selectList("SQL.COMPUTER.selectComputerInfoList", ci);
	}


	@Override
	public Integer insertComputerInfo(ComputerInfo ci) {
		return ss.insert("SQL.COMPUTER.insertComputerInfo", ci);
	}
	
	

}

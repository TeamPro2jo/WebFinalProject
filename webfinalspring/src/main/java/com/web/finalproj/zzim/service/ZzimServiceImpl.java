package com.web.finalproj.zzim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.finalproj.zzim.dto.ZzimDTO;
import com.web.finalproj.zzim.repository.ZzimRepository;


public class ZzimServiceImpl implements ZzimService {

	@Autowired
	private ZzimRepository dao;
	
	@Override
	public boolean add(ZzimDTO dto) throws Exception {
		boolean res = dao.insert(dto);
		return res;
	}
	
	@Override
	public boolean remove(ZzimDTO dto) throws Exception {
		return false;
	}
	
	@Override
	public List<ZzimDTO> findAll() throws Exception {
		List<ZzimDTO> data = dao.selectAll();
		return data;
	}
}

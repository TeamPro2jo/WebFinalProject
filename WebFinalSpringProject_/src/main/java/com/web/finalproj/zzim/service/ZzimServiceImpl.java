package com.web.finalproj.zzim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.finalproj.zzim.dto.ZzimDTO;
import com.web.finalproj.zzim.repository.ZzimRepository;

@Service
public class ZzimServiceImpl implements ZzimService{
	
	@Autowired
	private ZzimRepository dao;
	
	@Override
	public boolean zzim(ZzimDTO dto) throws Exception {
		boolean res = dao.zzimcheck(dto);
		return res;
	}

	@Override
	public boolean add(ZzimDTO dto) throws Exception {
		boolean res = dao.insert(dto);
		return res;
	}

	@Override
	public boolean remove(ZzimDTO dto) throws Exception {
		boolean res = dao.delete(dto);
		return res;
	}

	@Override
	public List<ZzimDTO> findAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

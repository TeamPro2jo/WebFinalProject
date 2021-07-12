package com.web.finalproj.zzim.service;

import java.util.List;

import com.web.finalproj.zzim.dto.ZzimDTO;

public interface ZzimService {
	public boolean zzim(ZzimDTO dto) throws Exception ;
	public boolean add(ZzimDTO dto) throws Exception;
	public boolean remove(ZzimDTO dto) throws Exception;
	public List<ZzimDTO> findAll() throws Exception;
}

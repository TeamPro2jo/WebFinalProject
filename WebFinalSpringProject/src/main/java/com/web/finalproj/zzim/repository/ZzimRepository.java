package com.web.finalproj.zzim.repository;

import java.util.List;

import com.web.finalproj.zzim.dto.ZzimDTO;

public interface ZzimRepository {
	public boolean insert(ZzimDTO dto)  throws Exception;
	public boolean delete(ZzimDTO dto)  throws Exception;
	public List<ZzimDTO> selectAll() throws Exception;
}

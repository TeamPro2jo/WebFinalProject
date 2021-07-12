package com.web.finalproj.upload.service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {
	public int save(int id, HashMap<String, String> data) throws Exception;
}

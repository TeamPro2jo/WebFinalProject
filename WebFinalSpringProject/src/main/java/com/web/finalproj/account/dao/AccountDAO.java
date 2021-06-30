package com.web.finalproj.account.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.stereotype.Repository;

import com.web.finalproj.account.dto.AccountDTO;


@Repository		// bean 객체로 등록하기 위해 사용
public class AccountDAO {
	
	private Connection con = null;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	private ResultSetExtractor<AccountDTO> ext = (rs) -> {
		AccountDTO data = new AccountDTO();
		if(rs.next()) {
			data.setId(rs.getInt("id"));
			data.setNickname(rs.getString("nickname"));
			data.setName(rs.getString("name"));
			data.setPwd(rs.getString("pwd"));
			data.setEmail(rs.getString("email"));
		} else {
			data.setId(-1);
			data.setNickname("존재하지 않습니다.");
			data.setName("존재하지 않습니다.");
		}
		return data;
	};
	
	public AccountDTO selectOne(int id) {
		String sql = "SELECT * FROM account WHERE id = ?";
		Object[] param = {id};
		return this.jdbcTemplate.query(sql, param, this.ext);
	}
	
	public AccountDAO() {
		DBConnect DB = new DBConnect();
		this.con = DB.getConnection();
	}
	
	public AccountDTO select(int id) {
		AccountDTO data = new AccountDTO();
		
		String sql = "SELECT * FROM account WHERE id = ?";
		
		try {
			PreparedStatement pstat = this.con.prepareStatement(sql);
			pstat.setInt(1, id);
			ResultSet rs = pstat.executeQuery();
			
			if(rs.next()) {
				data.setId(rs.getInt("id"));
				data.setNickname(rs.getString("nickname"));
				data.setName(rs.getString("name"));
				data.setPwd(rs.getString("pwd"));
				data.setEmail(rs.getString("email"));
			} else {
				data.setId(-1);
				data.setNickname("존재하지 않습니다.");
				data.setName("존재하지 않습니다.");
			}
			rs.close();
			pstat.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}
	
	public void close() {
		try {
			this.con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
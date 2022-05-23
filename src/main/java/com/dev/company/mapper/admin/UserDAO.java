package com.dev.company.mapper.admin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dev.company.lib.Ip;
import com.dev.company.vo.IPVO;
import com.dev.company.vo.UserVO;

import lombok.Setter;


public interface UserDAO {

	
	// 유저 리스트
	public List<Map<String, Object>> userList();
	
	//중복확인
	public int idChk(String id);
	
	//회원등록
	public int userAdd(Map<String, Object> map);
	
	//로그인 로그
	public void userLog(IPVO ivo);
	
	//로그인
	public UserVO login(String id);
}

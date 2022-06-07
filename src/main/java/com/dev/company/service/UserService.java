package com.dev.company.service;

import java.util.List;
import java.util.Map;

import com.dev.company.lib.Ip;
import com.dev.company.vo.IPVO;
import com.dev.company.vo.UserVO;




public interface UserService {

	// 유저 리스트
	public List<UserVO> userList(Map<String, Object> map);
	
	//유저 리스트 카운트
	public int userListCnt(Map<String, Object> map);
	
	//중복확인
	public int idChk(String id);
		
	//회원등록
	public int userAdd(Map<String, Object> map);
	
	//로그인
	public UserVO login(String id);
	
	//로그인 로그
	public void userLog(IPVO ivo);
	
	//유저 상세
	public UserVO userInfo(String seq);

	//패스워드 초기화
	public int pwdInit(Map<String, Object> map);
	
	//패스워드 초기화
	public int memoAdd(Map<String, Object> map);
}

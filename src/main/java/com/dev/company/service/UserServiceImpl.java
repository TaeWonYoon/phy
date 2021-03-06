package com.dev.company.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dev.company.lib.Ip;
import com.dev.company.mapper.admin.UserDAO;
import com.dev.company.vo.IPVO;
import com.dev.company.vo.UserVO;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService{
	
	@Setter(onMethod_ = @Autowired)
    private UserDAO dao;
	
	@Override
	public List<UserVO> userList(Map<String, Object> map) {
		return dao.userList(map);
	}
	
	@Override
	public int userListCnt(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.userListCnt(map);
	}

	@Override
	public int idChk(String id) {
		return dao.idChk(id);
	}
	
	@Override
	public int userAdd(Map<String, Object> map) {
		return dao.userAdd(map);
	}
	
	@Override
	public void userLog(IPVO ivo) {
		dao.userLog(ivo);
	}
	
	@Override
	public UserVO login(String id) {
		// TODO Auto-generated method stub
		return dao.login(id);
	}
	
	@Override
	public UserVO userInfo(String seq) {
		// TODO Auto-generated method stub
		return dao.userInfo(seq);
	}
	
	@Override
	public int pwdInit(Map<String, Object> map) {
		return dao.pwdInit(map);
	}
	
	@Override
	public int memoAdd(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.memoAdd(map);
	}
}

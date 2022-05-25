package com.dev.company.controller.admin;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.server.ui.LoginPageGeneratingWebFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dev.company.lib.Ip;
import com.dev.company.service.UserService;
import com.dev.company.vo.IPVO;
import com.dev.company.vo.UserVO;
import com.mysql.fabric.xmlrpc.base.Array;

import lombok.Setter;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value = "/admin/user")
@Controller
public class UserController {
	
	@Setter(onMethod_ = @Autowired)
    private UserService service;
	
	//패스워드 암호화
	@Setter(onMethod_ = @Autowired)
    BCryptPasswordEncoder pwdEncoder;
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	@RequestMapping(value = "/add")
	public String add(HttpServletRequest req) {
		return "/admin/user/add";
	}
	
	@RequestMapping(value = "/list")
	public String list(Model model) {
		
		return "/admin/user/list";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/list.do")
	public Map<String,Object> listDo( @RequestParam Map<String,Object> paramMap) {
		
		logger.info("   - paramMap : " + paramMap);
		
		int currentPage = Integer.parseInt((paramMap.get("currentPage").toString()));	// 현재 페이지 번호
		int pageSize = Integer.parseInt((String)(paramMap.get("pageSize").toString()));	// 페이지 사이즈
		int pageIndex = (currentPage-1)*pageSize;	// 페이지 시작 row 번호
		
		paramMap.put("pageIndex", pageIndex);	//리미트 조건: pageIndex부터 시작해서
		paramMap.put("pageSize", pageSize);		//pageSize값 만큼 조회할거다
		
		List<UserVO> list = service.userList(paramMap);
		int listCnt = service.userListCnt(paramMap);
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);	
		resultMap.put("listCnt", listCnt);	
		resultMap.put("pageSize", pageSize);	//10
		resultMap.put("currentPage",currentPage);	//1
		
		
		return resultMap;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public Map<String, Object> idChk(@RequestParam Map<String,Object> paramMap) {
		
		logger.info("   - paramMap : " + paramMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "SUCCESS";
		String resultMsg = "사용가능한 아이디 입니다";
		int chk = service.idChk((String)paramMap.get("id"));
		logger.info("asdsadas");
		if(chk > 0) {
			result = "FAIL";
			resultMsg = "중복된 아이디 입니다.";
		}
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("result", result);
		return resultMap;
	}
	
	@ResponseBody
	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public Map<String, Object> add(@RequestParam Map<String,Object> paramMap,HttpServletRequest request) {
		paramMap.put("status", 1);
		
		//Bcript암호화
		String inputPass = (String)paramMap.get("pwd");
		String userpass = pwdEncoder.encode(inputPass);
		paramMap.put("pwd", userpass);
		
		logger.info("   - paramMap : " + paramMap);
	
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		String result = "SUCCESS";
		String resultMsg = "회원가입이 완료되었습니다.";
		int addCnt = service.userAdd(paramMap);
		
		logger.info("   - success : " + paramMap);
		
		if(addCnt == 0) {
			result = "FAIL";
			resultMsg = "회원가입 실패";
		}
		
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("result", result);
		return resultMap;
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "/admin/user/login";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login.do")
	public Map<String,Object> loginDo(UserVO uvo, HttpServletRequest request, HttpSession session) {
		logger.info("   - uvo : " + uvo);
		
		boolean pwdMacth = false;
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		UserVO login = service.login(uvo.getId());
		String result = "SUCCESS";
		String resultMsg = "로그인이 완료되었습니다.";
		logger.info("   - login : " + login);
		if(login != null) { //로그인처리
			pwdMacth = pwdEncoder.matches(uvo.getPwd(), login.getPwd());
			if(login.getPwd() == uvo.getPwd()) {
				pwdMacth = true;
			}
			logger.info("pwdMacth = " +pwdMacth);
			if(pwdMacth) {
				session.setAttribute("admin", login); //회원정보 담기
				IPVO ivo = new IPVO(); //로그
				ivo.setIp(Ip.IpAddress(request));
				ivo.setName(login.getName());
				ivo.setSeq(login.getSeq());
				System.out.println("ivo = " + ivo);
				service.userLog(ivo);
			} else {
				result = "FAIL";
				resultMsg = "아이디 또는 비밀번호가 틀립니다.";
			}
		} else {
			result = "FAIL";
			resultMsg = "아이디 또는 비밀번호가 틀립니다.";
		}
		
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		logger.info("   - resultMap : " + resultMap);
		return resultMap;
	}
}

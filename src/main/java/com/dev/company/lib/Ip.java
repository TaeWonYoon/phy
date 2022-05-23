package com.dev.company.lib;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

public class Ip {

    public static String IpAddress(HttpServletRequest request) {
        HttpServletRequest requset = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = requset.getHeader("X-FORWARDED-FOR");
        if(ip != null) {  ip = request.getHeader("X-FORWARDED-FOR"); }
        else { ip = request.getRemoteAddr();}
        return ip;
    }

}

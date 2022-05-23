package com.dev.company.lib;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Md5 {
	
	//Md5 암호화
	public static String changeMD5(String pwd) {
	    String MD5 = "";
	    try {
	        MessageDigest md = MessageDigest.getInstance("MD5");
	        md.update(pwd.getBytes());
	        byte byteData[] = md.digest();
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < byteData.length; i++) {
	            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	        }
	        MD5 = sb.toString();

	    } catch (NoSuchAlgorithmException e) {
	        e.printStackTrace();
	        MD5 = null;
	    }
	    return MD5;
	}



	public static void main(String args[]) throws Exception {
        /* 암호화할 텍스트 */
		String text = "a";

		/* MD5 암호화  */
		String encrypt = Md5.changeMD5(text);
		String password = Md5.changeMD5(text);
        boolean pwdMacth = false;

        if (encrypt.equals(password)) {
        } else {
        }


    }
}

package com.dev.company.vo;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Data
public class UserVO {

	private int seq;
	private String name;
	private String id;
	private String pwd;
	private String phone;
	private String adderss;
	private int department;
	private int position;
	private int status;
	
}

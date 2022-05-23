package com.dev.company.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class IPVO {

	private int seq;
	private String name;
	private String ip;
	private Timestamp date;
	
}

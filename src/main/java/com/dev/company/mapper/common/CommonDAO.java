package com.dev.company.mapper.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.Setter;


public interface CommonDAO {

	public List<Map<String, Object>> list();
	
	public Map<String, Object> detail();
	
}

package com.creamyfever.wow.dao;

import java.util.ArrayList;

import com.creamyfever.wow.vo.AgeGender;

public interface GraphMapper {
	//age, gender 정보 넣기
	public int insertAgeGender(AgeGender ag);
	// 키워드에 대한 데이터 전체 출력
	public ArrayList<AgeGender> selectAgeGender(String keyword);
	
}

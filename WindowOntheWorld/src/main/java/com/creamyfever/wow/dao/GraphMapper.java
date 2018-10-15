package com.creamyfever.wow.dao;

import java.util.ArrayList;

import com.creamyfever.wow.vo.AgeGender;

public interface GraphMapper {
	//age, gender 정보 넣기
	public int insertAgeGender(AgeGender ag);
	// 키워드에 대한 데이터 전체 출력
	public ArrayList<AgeGender> selectAgeGender(String keyword);
	//대륙별 평균 구하기(사용자가 기사 쓴 리플에서 별점을 가져옴)
	public Double getAverageByContinent(String continent);
	//대륙별 리플 수
	public Integer getNumberByContinent(String continent);
	
}

package com.creamyfever.wow.dao;

import com.creamyfever.wow.vo.Members;

public interface MembersMapper {
	//회원 정보 저장
	public int insertMembers(Members members);
	//ID로 해당 회원 정보 검색
	public Members selectMembers(String id);
	//회원 정보 수정
	public int updateMembers(Members members);

}

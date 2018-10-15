package com.creamyfever.wow.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.creamyfever.wow.vo.Members;


@Repository
public class MembersDAO {
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 회원 가입 처리
	 * @param customer 사용자가 입력한 가입 정보
	 */
	public int insert(Members members) {
		MembersMapper mapper = sqlSession.getMapper(MembersMapper.class);
		
		int result = 0;
		try {
			System.out.println("0000");
			result = mapper.insertMembers(members);
			System.out.println("1111");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * ID로 회원정보 검색
	 * @param id 검색할 아이디
	 * @return 검색된 회원정보. 없으면 null.
	 */
	public Members get(String id) {
		MembersMapper mapper = sqlSession.getMapper(MembersMapper.class);
		Members c = mapper.selectMembers(id);
		return c;
	}
	
	/**
	 * 회원 정보 수정 처리
	 * @param customer 사용자가 입력한 수정 정보
	 */
	public int update(Members members) {
		MembersMapper mapper = sqlSession.getMapper(MembersMapper.class);
		
		int result = 0;
		try {
			result = mapper.updateMembers(members);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}

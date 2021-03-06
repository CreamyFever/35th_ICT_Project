package com.creamyfever.wow.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import com.creamyfever.wow.vo.Article;
import com.creamyfever.wow.vo.Discussion_log;
import com.creamyfever.wow.vo.Discussion_member;
import com.creamyfever.wow.vo.Discussion_rooms;
import com.creamyfever.wow.vo.Members;

public interface DiscussionMapper {
	public Members loginmember(String loginId);

	public int insert_dis_room(Discussion_rooms dis_room);

	public ArrayList<Discussion_rooms> printAll_dis_room(String searchText, RowBounds rb);

	public Discussion_rooms select_dis_room(int dis_no);

	public int insert_dis_member(Discussion_member dis_mem);

	public int insert_dis_log(Discussion_log dis_log);

	public ArrayList<Discussion_log> printall_dis_log(int dis_no);

	public int update_dis_grade(Discussion_rooms dis_room);

	public int select_dis_room_num();

	public double select_dis_room_grade(int roomnum);

	public int insert_dis_room_members(Discussion_member dis_mem);

	public String dis_mem(Discussion_member dis_mem);

	public String select_dis_room_members_state(Discussion_member dis_mem);
	
	public ArrayList<Discussion_rooms> select_best_dis_rooms();
	
	public ArrayList<Article> printAllArticles();
	
	public Article selectArticle(int articlenum);
	
	public int getTotal(String searchText);
}

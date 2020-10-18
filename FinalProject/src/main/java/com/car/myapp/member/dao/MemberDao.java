package com.car.myapp.member.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.car.myapp.member.dto.BookMarkDto;
import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.dto.PaginationDto;
import com.car.myapp.member.dto.verificationDto;

public interface MemberDao {
	public boolean insert(MemberDto dto);
	public boolean checkId(String user_id);
	public boolean verfication(verificationDto dto);
	public boolean checkVCode(verificationDto dto,HttpSession sessionV);
	public boolean deleteVCode(String userPhone);
	public void deleteVCodeMail(String userMail);
	public MemberDto isExistId(String user_id);
	public String getUserId(String user_phone);
	public MemberDto getUserInfo(String user_id);
	public boolean changePwd(MemberDto dto);
	public boolean checkPhone(String user_phone);
	public boolean addBookmark(BookMarkDto dto);
	public boolean deleteBookmark(BookMarkDto dto);
	public boolean deleteBookmark(String user_id);
	public boolean checkBookmark(BookMarkDto dto);
	public List<String> getFavoritList(PaginationDto dto);
	public List<String> getSalesList(PaginationDto dto);
	public int getCountF(String user_id);
	public int getCountS(String user_id);
	public boolean deleteId(String user_id);
	public void deleteAll(String user_id);
	public void deleteImage(String user_id);
}

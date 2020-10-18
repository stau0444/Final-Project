package com.car.myapp.member.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.car.myapp.member.dto.BookMarkDto;
import com.car.myapp.member.dto.MemberDto;
import com.car.myapp.member.dto.PaginationDto;
import com.car.myapp.member.dto.verificationDto;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession session;
	//회원 등록 메서드
	@Override
	public boolean insert(MemberDto dto) {
		int isSuccess=session.insert("member.insert",dto);
		if(isSuccess>0) {
			return true;
		}else {
			return false;			
		}
	}
	//아이디 중복확인 메서드
	@Override
	public boolean checkId(String user_id) {
		String isExist=session.selectOne("member.checkid",user_id);
		if(isExist==null) {
			return false;
		}else {
			return true;
		}
	}
	//유저에게 전송된 인증번호와 유저 휴대전화번호를 DB에 저장하는 메서드
	@Override
	public boolean verfication(verificationDto dto) {
		int isValid=session.insert("member.verification", dto);
		if(isValid>0) {
			return true;
		}else {
			return false;
		}
	}
	//입력한 인증번호와 저장된 인증번호와 휴대전화번호를 비교하는 메소드
	@Override
	public boolean checkVCode(verificationDto dto,HttpSession sessionV) {
		verificationDto isExist=session.selectOne("member.checkVCode", dto);
		System.out.println("isExist:"+isExist);
		if(isExist==null) {
			return false;
		}else {
			sessionV.setAttribute("isVerified", "verified");
			return true;			
		}
	}
	//저장된 인증번호를 지워주는 메서드
	@Override
	public boolean deleteVCode(String userPhone) {
		int isDelete=session.delete("member.deleteVCode",userPhone);
		if(isDelete>0) {
			return true;
		}else {
			return false;			
		}
	}
	@Override
	public void deleteVCodeMail(String userMail) {
		session.delete("member.deleteVCodeMail",userMail);
	}
	//비밀번호 찾기시 아이디가 존재하는지 확인하고 존재한다면 회원아이디와,비밀번호를 가져오는 메서드 
	@Override
	public MemberDto isExistId(String user_id) {
		MemberDto savedDto=session.selectOne("member.isExistId",user_id);
		return savedDto;
	}
	//입력한 핸드폰 번호로 등록된 아이디를 불러오는 메서드
	@Override
	public String getUserId(String user_phone) {
		String userInfo=session.selectOne("member.getUserId",user_phone);
		return userInfo;
	}
	//회원정보 전체를 가져오는 메서드
	@Override
	public MemberDto getUserInfo(String user_id) {
		MemberDto userInfo=session.selectOne("member.getUserInfo", user_id);
		return userInfo;
	}
	//본인인증후 비밀번호를 업데이트하는 메서드 
	@Override
	public boolean changePwd(MemberDto dto) {
		int isChanged=session.update("member.changePwd",dto);
		if(isChanged>0) {
			return true;
		}else {
			return false;			
		}
	}
	//본인인증시 휴대전화번호를 확인해 주는 메서드
	@Override
	public boolean checkPhone(String user_phone) {
		String isExist=session.selectOne("member.checkPhone",user_phone);
		if(isExist!=null) {
			return true;
		}else {
			return false;			
		}
	}
	//북마크 저장하는 메서드
	@Override
	public boolean addBookmark(BookMarkDto dto) {
		int isAdded=session.insert("member.addBookmark",dto);
		if(isAdded>0) {
			return true;
		}else {
			return false;			
		}
	}
	//북마크 삭제 메서드
	@Override
	public boolean deleteBookmark(BookMarkDto dto) {
		int isDeleted=session.delete("member.deleteBookmark",dto);
		if(isDeleted>0) {
			return true;
		}else {
			return false;			
		}
	}
	//북마크를 확인하는 메서드
	@Override
	public boolean checkBookmark(BookMarkDto dto) {
		BookMarkDto isChecked=session.selectOne("member.checkBookmark",dto);
		if(isChecked!=null) {
			return true;
		}else {
			return false;
		}
	}
	//북마크한 차량 불러오는 메서드
	@Override
	public List<String> getFavoritList(PaginationDto dto) {
		List<String> list=session.selectList("member.getFavoritList",dto);
		return list;
	}
	//판매차량리스트을 불러오는 메서드
	@Override
	public List<String> getSalesList(PaginationDto dto) {
		List<String> list=session.selectList("member.getSalesList",dto);
		return list;
	}
	@Override
	public int getCountF(String user_id) {
		int MaxNum=session.selectOne("member.getMaxCountF",user_id);
		System.out.println("글 갯수:"+MaxNum);
		return MaxNum;
	}
	@Override
	public int getCountS(String user_id) {
		int MaxNum=session.selectOne("member.getMaxCountS",user_id);
		System.out.println("글 갯수:"+MaxNum);
		return MaxNum;
	}
	@Override
	public boolean deleteId(String user_id) {
		int isDeleted=session.delete("member.deleteId",user_id);
		if(isDeleted>0) {
			return true;
		}else {			
			return false;
		}
	}
	@Override
	public boolean deleteBookmark(String user_id) {
		int isDeleted=session.delete("member.deleteBookMarkA",user_id);
		if(isDeleted>0) {
			return true;
		}else {			
			return false;
		}
	}
	@Override
	public void deleteAll(String user_id) {
		session.delete("member.deleteAll",user_id);
		
	}
	@Override
	public void deleteImage(String user_id) {
		session.delete("member.deleteImage",user_id);
	}
	
}

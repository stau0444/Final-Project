package com.car.myapp.review.service;

import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.car.myapp.review.dao.ReplyDao;
import com.car.myapp.review.dao.ReviewDao;
import com.car.myapp.review.dto.ReplyDto;
import com.car.myapp.review.dto.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private ReplyDao replyDao;
	
	//�� �������� ��Ÿ�� row �� ����
	final int PAGE_ROW_COUNT=10;
	//�ϴ� ���÷��� ������ ����
	final int PAGE_DISPLAY_COUNT=5;
	
	@Override
	public void getList(HttpServletRequest request) {
		//������ �������� ��ȣ
		int pageNum=1;
		//������ �������� ��ȣ�� �Ķ���ͷ� ���޵Ǵ��� �о�� ����.	
		String strPageNum=request.getParameter("pageNum");
		if(strPageNum != null){//������ ��ȣ�� �Ķ���ͷ� �Ѿ�´ٸ�
			//������ ��ȣ�� �����Ѵ�.
			pageNum=Integer.parseInt(strPageNum);
		}
		//������ ������ �������� ���� ResultSet row ��ȣ
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//������ ������ �������� �� ResultSet row ��ȣ
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		/*
			�˻� Ű���忡 ���õ� ó�� 
		*/
		String keyword=request.getParameter("keyword"); //�˻� Ű����
		String condition=request.getParameter("condition"); //�˻� ����
		if(keyword==null){//���޵� Ű���尡 ���ٸ� 
			keyword=""; //�� ���ڿ��� �־��ش�. 
			condition="";
		}
		//���ڵ��� Ű���带 �̸� ����� �д�. 
		String encodedK=URLEncoder.encode(keyword);
		
		//�˻� Ű����� startRowNum, endRowNum �� ���� FileDto ��ü ����
		ReviewDto dto=new ReviewDto();
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		
		if(!keyword.equals("")){ //���� Ű���尡 �Ѿ�´ٸ� 
			if(condition.equals("title_content")){
				//�˻� Ű���带 FileDto ��ü�� �ʵ忡 ��´�. 
				dto.setTitle(keyword);
				dto.setContent(keyword);	
			}else if(condition.equals("title")){
				dto.setTitle(keyword);
			}else if(condition.equals("writer")){
				dto.setWriter(keyword);
			}
		}
		//���� ��� ������
		List<ReviewDto> list=reviewDao.getList(dto);
		//��ü row �� ���� 
		int totalRow=reviewDao.getCount(dto);
		
		//��ü �������� ���� ���ϱ�
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//���� ������ ��ȣ
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//�� ������ ��ȣ
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//�� ������ ��ȣ�� �߸��� ���̶�� 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //�������ش�. 
		}
		
		//EL ���� ����� ���� �̸� request �� ��Ƶα�
		request.setAttribute("list", list);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);				
	}


	@Override
	public void getDetail(HttpServletRequest request) {
		//�Ķ���ͷ� ���޵Ǵ� �۹�ȣ 
		int num=Integer.parseInt(request.getParameter("num"));
		/*
		�˻� Ű���忡 ���õ� ó�� 
		*/
		String keyword=request.getParameter("keyword"); //�˻� Ű����
		String condition=request.getParameter("condition"); //�˻� ����
		if(keyword==null){//���޵� Ű���尡 ���ٸ� 
			keyword=""; //�� ���ڿ��� �־��ش�. 
			condition="";
		}
		//���ڵ��� Ű���带 �̸� ����� �д�. 
		String encodedK=URLEncoder.encode(keyword);
		
		//�۹�ȣ�� �˻� Ű���带 ���� ReviewDto ��ü ����
		ReviewDto dto=new ReviewDto();
		dto.setNum(num);//�۹�ȣ ��� 
		
		if(!keyword.equals("")){ //���� Ű���尡 �Ѿ�´ٸ� 
			if(condition.equals("title_content")){
				//�˻� Ű���带 FileDto ��ü�� �ʵ忡 ��´�. 
				dto.setTitle(keyword);
				dto.setContent(keyword);	
			}else if(condition.equals("title")){
				dto.setTitle(keyword);
			}else if(condition.equals("writer")){
				dto.setWriter(keyword);
			}
		}
		//�ڼ��� ������ �� ���� 
		ReviewDto resultDto=reviewDao.getData(dto);
		
		//view ���������� �ʿ��� ���� HttpServletRequest �� ���
		request.setAttribute("dto", resultDto);
		request.setAttribute("condition", condition);
		request.setAttribute("keyword", keyword);
		request.setAttribute("encodedK", encodedK);
		
		//�� ��ȸ�� �ø���
		reviewDao.addViewCount(num);
		
		/* 아래는 댓글 페이징 처리 관련 비즈니스 로직 입니다.*/
		final int PAGE_ROW_COUNT=5;
		final int PAGE_DISPLAY_COUNT=5;
		
		//전체 row 의 갯수를 읽어온다.
		//자세히 보여줄 글의 번호가 ref_group  번호 이다. 
		int totalRow=replyDao.getCount(num);

		//보여줄 페이지의 번호(만일 pageNum 이 넘어오지 않으면 가장 마지막 페이지)
		String strPageNum=request.getParameter("pageNum");
		//전체 페이지의 갯수 구하기
		int totalPageCount=
						(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		//일단 마지막 페이지의 댓글 목록을 보여주기로 하고 
		int pageNum=totalPageCount;
		//만일 페이지 번호가 넘어온다면
		if(strPageNum!=null) {
			//넘어온 페이지에 해당하는 댓글 목록을 보여주도록 한다. 
			pageNum=Integer.parseInt(strPageNum);
		}
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		
		//시작 페이지 번호
		int startPageNum=
			1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
		//끝 페이지 번호
		int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
		//끝 페이지 번호가 잘못된 값이라면 
		if(totalPageCount < endPageNum){
			endPageNum=totalPageCount; //보정해준다. 
		}
		
		// CafeCommentDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		ReplyDto commentDto=new ReplyDto();
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		//ref_group 번호도 담는다.
		commentDto.setRef_group(num);
		
		//DB 에서 댓글 목록을 얻어온다.
		List<ReplyDto> commentList=replyDao.getList(commentDto);
		//request 에 담아준다.
		request.setAttribute("commentList", commentList);
		request.setAttribute("totalPageCount", totalPageCount);
		request.setAttribute("startPageNum", startPageNum);
		request.setAttribute("endPageNum", endPageNum);
		request.setAttribute("pageNum", pageNum);
		
		
	}
		
	@Override
	public void saveContent(ReviewDto dto) {
		reviewDao.insert(dto);
		
	}

	@Override
	public void updateContent(ReviewDto dto) {
		reviewDao.update(dto);
		
	}

	@Override
	public void deleteContent(int num, HttpServletRequest request) {
		reviewDao.delete(num);
		
	}
	@Override
	public void saveComment(HttpServletRequest request) {
		//댓글 작성자
		String writer=(String)request.getSession().getAttribute("id");
		//폼 전송되는 댓글의 정보 얻어내기
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		String target_id=request.getParameter("target_id");
		String content=request.getParameter("content");
		/*
		 *  원글의 댓글은 comment_group 번호가 전송이 안되고
		 *  댓글의 댓글은 comment_group 번호가 전송이 된다.
		 *  따라서 null 여부를 조사하면 원글의 댓글인지 댓글의 댓글인지 판단할수 있다. 
		 */
		String comment_group=request.getParameter("comment_group");
		//새 댓글의 글번호는 dao 를 이용해서 미리 얻어낸다. 
		int seq=replyDao.getSequence();
		
		//저장할 댓글 정보를 dto 에 담기
		ReplyDto dto=new ReplyDto();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		if(comment_group==null) {//원글의 댓글인 경우 
			//댓글의 글번호가 comment_group 번호가 된다. 
			dto.setComment_group(seq);
		}else {//댓글의 댓글인 경우 
			//폼 전송된 comment_group 번호를 숫자로 바꿔서 dto 에 넣어준다.
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		//댓글 정보를 DB 에 저장한다.
		replyDao.insert(dto);
	}

	@Override
	public void deleteComment(HttpServletRequest request) {
		//GET 방식 파라미터로 전달되는 삭제할 댓글 번호 
		int num=Integer.parseInt(request.getParameter("num"));
		//세션에 저장된 로그인된 아이디
		String id=(String)request.getSession().getAttribute("id");
		//댓글의 정보를 얻어와서 댓글의 작성자와 같은지 비교 한다.
		String writer=replyDao.getData(num).getWriter();
		/*
		 * if(!writer.equals(id)) { throw new NotDeleteException("남의 댓글을 삭제할수 없습니다."); }
		 */
		replyDao.delete(num);
	}

	@Override
	public void updateComment(ReplyDto dto) {
		replyDao.update(dto);
	}

	@Override
	public void moreCommentList(HttpServletRequest request) {
		//파라미터로 전달된 pageNum 과 ref_group 번호를 읽어온다. 
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int ref_group=Integer.parseInt(request.getParameter("ref_group"));
		
		ReviewDto dto=reviewDao.getData(ref_group);
		request.setAttribute("dto", dto);
		
		/* 아래는 댓글 페이징 처리 관련 비즈니스 로직 입니다.*/
		final int PAGE_ROW_COUNT=5;
		
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum=pageNum*PAGE_ROW_COUNT;
		
		//전체 row 의 갯수를 읽어온다.
		//자세히 보여줄 글의 번호가 ref_group  번호 이다. 
		int totalRow=replyDao.getCount(ref_group);
		//전체 페이지의 갯수 구하기
		int totalPageCount=
				(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
		
		// CafeCommentDto 객체에 위에서 계산된 startRowNum 과 endRowNum 을 담는다.
		ReplyDto commentDto=new ReplyDto();
		commentDto.setStartRowNum(startRowNum);
		commentDto.setEndRowNum(endRowNum);
		//ref_group 번호도 담는다.
		commentDto.setRef_group(ref_group);
		
		//DB 에서 댓글 목록을 얻어온다.
		List<ReplyDto> commentList=replyDao.getList(commentDto);
		//request 에 담아준다.
		request.setAttribute("commentList", commentList);
		request.setAttribute("totalPageCount", totalPageCount);	
		
	}
    @Override
    public int count(int bno) {
        return 0;
    }
    

}

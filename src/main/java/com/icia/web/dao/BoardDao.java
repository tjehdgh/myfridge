package com.icia.web.dao; 

import java.util.List;

import org.springframework.stereotype.Repository;

import com.icia.web.model.QnaBoard;
import com.icia.web.model.QnaBoardAns;






@Repository("boardDao")
public interface BoardDao 
{
	//QNA게시물 등록
	public int qnaBoardInsert(QnaBoard qnaBoard);
	
	//QNA게시물 리스트
	public List<QnaBoard> qnaBoardList(QnaBoard qnaBoard);
	
	//QNA총 게시물 수
	public long qnaBoardListCount(QnaBoard qnaBoard);
		
	//QNA게시물 조회
	public QnaBoard qnaBoardSelect(long qnaSeq);
	
	//QNA게시물 그룹 순서 변경
	public int qnaBoardGroupOrderUpdate(QnaBoard qnaSeq);
					
	//QNA게시물 수정
	public int qnaBoardUpdate(QnaBoard qnaSeq);
	
	//QNA게시물 삭제
	public int qnaBoardDelete(long qnaSeq);
	
	//게시물 삭제시 답변글 조회
	public int qnaBoardAnswersCount(long qnaSeq);
	
	//답글여부
	public int qnaStatusUpdate(QnaBoard qnaBoard); 
	
	//======================답변========================
	//QNA게시물 답변등록
	public int qnaBoardAnsReplyInsert(QnaBoardAns qnaBoardAns);
	
	//QNA게시물 답변조회
	public QnaBoardAns qnaBoardAnsSelect(long qnaSeq);
	
	//QNA게시물 답변수정
	public int qnaBoardAnsUpdate(QnaBoardAns qnaSeq);
		
	//QNA게시물 답변삭제
	public int qnaBoardAnsDelete(long qnaSeq);
	
	//답글 존재여부확인
	public int qnaBoardAnsCheck(long qnaSeq);
	
	//마이페이지 문의내역 리스트(내가쓴 QnA만 있는 리스트)
	public List<QnaBoard> myQnaList(QnaBoard qnaBoard);
	
	//마이페이지 문의 내역 게시물 총개수(페이징 처리용)
	public int myQnaListTotalCount(QnaBoard qnaBoard);
	
}

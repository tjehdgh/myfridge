package com.icia.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.icia.web.dao.BoardDao;

import com.icia.web.model.QnaBoard;
import com.icia.web.model.QnaBoardAns;


@Service("boardService")
public class BoardService 
{
	private static Logger logger = LoggerFactory.getLogger(BoardService.class);
	
	//파일 저장 경로
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	
	@Autowired
	private BoardDao boardDao;
	
		//QNA게시판등록
	  	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)	
	  	public int qnaBoardInsert(QnaBoard qnaBoard) throws Exception
	  	{	
	  		int count = 0;     
	  		count = boardDao.qnaBoardInsert(qnaBoard);	  			  		
	          
	  		return count;		
	  	}
	   
	  	//QNA게시물 리스트
	  	public List<QnaBoard> qnaBoardList(QnaBoard qnaBoard)
	  	{
	  		List<QnaBoard> qnaList = null;
		   
	  		try
	  		{
	  			qnaList = boardDao.qnaBoardList(qnaBoard);
	  		}
	  		catch(Exception e)
	  		{
			  	logger.error("[BoardService] qnaBoardList Exception", e);
	  		}
		   
	  		return qnaList;
	  	}
	  	
	  //QNA총 게시물 수
	   public long qnaBoardListCount(QnaBoard qnaBoard)
	   {
	 	  long count = 0;
	 	   
	 	  try
	 	  {
	 		  count = boardDao.qnaBoardListCount(qnaBoard);
	 	  }
	 	  catch(Exception e)
	 	  {
	 		  logger.error("[BoardService] qnaBoardListCount Exception", e);
	 	  }
	 	   
	 	  	  return count;
	   }
	   //게시물 조회
	   public QnaBoard qnaBoardSelect(long qnaSeq)
	   {
		   QnaBoard qnaBoard = null;
		   
		   try
		   {
			   qnaBoard = boardDao.qnaBoardSelect(qnaSeq);
		   }
		   catch(Exception e)
		   {
			   logger.error("[BoardService] boardSelect Exception", e);
		   }
		   
		   return qnaBoard;
	   }
	   
	   
	   //게시물 보기
	   public QnaBoard qnaBoardView(long qnaSeq)
	   {
		   QnaBoard qnaBoard = null;
		   
		   try
		   {
			   qnaBoard = boardDao.qnaBoardSelect(qnaSeq);			   			   
		   }
		   catch(Exception e)
		   {
			   logger.error("[BoardService] boardView Exception", e);
		   }
		   
		   return qnaBoard;
	   }
	   
	   //qna게시물 수정폼 조회
	 	public QnaBoard qnaBoardViewUpdate(long qnaSeq)
	 	{
	 		QnaBoard qnaBoard = null;
	 		
	 		try
	 		{
	 			qnaBoard = boardDao.qnaBoardSelect(qnaSeq);
	 				 			
	 		}
	 		catch(Exception e)
	 		{
	 			logger.error("[BoardService] qnaBoardViewUpdate Exception", e);
	 		}
	 		
	 		return qnaBoard;
	 	}
	 	
	 	//게시물 수정
	 	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	 	public int qnaBoardUpdate(QnaBoard qnaBoard) throws Exception
	 	{
	 		int count = boardDao.qnaBoardUpdate(qnaBoard);
	 			 			 			 		
	 		return count;
	 	}
	   
	 	
	 	//게시물 삭제시 답변글 수 조회
	 	public int qnaBoardAnswersCount(long qnaSeq)
	 	{
	 		int count = 0;
	 		
	 		try
	 		{
	 			count = boardDao.qnaBoardAnswersCount(qnaSeq);
	 		}
	 		catch(Exception e)
	 		{
	 			logger.error("[BoardService] boardAnswersCount Exception", e);
	 		}
	 		
	 		return count;
	 	}
	 	
	 	//QNA게시물 삭제
	 	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	 	public int qnaBoardDelete(long qnaSeq) throws Exception
	 	{
	 		int count = 0;
	 		QnaBoard qnaBoard = qnaBoardViewUpdate(qnaSeq);
	 		
	 		if(qnaBoard != null)
	 		{
	 			count = boardDao.qnaBoardDelete(qnaSeq);	 			 			
	 		}
	 		
	 		return count;
	 	}
	 	
	 	//댓글여부
	 	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	 	public int qnaStatusUpdate(QnaBoard qnaBoard) throws Exception
	 	{
	 		int count = boardDao.qnaStatusUpdate(qnaBoard);
	 			 			 			 		
	 		return count;
	 	}
	   
	 	//게시물 답글 등록
		@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
		public int qnaBoardAnsReplyInsert(QnaBoardAns qnaBoardAns) throws Exception
		{
			int count = 0;
			   			
			count = boardDao.qnaBoardAnsReplyInsert(qnaBoardAns);
			   		   		   
			return count;
		}
		
		//게시물 답글조회
		public QnaBoardAns qnaBoardAnsSelect(long qnaSeq)
		{
			QnaBoardAns qnaBoardAns = null;
				   
			try
			{
				qnaBoardAns = boardDao.qnaBoardAnsSelect(qnaSeq);
			}
			catch(Exception e)
			{
				logger.error("[BoardService] boardSelect Exception", e);
			}
			
			return qnaBoardAns;
		}
		
		   //답변게시물 수정폼 조회
		 	public QnaBoardAns adminQnaBoardViewUpdate(long qnaSeq)
		 	{
		 		QnaBoardAns qnaBoardAns = null;
		 		
		 		try
		 		{
		 			qnaBoardAns = boardDao.qnaBoardAnsSelect(qnaSeq);
		 				 			
		 		}
		 		catch(Exception e)
		 		{
		 			logger.error("[BoardService] adminQnaBoardViewUpdate Exception", e);
		 		}
		 		
		 		return qnaBoardAns;
		 	}
	 	
		//게시물 답글수정
	 	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	 	public int qnaBoardAnsUpdate(QnaBoardAns qnaBoardAns) throws Exception
	 	{
	 		int count =0;
	 
	 			 count = boardDao.qnaBoardAnsUpdate(qnaBoardAns);
	 		
	 	
	 	
	 			return count;
	 		
	 		
	 	}
	 	
	 	//QNA게시물 답글삭제
	 	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	 	public int qnaBoardAnsDelete(long qnaSeq) throws Exception
	 	{
	 		int count = 0;
	 		QnaBoard qnaBoard = qnaBoardViewUpdate(qnaSeq);
	 		
	 		if(qnaBoard != null)
	 		{
	 			count = boardDao.qnaBoardDelete(qnaSeq);	 			 			
	 		}
	 		
	 		return count;
	 	}
	 	
	 	
	 	public int qnaBoardAnsCheck(long qnaSeq)
	 	{
	 		int count = 0;
			   
			try
			{
				count = boardDao.qnaBoardAnsCheck(qnaSeq);
			}
			catch(Exception e)
			{
				logger.error("[BoardService] qnaBoardAnsCheck Exception", e);
			}
			
			return count;
	 	}
	 	
}

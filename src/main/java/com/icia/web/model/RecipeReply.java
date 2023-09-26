package com.icia.web.model;

import java.io.Serializable;

public class RecipeReply implements Serializable
{
   private static final long serialVersionUID = 1L;
   
   private String userId;            //사용자 아이디
   private String replyContent;      //댓글 내용
   private int recipeCode;            //레시피 코드
   private String regDate;            //댓글 등록일
   private String userNickname;      //유저 닉네임
   private String fileExt;            //사용자 프로필 파일명
   
   //sql문에 넣을려고 작성
   private long startRow;            //시작 rownum
   private long endRow;            //끝 rownum
   
   public RecipeReply()
   {
      userId = "";
      replyContent = "";
      recipeCode = 0;
      regDate = "";
      userNickname = "";
      fileExt = "";
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getReplyContent() {
      return replyContent;
   }

   public void setReplyContent(String replyContent) {
      this.replyContent = replyContent;
   }

   public int getRecipeCode() {
      return recipeCode;
   }

   public void setRecipeCode(int recipeCode) {
      this.recipeCode = recipeCode;
   }

   public String getRegDate() {
      return regDate;
   }

   public void setRegDate(String regDate) {
      this.regDate = regDate;
   }

   public String getUserNickname() {
      return userNickname;
   }

   public void setUserNickname(String userNickname) {
      this.userNickname = userNickname;
   }

   public long getStartRow() {
      return startRow;
   }

   public void setStartRow(long startRow) {
      this.startRow = startRow;
   }

   public long getEndRow() {
      return endRow;
   }

   public void setEndRow(long endRow) {
      this.endRow = endRow;
   }

   public String getFileExt() {
      return fileExt;
   }

   public void setFileExt(String fileExt) {
      this.fileExt = fileExt;
   }
   
   
   
}
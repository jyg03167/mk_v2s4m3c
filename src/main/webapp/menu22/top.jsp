<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value='${pageContext.request.contextPath}'/>
<DIV class='container' style='width: 100%;'> 
  <!-- 화면 상단 메뉴 -->
  <DIV id='top_menu'' class='top_menu'>
   <DIV class='top_menu_label'>Meal Kit</DIV>
    <NAV class='top_menu_list'>
      <span style='padding-left: 0.5%;'></span>
      <A class='menu_link'  href='${root}' >HOME</A> <span class='top_menu1'> | </span>
      <%-- 
      <c:choose>
        <c:when test="${sessionScope.id == null}">
          <A class='menu_link'  href='${root}/member/login.do' >Login</A> <span class='top_menu1'> | </span>
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A class='menu_link'  href='${root}/member/logout.do' >Logout</A> <span class='top_menu1'> | </span>
        </c:otherwise>
      </c:choose>
      
        <A class='menu_link'  href='${root}/categrp/list.do'>카테고리 그룹</A> <span class='top_menu1'> | </span>    
        <A class='menu_link'  href='${root}/contents/list_all.do'>전체글</A> <span class='top_menu1'> | </span>    
        <A class='menu_link'  href='${root}/member/list.do'>회원목록</A> <span class='top_menu1'> | </span>  
      
           --%>
                 
        <A class='menu_link'  href='${root}/cartgrp/list.do'>장바구니 그룹</A> <span class='top_menu1'> | </span> 
        <A class='menu_link'  href='${root}/cart/list_all.do'>장바구니 목록</A> <span class='top_menu1'> | </span>    
    </NAV>
  </DIV>
  
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-md-2"> <!-- 메뉴 출력 컬럼 -->
      <img src='${root}/menu/images/myimage.png' style='width: 100%;'>
      <div style='margin-top: 5px;'>
        <img src='${root}/menu/images/myface.png'>Meal Kit
      </div>
    </div>
      
    <DIV class="col-md-10 cont">  <!-- 내용 출력 컬럼 -->  
   
<DIV class='content'>
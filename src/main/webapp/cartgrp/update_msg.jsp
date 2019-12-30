<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
           
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
<body>
 
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${param.count == 1 }">
           <script type="text/javascript">
             opener.location.reload(); //카테고리 목록 새로고침
             window.close();            //창닫기
           </script>
        </c:when>
        <c:otherwise>
          <LI class="li_none">
            <span class='span_fail'>새로운 카테고리 그룹 수정에 실패했습니다.</span>
            </LI>
            
          <LI class="li_none">
            <span class='span_fail'>다시 시도해주세요.</span>
          </LI>
          
         </c:otherwise>
      </c:choose>
      <LI class='li_none'>
        <br>
        <button type='button' onclick="location.href='./update.do?categrpno=${param.categrpno}'">다시 수정</button>
        <button type='button' onclick="window.close();">닫기</button>
      </LI>
    </UL>
  </fieldset>

</DIV>
</body>

</html>
  
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

  <!-- jQuery -->
  <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>

  <!-- Fotorama -->
  <link href="fotorama.css" rel="stylesheet">
  <script src="fotorama.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
    function panel_img(file) {
    var tag = "";
    tag   = "<A href=\"javascript: $('#pdatfile_panel').hide();\">";
    tag += "  <IMG src='../pdatfile/storage/" + file + "' style='width: 80%;'>"; 
    tag += "</A>";
    
    $('#pdatfile_panel').html(tag);
    $('#pdatfile_panel').show();
  } 
</script>
</head>

<body>
<c:set var="productcateno" value="${productcateVO.productcateno}" />
<c:set var="pdcontentsno" value="${pdcontentsVO.pdcontentsno }" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../productcate/list.do'>카테고리 그룹</A> > 
    <A href='./list.do?productcateno=${productcateno }'>${productcateVO.name }</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?productcateno=${productcateno }'>목록</A>
    <span class='menu_divide' > | </span> 
    <A href='./update.do?productcateno=${productcateno }&pdcontentsno=${pdcontentsno}'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./update_thumb.do?productcateno=${productcateno }&pdcontentsno=${pdcontentsno}'>썸네일 수정</A>
    <span class='menu_divide' > | </span> 
    <a href="../pdatfile/create.do?pdcontentsno=${pdcontentsno}&productcateno=${productcateVO.productcateno}">첨부 파일 등록</A>
    <span class='menu_divide' > | </span> 
    <a href="./file_delete.do?pdcontentsno=${pdcontentsno}&productcateno=${productcateVO.productcateno}">첨부 파일 삭제</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?productcateno=${productcateno }&pdcontentsno=${pdcontentsno}'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="pdcontentsno" value="${pdcontentsno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span class="glyphicon glyphicon-list-alt"></span> 
            <span>${pdcontentsVO.title}</span>
            (<span>${pdcontentsVO.recom}</span>)
            <span>${pdcontentsVO.rdate.substring(0, 16)}</span>
          </li>
        </ul>
          <DIV style='padding-top: 8px; '>
          <!-- 상세 상단 -->
          <DIV style='width: 1180px; margin: 0 auto;'> 
          <!-- 상단 좌측 -->
            <div class="fotorama" style= 'float: left; width: 600px;' data-autoplay="5000" data-nav="thumbs" data-width="1000" data-ratio="800/520" data-max-width="60%">
              <c:forEach var="pdatfileVO" items="${pdatfile_list }">
              <c:set var="thumb" value="${pdatfileVO.thumb.toLowerCase() }" />
            <c:choose>
              <c:when
                test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                <A href="../pdatfile/storage/${pdatfileVO.fname }"><IMG
                  src='../pdatfile/storage/${thumb }'
                  style='margin-top: 2px;'></A>
              </c:when>
            </c:choose>
          </c:forEach>
            </div>
            <!-- 상단 좌측 끝-->
            <!-- 상단 우측 -->
           <div style='float: right; width: 500px;'>
              <DIV>
                    <d1 style='padding-top: 10px;'>
                      <dt>판매가</dt>
                      <dd><span style='box-sizing: border-box;'>${pdcontentsVO.price}</span></dd>
                    </d1>
              </DIV>
              <DIV style='margin-top: 16px;'>
                  
              </DIV>
           <div>
           </div>    
          </div>    <!-- 상단 우측 끝-->    
        </DIV> <!-- 상세 상단 끝 -->
        <!-- 상세 하단 -->
        <DIV style='position: relative; margin-top: 230px; min-width: 1180px; padding-top: 64px;'>
          <li class="li_none">
            <DIV>${pdcontentsVO.content }</DIV>
          </li>
          <li class="li_none">
            <DIV style='text-decoration: none;'>
              <span class="glyphicon glyphicon-search"></span>
              검색어(키워드): ${pdcontentsVO.word }
            </DIV>
          </li>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
           ${productcateVO.name } 목록
           </li>
          <li class="li_none">
          <c:forEach var="pdcontentsVO" items="${pdcontents_list }">
          <c:set var="pdcontentsno" value="${pdcontentsVO.pdcontentsno }" />
            <a href="./read.do?pdcontentsno=${pdcontentsno}" >${pdcontentsVO.title}</a><br>
          </c:forEach>
          </li>
        </DIV>
        </DIV>
              </ul>
              
      <%--           <li class="li_none">
            <DIV>
              <span class="glyphicon glyphicon-download-alt"></span>
              파일명을 클릭하면 다운로드가 가능합니다.
              <A href='../attachfile/downzip.do?pdcontentsno=${pdcontentsno}'><IMG src='./images/zip.png' title='zip 파일 다운로드'></A> 
            </DIV>
            <DIV>
              <c:forEach var="pdatfileVO" items="${pdatfile_list }">
                <c:set var="fname" value="${pdatfileVO.fname.toLowerCase() }" />
                <A href='${root}/download2?dir=/pdattachfile/storage&filename=${pdatfileVO.fupname}&downname=${pdatfileVO.fname}'>${pdatfileVO.fname}</A> /              
              </c:forEach>
            </DIV>  
          </li>     --%>                
  
      </fieldset>
  </FORM>
        
        
        
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  
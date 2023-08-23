<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script>
  
</script>



<% 
String contextPath12 = request.getContextPath();
String redirectmso= contextPath12 + "/userboard/memberSearchone.do";
String redirectmain= "http://localhost:8080" + contextPath12 + "/index.jsp";


String redirectjquery = "http://localhost:8080" + contextPath12 + "/js/jquery-3.7.0.min.js";

String infodo = "http://localhost:8080" + contextPath12 + "/BookInfo.do";
String reviewinfodo = "http://localhost:8080" + contextPath12 + "/review.do";
String mypagetinfodo = "http://localhost:8080" + contextPath12 + "/mypagetinfo.do";


%> 

<script>
function loadPage(url) {
	  document.getElementById("pageFrame").src = url;
	}
</script>

<meta charset="UTF-8">
<title>마이페이지</title>

<script src="<%=redirectjquery%>"></script>


<link rel="stylesheet" href="<%=redirectmain%>"> 



</head>
<body>
<header class="he2"><%@ include file="../header2.jsp" %></header>
<header><%@ include file="../header.jsp" %></header>
<style>
#mypage{
	padding-top:80px;
	padding-left:50px;
	text-align:center;
	font-size: 40px;
	color:#fff;}

.navside{
	top:120px;
  box-sizing:border-box;
  width:250px;
  position: absolute;
  bottom:0;
  background: rgba(0,0,0,0.7); 
  border-radius:10px;
  box-shadow:5px 7px 10px rgba(0,0,0,.5);
  }
  .navside h1{
  color:#fff;
  }
.navside ul {
  position:relative;
  list-style-type:none;
  }
.navside ul li a{
  display:flex;
  align-items:center;
  font-size:1.15em;
  text-decoration:none;
  text-transform:capitalize;
  color:#fff;
  padding:20px 40px;
  height: 50px;
  transition: .5s ease;
  border-radius: 0 30px;
}
.navside ul li a:hover{
	background: rgba(0,0,0,0.7);
	color: #cyan;
}
.navside  ul ul{
position:absolute;
left:210px;
width:220px;
top:0;
display:none;
background: rgba(155,39,176, .4);
border-radius:6px;
box-shadow:1px 2px 10px rgba(0,0,0, .1);

}
.navside ul span{
	position: absolute;
	right:20px;
	font-size:1.5em;
}

.navside  ul .sidropdown{
	position:relative;
}
.navside  ul .sidropdown:hover ul{
	display:initial;
}

#pageFrame {
 width: 80%;
 left:300px;
 top:200px;
 height:800px;
  position:absolute;
 
   
 /*  border: none; */
/*   z-index: 10000; */
/* border-image:url("${pageContext.request.contextPath }/resources/img/wavebox.png"); */
}
	
</style>
	<%-- <img class="mainpark" src="${pageContext.request.contextPath }/resources/img/park.jpg"> --%>
	<iframe id="pageFrame" src=""></iframe>
<section>
          
	<div class="navside">
   	 <span id ="mypage">마이페이지</span>
        <ul>
       <li class="sidropdown"><a href="#" >개인정보<span>&rsaquo;</span></a>
          	<ul>
            	<li><a href="#" onclick="loadPage('<%=mypagetinfodo%>')">내정보</a></li>
          	</ul>
        </li>
        <li class="sidropdown"><a href="#" >결제 내역<span>&rsaquo;</span></a>
          	<ul> 
          		 <li><a href="#" onclick="loadPage('<%=infodo%>')">예매내역</a></li>
           		 <li><a href="#" onclick="loadPage('')">취소</a></li>
        	</ul>
        </li>	
        <li class="sidropdown"><a href="#">작성글<span>&rsaquo;</span></a>
        	<ul>
            	<li><a href="#" onclick="loadPage('<%=reviewinfodo%>')">리뷰</a></li>
          	</ul>
       </li>
       
       
      </ul>
       
    </div>
  
</section>

 
  <br><br><br><br>
  <footer>

  </footer>
</body>
</html>
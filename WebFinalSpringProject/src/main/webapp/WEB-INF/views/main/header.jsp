<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header>
			<section class="headersection1">
				<span class="middle"><a href="../board"><img class="logo"
						src="<%=request.getContextPath() + "/resources/image/khlogo.png"%>"
						alt="로고"></a></span>
			</section>

			<section class="headersection2">
				<span id="line" class="middle"><a
					href="${pageContext.request.contextPath}/account/mypage">마이페이지</a></span>
				<span id="line" class="middle"><a href="${pageContext.request.contextPath}/account/logout">로그아웃</a></span>
			</section>
		</header>
package com.web.finalproj.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(
	urlPatterns = {
		"/account/mypage"
	}	// 정규표현식 a, u, d라고 하는 문자로 시작하는 주소, * 은 0번 이상이다
)
public class LoginCheckFilter implements Filter {

    public LoginCheckFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// session 정보 중 login 과 관련한 세션 정보 값이 존재하는지 확인하여 Login 검사
		HttpServletRequest req = (HttpServletRequest)request;	// 다운 시켜야 가져올 수 있다
		HttpServletResponse resp = (HttpServletResponse)response;
		HttpSession session = req.getSession();
		
		if(session.getAttribute("logined") != null) {
			if((boolean)session.getAttribute("logined")) {
				if(session.getAttribute("account") != null) {
					chain.doFilter(request, response);	// 다음 필터로 이동 시킨다.
				} else {
					session.invalidate();	// 세션 무효화
					resp.sendRedirect(req.getContextPath() + "/account/login");
				}
			} else {
				resp.sendRedirect(req.getContextPath() + "/account/login");
			}
		} else {
			resp.sendRedirect(req.getContextPath() + "/account/login");
		}
		
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}

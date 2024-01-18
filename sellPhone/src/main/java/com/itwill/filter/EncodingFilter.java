package com.itwill.filter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class EncodingFilter implements Filter {
	private String encoding = null;
	
	public void init(FilterConfig filterConfig) throws ServletException {
		this.encoding = filterConfig.getInitParameter("encoding");
		System.out.println("생성직후 단한번호출 init(): encoding parameter-->"
					+ encoding);
	}
	
	public void doFilter(
		ServletRequest request,
		ServletResponse response,
		FilterChain chain)
		throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		System.out.println(">>>>요청시마다 호출 doFilter():"+req.getRequestURI());
		//요청객체인코딩설정
		req.setCharacterEncoding(this.encoding);
		//클라이언트요청리소스(*.jsp,servlet)로요청
		chain.doFilter(request, response);
	}
	
	public void destroy() {
		//System.out.println("필터객체가 메모리에서 해지될때호출 destroy()");
		this.encoding = null;
	}
	
}

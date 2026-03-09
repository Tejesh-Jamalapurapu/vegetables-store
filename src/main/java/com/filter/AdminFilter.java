package com.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/*")
public class AdminFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		String uri = req.getRequestURI();

		// Allow login page and login servlet without authentication
		if (uri.contains("admin-login.jsp") || uri.contains("adminLogin")) {
			chain.doFilter(request, response);
			return;
		}

		// Check only admin pages
		if (uri.contains("admin")) {

			HttpSession session = req.getSession(false);

			if (session == null || session.getAttribute("admin") == null) {
				res.sendRedirect("admin-login.jsp");
				return;
			}
		}

		chain.doFilter(request, response);
	}
}
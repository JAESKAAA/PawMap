package com.pawmap.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {

	public static void setAttribute(HttpServletResponse response, String key, String value) {
		addCookie(response, key, value);
	}

	public static String getAttribute(HttpServletRequest request, String key) {
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(key)) {
					return cookie.getValue();
				}
			}
		}

		return null;
	}

	public static void deleteAttribute(HttpServletResponse response, String key) {
		Cookie cookieForDelete = new Cookie(key, "");
		cookieForDelete.setMaxAge(0);
		response.addCookie(cookieForDelete);
	}

	private static void addCookie(HttpServletResponse response, String key, String value) {
		Cookie cookie = new Cookie(key, value);
		cookie.setMaxAge(60 * 60 * 24 * 365 * 10);
		response.addCookie(cookie);
	}
}

package com.sxs.common.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sxs.domain.User;

/**
 * 
 * @ClassName: BaseAction
 * @Description: 其他Action都应该继承此类，BaseAction封装与页面数据交互的基本方法
 * @author: tank
 * @date: 2017年2月17日 上午9:22:26
 */
public class BaseAction {
	
	protected HttpServletRequest request; 
    protected HttpServletResponse response;
    @ModelAttribute
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public HttpServletResponse getResponse() {
		return response;
	}
	@ModelAttribute
	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}
	protected HttpSession getSession() {
		return request.getSession();
	}
	protected void setSessionUser(User sessionUser) {
		getSession().setAttribute("session_user", sessionUser);
	}
	protected User getSessionUser() {
		return (User)getSession().getAttribute("session_user");
	}
	protected String jsonOut(Object jsonObject) throws Exception {
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonString = objectMapper.writeValueAsString(jsonObject);
		HttpServletResponse response = getResponse();
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().print(jsonString);
		return null;
	}

	protected String xmlOut(String xmlString) throws Exception {
		HttpServletResponse response = getResponse();
		response.setContentType("text/xml;charset=UTF-8");
		response.getWriter().print(xmlString);
		return null;
	}

	protected String htmlOut(String htmlString) throws Exception {
		HttpServletResponse response = getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(htmlString);

		return null;
	}
	protected String getRemoteAddr() {
		return request.getRemoteAddr();
	}
	
	/**
	 * 
	 * @Title: subStr
	 * @Description: 根据length截取字符串（length值传入总长度即可）
	 * @param s
	 * @param length
	 * @return
	 * @return: String
	 */
	protected String subStr(String s,int length){
		if(s!=null && !"".equals(s)){
			if(s.length()<=length){
				return s;
			}else{
				return s.substring(0,length)+"...";
					
			}
		}else{
			return "";
		}
	}
}

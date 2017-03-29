package com.sxs.error;

import java.util.HashMap;
import java.util.Map;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sxs.common.action.BaseAction;

/**
 * 
 * @ClassName: ErrorAction
 * @Description: 异常页面跳转
 * @author: tank
 * @date: 2017年2月17日 上午9:33:25
 */
@Controller
@RequestMapping(value="/error")
public class ErrorAction extends BaseAction{
	
	@RequestMapping(value="/{page}", method=RequestMethod.GET)
	public ModelAndView goError(@PathVariable int page) throws Exception {
		Map<String, Object> map=new HashMap<String, Object>();
		return new ModelAndView("/error/"+page,map);
	}
	
}

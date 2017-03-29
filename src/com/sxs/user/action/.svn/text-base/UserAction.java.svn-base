package com.sxs.user.action;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.sxs.common.action.BaseAction;
import com.sxs.common.model.Result;
import com.sxs.common.util.ApplicationExectpion;
import com.sxs.common.util.DateUtil;
import com.sxs.common.util.Md5Utils;
import com.sxs.common.util.PaginationVO;
import com.sxs.domain.Systemlog;
import com.sxs.domain.User;
import com.sxs.fileupload.service.FileUploadService;
import com.sxs.fileupload.service.IFileUploadService;
import com.sxs.user.service.IUserService;

/**
 * 
 * <p>Title:UserAction</p>
 * <p>Description:</p>
 * <p>Company:</p>
 * @author tmk 
 * @date 2017年2月16日 下午5:06:37
 */

@Controller
@RequestMapping("/user")
public class UserAction extends BaseAction{
	
	public Logger logger =LoggerFactory.getLogger(UserAction.class);
	@Resource
	private IUserService userService;
	
	@Resource
	private IFileUploadService fileService;
	
	@RequestMapping("/user")
	public ModelAndView user() throws IOException{
		return new ModelAndView("/user/user");
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/savevUser")
	public String save(@RequestParam(defaultValue = "") String username,
			@RequestParam(defaultValue = "") String password,
			@RequestParam(defaultValue = "") String tel) throws Exception{
		User user = new User();
		user.setPassWord(Md5Utils.MD5(password));
		user.setAccount(username);
		user.setDesc1(tel);
		user.setCreateTime(DateUtil.getDateString());
		User u = userService.findUserByAccount(username);
		Map jsonMap = new HashMap();
		if(u == null){
			if("admin".equals(getSessionUser().getAccount())){
				user.setUserType("管理员");
			}else{
				user.setUserType("普通用户");
			}
			userService.save(user);
			Systemlog systemlog = new Systemlog();
			systemlog.setCreateTime(DateUtil.getDateString());
			systemlog.setUser(getSessionUser());
			systemlog.setLogtype("增加新用户");
			systemlog.setDescription("管理员" + getSessionUser().getAccount() + "增加新用户"
					+ user.getAccount());
			
			jsonMap.put("msg", "添加用户成功");
		}else {
			jsonMap.put("msg", "用户名已经存在");
		}
		return jsonOut(jsonMap);
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/queryUser")
	public String query() throws Exception{
		PaginationVO<User> pagination = userService.findUserByPage();
		Map jsonMap = new HashMap();
		jsonMap.put("total", pagination.getTotal());
		List jsonList = new ArrayList();
		for (User u : pagination.getList()) {
			Map itemMap = new HashMap();
			itemMap.put("id", u.getId());
			itemMap.put("account", u.getAccount());
			itemMap.put("tel", u.getDesc1());
			if (u.getUserType() != null) {
				itemMap.put("type", u.getUserType());
			} else {
				itemMap.put("type", "超级管理员");
			}
			itemMap.put("createTime", u.getCreateTime()==null?"":u.getCreateTime());
			jsonList.add(itemMap);
		}
		jsonMap.put("data", jsonList);
		return jsonOut(jsonMap);
	}
	@RequestMapping("/login")
	public ModelAndView login() throws IOException{
		return new ModelAndView("login");
	}
	
 /**
  * 用户登录
  * @param account
  * @param passWord
  * @param pass
  * @return
  * @throws Exception
  */
	@RequestMapping(value="/loginin",method=RequestMethod.POST)
	public String loginin(@RequestParam(defaultValue = "") String account,
			@RequestParam(defaultValue = "") String passWord,
			@RequestParam(defaultValue = "") String pass) throws Exception {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		Date now = new Date();
		String ds  = new SimpleDateFormat("yyyyMMddHHmm").format(now);
		String ds1 = new SimpleDateFormat("yyyyMMddHHmm").format(new Date(now.getTime()-60000));
		String ds2 = new SimpleDateFormat("yyyyMMddHHmm").format(new Date(now.getTime()+60000));
		
		User user=userService.findUserByAccount(account);
		boolean codeValidate = true;
		if(user==null){
			jsonMap.put("success", false);
			jsonMap.put("error", "您输入的用户名不存在，请重新输入...");
			return jsonOut(jsonMap);
		}
		
		if(codeValidate ){
			try {
				User loginUser = userService.login(account, passWord);
				jsonMap.put("success", true);
				loginUser.setLastLoginTime(DateUtil.getDateString());//记录登录时间
				//记录登陆总次数
				if(loginUser.getLoginCount() != null){
					loginUser.setLoginCount(loginUser.getLoginCount() + 1);
				}else {
					loginUser.setLoginCount(1);
				}
				userService.update(loginUser);
				// 将登录信息，放到session中(session默认是内存中的一个对象,这个对象就是HttpSession
				// session也可以配置到数据中)
				setSessionUser(loginUser);

				// 日志记录
				Systemlog systemlog = new Systemlog();
				systemlog.setCreateTime(DateUtil.getDateString());
				systemlog.setUser(getSessionUser());
				systemlog.setLogtype("登录");
				systemlog.setDescription("用户" + getSessionUser().getAccount()
						+ "登录" + "系统,登录的IP为：" + getRemoteAddr());

			} catch (ApplicationExectpion ae) {
				jsonMap.put("success", false);
				jsonMap.put("error", ae.getMessage());
			} catch (Exception ex) {
				jsonMap.put("success", false);
				jsonMap.put("error", "系统发生意外故障，请稍后再试.....");
			}
		}else {
			jsonMap.put("error", "认证码输入错误请确认.....");
		}
		File file =new File("D:\\1.jpg");
		Result rs =fileService.uploadByteFile(file);
		System.out.println("~~~~~~~~~~~~~~~~"+JSON.toJSONString(rs));
		logger.info("图片上传结束！",JSON.toJSON(rs));
		return jsonOut(jsonMap);
	}
	
	/**
	 * 用户注销（返回登录界面）
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/loginOff")
	public ModelAndView loginOff() throws IOException{
		User user = getSessionUser();

		Systemlog systemlog = new Systemlog();
		systemlog.setCreateTime(DateUtil.getDateString());
		systemlog.setUser(user);
		systemlog.setLogtype("注销系统");
		systemlog.setDescription("用户" + user.getAccount()
				+  "注销系统.......");
		setSessionUser(null);
		return new ModelAndView("/login");
	}
	
	/**
	 * 删除用户
	 * @param idstr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(@RequestParam(defaultValue = "") String idstr) throws Exception {
		String[] ids= idstr.split(",");
		Integer num = ids.length;
		StringBuilder sb = new StringBuilder();
		for (String id : ids) {
			String acc = userService.get(Integer.parseInt(id)).getAccount();
			sb.append(",*" + acc + "*");
		}
		userService.deleteUsers(ids);
		Systemlog systemlog = new Systemlog();
		systemlog.setCreateTime(DateUtil.getDateString());
		systemlog.setUser(getSessionUser());
		systemlog.setLogtype("删除用户");
		systemlog.setDescription("管理员" + getSessionUser().getAccount() + "删除了"
				+ num + "个用户,用户名分别为" + sb.toString());
		return "SUCCESS";
	}
	
	/**
	 * 重置密码（修改其他用户信息） 
	 * @param idstr
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateUser")
	@ResponseBody
	public String updateResettingUser(@RequestParam(defaultValue = "") String idstr) throws Exception {
		String[] ids= idstr.split(",");
		StringBuilder sb = new StringBuilder();
		for (String id : ids) {
			User dbUser = userService.get(Integer.parseInt(id));
			dbUser.setPassWord(Md5Utils.MD5("666666"));
			userService.update(dbUser);
			String acc = userService.get(Integer.parseInt(id)).getAccount();
			sb.append(",*" + acc + "*");
		}
		Systemlog systemlog = new Systemlog();
		systemlog.setCreateTime(DateUtil.getDateString());
		systemlog.setUser(getSessionUser());
		systemlog.setLogtype("重置密码");
		systemlog.setDescription("管理员" + getSessionUser().getAccount()+"重置用户"+ sb.toString() + "的密码");
		return "SUCCESS";
		
	}
	
	/**
	 * ${session_user.account}
	 * 修改密码（修改本人信息）
	 * @param passWord
	 * @param tel
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updatemyUser")
	@ResponseBody
	public String updatemyUser(@RequestParam(defaultValue = "") String passWord,@RequestParam(defaultValue = "") String tel) throws Exception {
			if(passWord != null && !"".equals(passWord)){
				getSessionUser().setPassWord(Md5Utils.MD5(passWord));
			}
			if(!getSessionUser().getDesc1().equals(tel)){
				getSessionUser().setDesc1(tel);
			}
			userService.update(getSessionUser());

			Systemlog systemlog = new Systemlog();
			systemlog.setCreateTime(DateUtil.getDateString());
			systemlog.setUser(getSessionUser());
			systemlog.setLogtype("修改密码");
			systemlog.setDescription("用户" + getSessionUser().getAccount()
					+ "修改自己的密码");
		return "s";
		
	}
	
	private int nextInt(){
		return (int)((Math.random()*9+1)*100000);
	}
}

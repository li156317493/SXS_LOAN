package com.sxs.common.util;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

/**
 * 
 * @ClassName: ResourcePathExposer
 * @Description: 通过Spring框架在ServletContext层面注入静态资源根路径信息(asda)
 * @author: tank
 * @date: 2017年2月17日 上午9:29:24
 */
public class ResourcePathExposer implements ServletContextAware {
	
    private ServletContext application;
    private String imagesRoot;
    private String scriptsRoot;
    private String stylesRoot;
    /*
     * 初始化方法
     */
    public void init() {
    	if("/".equals(getServletContext().getContextPath())){
    		getServletContext().setAttribute("imagesRoot", imagesRoot);
            getServletContext().setAttribute("scriptsRoot",scriptsRoot);
            getServletContext().setAttribute("stylesRoot", stylesRoot);
            getServletContext().setAttribute("contextPath", getServletContext().getContextPath());
    	}else {
    		getServletContext().setAttribute("imagesRoot", imagesRoot);
            getServletContext().setAttribute("scriptsRoot", scriptsRoot);
            getServletContext().setAttribute("stylesRoot", stylesRoot);
            getServletContext().setAttribute("contextPath", getServletContext().getContextPath());
		}
        
    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        application = servletContext;

    }

    public ServletContext getServletContext() {
        return this.application;
    }

	public ServletContext getApplication() {
		return application;
	}

	public void setApplication(ServletContext application) {
		this.application = application;
	}

	public String getImagesRoot() {
		return imagesRoot;
	}

	public void setImagesRoot(String imagesRoot) {
		this.imagesRoot = imagesRoot;
	}

	public String getScriptsRoot() {
		return scriptsRoot;
	}

	public void setScriptsRoot(String scriptsRoot) {
		this.scriptsRoot = scriptsRoot;
	}

	public String getStylesRoot() {
		return stylesRoot;
	}

	public void setStylesRoot(String stylesRoot) {
		this.stylesRoot = stylesRoot;
	}

}

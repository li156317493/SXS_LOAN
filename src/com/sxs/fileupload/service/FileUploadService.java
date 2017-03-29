package com.sxs.fileupload.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.gridfs.GridFsTemplate;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.util.Base64;
import com.sxs.common.model.Constant;
import com.sxs.common.model.Result;
import com.sxs.common.util.UUIDUtil;
import com.sxs.fileupload.model.FileUploadReq;

@Service
public class FileUploadService implements IFileUploadService{
	public Logger logger =LoggerFactory.getLogger(FileUploadService.class);
	
	@Autowired
	private GridFsTemplate gridFsTemplate;


	//data:image/png;base64,
	/**
	 * 保存图片数据到mongo
	 *  图片的上传记录信息
	 */
	public Result uploadImg(FileUploadReq fileUploadReq) throws Exception {
		Result result=Result.getSuccessResult();
		if( fileUploadReq !=null && StringUtils.isNotBlank(fileUploadReq.getImgStr()) ){
			//验证图片格式
			if( fileUploadReq.getImgStr().startsWith("data:image/png;base64,")  ){
				try {
					String imgURI = UUIDUtil.getId()+".png";
					byte[] out = Base64.decodeFast(fileUploadReq.getImgStr().substring(22));
					
					InputStream input = new ByteArrayInputStream(out);
					gridFsTemplate.store(input, imgURI);
					String imgURL = Constant.FILE_URL_PRE+imgURI;
					result.setData(imgURL);
					
				} catch (Exception e) {
					logger.error("{}",e.getMessage(),e);
					result =new Result("error","上传图片服务异常" );
				}
			}else{
				result =new Result("error","上传图片格式有问题" );
			}
		}else{
			result =new Result("error","上传图片为空" );
		}
		logger.info("图片上传结束！ result:{}",JSON.toJSON(result));
		return result;
	}
	
	public Result uploadByteImg(MultipartFile file) throws Exception {
		Result result=Result.getSuccessResult();
		// 判断文件是否为空  
        if (!file.isEmpty()) {  
        	String sd = file.getOriginalFilename();
        	String fix = sd.substring(sd.lastIndexOf(".")+1);
        	//限制文件格式
        	if("jpg".equals(fix)||"png".equals(fix)||"JPG".equals(fix)||"".equals(fix)||"PNG".equals(fix)||"JPEG".equals(fix)||"".equals(fix)||"jpeg".equals(fix)){
        		try {  
        			InputStream input = file.getInputStream();
        			String imgURI = UUIDUtil.getId()+"."+fix;
        			gridFsTemplate.store(input, imgURI);
        			String imgURL = Constant.FILE_URL_PRE+imgURI;
        			result.setData(imgURL);
        		} catch (Exception e) {  
        			e.printStackTrace();  
        		}  
        	}else{
        		result.setCode("1");
        		result.setErrorMessage("图片格式有误");
        	}
        }  
		logger.info("图片上传结束！ result:{}",JSON.toJSON(result));
		return result;
	}
	
	
	public Result uploadByteFile(File file) throws Exception {
		Result result=Result.getSuccessResult();
		// 判断文件是否为空  
		if (file.exists()) {  
			String sd = file.getName();
			String fix = sd.substring(sd.lastIndexOf(".")+1);
			//限制文件格式
			try {  
				InputStream input = new FileInputStream(file);
				String fileUrl = System.currentTimeMillis()+"/"+sd;
				gridFsTemplate.store(input, fileUrl);
				String imgURL = Constant.FILE_URL_PRE+fileUrl;
				result.setData(imgURL);
			} catch (Exception e) {  
				e.printStackTrace();  
			}  
		}  
		logger.info("图片上传结束！ result:{}",JSON.toJSON(result));
		return result;
	}
}

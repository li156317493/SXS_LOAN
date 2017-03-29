package com.sxs.fileupload.service;


import java.io.File;

import org.springframework.web.multipart.MultipartFile;

import com.sxs.common.model.Result;
import com.sxs.fileupload.model.FileUploadReq;


/**
 * 
 * @类描述：附件业务接口类
 * @创建人：tank
 * @创建时间：2016年1月17日下午5:13:17
 *
 * @修改人：tank
 * @修改时间：2016年1月17日下午5:13:17
 * @修改备注：
 *
 */
public interface IFileUploadService  {
	/** base64 上传图片*/
	Result uploadImg(FileUploadReq fileUploadReq)throws Exception;
	/** byte[]上传图片*/ 
	Result uploadByteImg(MultipartFile file) throws Exception;
	
	Result uploadByteFile(File file) throws Exception;
	
}

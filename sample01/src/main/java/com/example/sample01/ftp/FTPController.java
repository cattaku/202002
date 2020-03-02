package com.example.sample01.ftp;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.example.sample01.common.UUIDgeneration;

@Controller
@RequestMapping("ftp")
public class FTPController {
	private final Logger logger = LoggerFactory.getLogger(FTPController.class);
	private final String PATH = "C:/MyWork/eclipse01/sample01/src/main/webapp/WEB-INF/upload";
	
	@Autowired
	SqlSession sql;
	
	@Resource
	String uploadPath;
	
	@RequestMapping("fileupload")
	public String uploadForm(Model model) throws Exception {
		
		  List<Map<String,Object>> list = sql.selectList("user.userList");
		  model.addAttribute("list", list);

		  return "ftp/ftp0100";
	}
	
	/*
	 * @RequestMapping("/") public String uploadForm(Model model) throws Exception {
	 * 
	 * List<Map<String,Object>> list = sql.selectList("user.userList");
	 * model.addAttribute("list", list);
	 * 
	 * return "ftp/ftp0100"; }
	 */
	 
	
	  @RequestMapping("getUpload") public ModelAndView upload(MultipartFile file,
			  ModelAndView mav, byte[] fileDate) throws Exception { 
		  UUIDgeneration uuid = new UUIDgeneration(); String id = uuid.getUUID();
	  
		  logger.info("파일이름 : "+file.getOriginalFilename()+"-"+uuid.getUUID());
		  logger.info("파일크기 : "+file.getSize());
		  logger.info("파일타입 : "+file.getContentType());
		  logger.info("UUID : "+uuid.getUUID());
		  
		  String savedName = file.getOriginalFilename()+"-"+uuid.toString(); 
		  String orgName = file.getOriginalFilename();
		  
		  File target = new File(uploadPath, savedName);
		  
		  FileCopyUtils.copy(file.getBytes(), target);
		  
		  mav.setViewName("ftp/ftp0200"); 
		  mav.addObject("orgdName", orgName);
		  
		  return mav; 
	  }
	 
	
	
	
	
	  
	/*
	 * @RequestMapping("getUpload")
	 * 
	 * @ResponseBody public String upload() throws Exception { return "ftp/ftp0100";
	 * }
	 * 
	 * 
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public ModelAndView
	 * upload(MultipartHttpServletRequest requset) throws Exception {
	 * 
	 * ModelAndView mav = new ModelAndView(); mav.setView(jsonView);
	 * 
	 * Iterator itr = requset.getFileNames();
	 * 
	 * if(itr.hasNext()) { List mpf = requset.getOriginalFilename(itr.next());
	 * 
	 * for(int i=0; i<mpf.size(); i++) { File file = new File(PATH +
	 * mpf.get(i).getOriginalFilename()); logger.info(file.getAbsolutePath());
	 * mpf.get(i).transferTo(file); }
	 * 
	 * JSONObject json = new JSONObject(); json.put("code", "true");
	 * mav.addObject("result", json); return mav; }else{ JSONObject json = new
	 * JSONObject(); json.put("code", "false"); mav.addObject("result", json);
	 * return mav; } }
	 */
	
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "ftp/ftp0100";
	}*/
	  
}

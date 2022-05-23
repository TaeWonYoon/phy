package com.dev.company.lib;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileVisitOption;
import java.util.Arrays;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

	@Data
	public class Upload {

		private String originName;
		private int fileSize;
		private String fileUrl;
/*
	    public FileVisitOption saveFile(String path,MultipartFile upload,String tableName,int uSeq, String mappingPath){
	        FileVO fvo = new FileVO();
			//톰캣 tmp 패스잡기		//String path = "C:/uploadImg/profile";
			//String path = request.getSession().getServletContext().getRealPath(url);
			// 파일 이름 변경
		    UUID uuid = UUID.randomUUID();
		    String fileName = upload.getOriginalFilename();

		    //...점 제거하기

	        String[] status = fileName.split("\\.");

	        originName = "";

	        for(int i = 0; i < status.length; i++) {
				 if(i == (status.length -1))  {
					 originName += "." + status[i];
				 } else {
					originName += status[i];
				 }
			}
	        fvo.setFilePathMapping(mappingPath); //파일 호출 경로
			fvo.setRegAdminSeq(uSeq); //유저 키값
	        fvo.setTableName(tableName); // 테이블 이름

			String ext = originName.substring(originName.lastIndexOf(".") + 1);
			fvo.setFileExt(ext); //파일 확장자

			String saveName = uuid + "_" + JavaDate.getRandom() + "." + ext;
	        fvo.setFileName(saveName); //파일 업로드 네임

			fvo.setFileSize((int)upload.getSize()); //파일 사이즈
	        fvo.setFileNameOriginal(originName); // 파일 이름
	        fvo.setTempSeq(JavaDate.getDate()); //파일 등록 날짜(키) temp
	        fvo.setFilePath(path); // 파일 경로
	        fvo.setFileStatus(1); // 파일 상태값
//			fileUrl = path+"/"+saveName;
		    // 저장할 File 객체를 생성(껍데기 파일)
			File file = new File(path);
		    File saveFile = new File(path,saveName); // 저장할 폴더 이름, 저장할 파일 이름
			//파일 생성
			if (!file.exists()) {
	            file.mkdirs();
	        }
		    try {
		        upload.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		    } catch (IOException e) {
		        e.printStackTrace();
		        return null;
		    }
		    return fvo;
		}


		public void deleteFile(String path,String fileName){ //파일 삭제
			//String path = "C:/upload_img/";

			File fileDeleted = new File(path+"/"+fileName);
			fileDeleted.delete();

		}

		public void deleteFileMod(String path){
			//String path = "C:/upload_img/";

			File fileDeleted = new File(path);
			fileDeleted.delete();

		}
		
		*/
}

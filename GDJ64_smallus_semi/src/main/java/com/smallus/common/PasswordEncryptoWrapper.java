package com.smallus.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordEncryptoWrapper extends HttpServletRequestWrapper {
	
	
	public PasswordEncryptoWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String key) {
//		return super.getParameter(key); 원본값
		String oriVal=super.getParameter(key);
		if(key.equals("password")||key.equals("password_new")||key.equals("password_chk")) {
			//암호화 처리 로직을 작성
			System.out.println("원본 : "+oriVal);
			String encryptData=getSHA512(oriVal);
			System.out.println("암호화 : "+encryptData);
			return encryptData;
		}
		return oriVal;
	}
	
	
	private String getSHA512(String oriVal) {
		//단방향 암호화 처리하기
		//java에서 제공하는 클래스와 메소드를 이용한다.
		//MessageDigest클래스를 이용
		//java가 제공하는 암호화 알고리즘을 적용한다.
		MessageDigest md=null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		//생성된 MessageDigest클래스를 이용해서 원본값 암호화처리
		//암호화처리는 byte단위로 쪼개서 처리를함.
		byte[] oriValByte=oriVal.getBytes();
		md.update(oriValByte);
		byte[] encryptData=md.digest();
		String encryptStrData=Base64.getEncoder().encodeToString(encryptData);
		return encryptStrData;
	}
	
}

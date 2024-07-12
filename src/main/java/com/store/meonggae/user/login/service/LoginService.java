package com.store.meonggae.user.login.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.store.meonggae.user.login.dao.LoginDAO;
import com.store.meonggae.user.login.domain.LoginDomain;
import com.store.meonggae.user.login.vo.LoginLogVO;
import com.store.meonggae.user.login.vo.LoginVO;

@Service
public class LoginService {
	@Autowired
	private LoginDAO lDAO;

	private final String CLIENT_ID = "0738d40e4912047a5dbb57d8ca06a869";
	//private final String REDIRECT_URI = "http://localhost/meonggae_prj/login_page/kakao_test.do";
	//private final String LOGOUT_REDIRECT_URI = "http://localhost/meonggae_prj/index.do/logout.do";

	public LoginDomain selectOneUser(LoginVO lVO) {
		return lDAO.login(lVO);
	}

	public Map<String, Object> getKaKaoAccessToken(String code, HttpServletRequest request) throws Exception {
		// 1. 토큰 받아오는 url 설정
		String url = "https://kauth.kakao.com/oauth/token";
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		String contextPath = request.getContextPath();
        String REDIRECT_URI = contextPath + "/login_page/kakao_test.do";
		// 2. 필수 파라미터 map으로 값 넣기
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", CLIENT_ID);
		params.add("redirect_uri", REDIRECT_URI);
		params.add("code", code);

		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<MultiValueMap<String, String>>(params,
				headers);
		ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, entity, Map.class);

		// 3. REST-API 호출
		return response.getBody();
	}

	public LoginDomain getKaKaoUserInfo(String accessToken) throws Exception {
		String url = "https://kapi.kakao.com/v2/user/me";
		
		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + accessToken);

		HttpEntity<String> entity = new HttpEntity<>(headers);
		ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, entity, Map.class);

		Map<String, Object> userInfo = response.getBody();
		LoginDomain user = new LoginDomain();
		
		
		//비밀번호, 닉네임
		Random random = new Random();
		long randomNumber = (long) (1000000000L + random.nextDouble() * 9000000000L);

		String randomPass = String.valueOf(randomNumber);
		
		String preRanNick [] = {"행복한 ", "방황하는 ", "빈곤한 ", "추운 ", "부유한 ", "우람한 ", "엄중한 ", "육중한 ", "남성적인 ", "여성적인 "};
		String postRanNick [] = {"고양이", "사자", "강아지", "이구아나", "고릴라", "빡빡이", "멍청이", "호랑이", "해달", "광어"};
		
		String preNick = preRanNick[random.nextInt(preRanNick.length)];
		String postNick = postRanNick[random.nextInt(postRanNick.length)];
		
		String nickname = preNick+postNick;
		
		String memId = null;
		String nick = nickname;
		String profile = null;
		String pass = randomPass;

		if (userInfo != null) {
			Map<String, Object> kakaoAccount = (Map<String, Object>) userInfo.get("kakao_account");
			if (kakaoAccount != null) {
				memId = (String) kakaoAccount.get("email");
			}

			Map<String, Object> properties = (Map<String, Object>) userInfo.get("properties");
			if (properties != null) {
				nick = (String) properties.get("nickname");
				profile = (String) properties.get("profile_image");
			}
		}

		if (memId == null || nick == null || profile == null) {
			throw new Exception("Failed to get user info from Kakao");
		}

		LoginVO loginVO = new LoginVO(memId);
		LoginDomain existingUser = lDAO.login(loginVO);

		if (existingUser == null) {
			user.setId(memId);
			user.setNick(nick);
			user.setimg(profile);
			user.setPass(pass);
			lDAO.insertKakaoUser(user);
		} else {
			user = existingUser;
		}

		return user;
	}

	public void kakaoLogOut(String accessToken, HttpServletRequest request) throws Exception {
		String url = "https://kapi.kakao.com/v1/user/logout";
		String contextPath = request.getContextPath();
        String LOGOUT_REDIRECT_URI = contextPath + "/index.do/logout.do";
		
		// URL에 쿼리 매개변수를 추가합니다.
		url += "?client_id=" + URLEncoder.encode(CLIENT_ID, "UTF-8") + "&logout_redirect_uri="
				+ URLEncoder.encode(LOGOUT_REDIRECT_URI, "UTF-8");

		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", "Bearer " + accessToken);

		int responseCode = con.getResponseCode();

		if (responseCode == HttpURLConnection.HTTP_OK) { // success
			try (BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()))) {
				String inputLine;
				StringBuilder response = new StringBuilder();

				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	// 로그인 시도시 로그인 로그 insert
	public void addMemberLoginLog(LoginLogVO logVO) {
		try {
			lDAO.insertMemberLoginLog(logVO);
		} catch (PersistenceException pe) {
			pe.printStackTrace();
		} // end catch
	} // addMemberLoginLog
	
	// 사용자의 접속 브라우저 얻기
	public String getMemberBrowser(String userAgent) {
        String browser = "";

        if(userAgent.contains("Trident")) {												// IE
            browser = "ie";
        } else if(userAgent.contains("Edg")) {											// Edge
            browser = "edge";
        } else if(userAgent.contains("Whale")) { 										// Naver Whale
            browser = "whale";
        } else if(userAgent.contains("Opera") || userAgent.contains("OPR")) { 		// Opera
            browser = "opera";
        } else if(userAgent.contains("Firefox")) { 										 // Firefox
            browser = "firefox";
        } else if(userAgent.contains("Safari") && !userAgent.contains("Chrome")) {	 // Safari
            browser = "safari";
        } else if(userAgent.contains("Chrome")) {										 // Chrome
            browser = "chrome";
        } else {
        	browser = "others";
        } // end else 
        return browser;
    } // getMemberBrowser
}
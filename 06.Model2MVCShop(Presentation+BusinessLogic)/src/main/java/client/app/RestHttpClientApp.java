package client.app;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.http.client.AbstractClientHttpResponse;
import org.springframework.web.client.HttpClientErrorException;

import com.model2.mvc.common.*;
import com.model2.mvc.service.domain.User;

public class RestHttpClientApp {
	
	public static void main(String[] args) throws Exception {
		
		//1. get request jsonsimple lib
		//RestHttpClientApp.RequestHttpGet_UseJsonSimple();
		
		//2. CodeHause lib
		//RestHttpClientApp.RequestHttpGet_UseCodeHaus();
		
		//2.1 post request
		//RestHttpClientApp.RequestHttpPostData_UserJsonSimple();
		
		//2.2 post request
		RestHttpClientApp.RequestHttpPostData_UseCodeHaus();
				
		
	}
	


	

	public static void RequestHttpGet_UseJsonSimple() throws Exception{
		
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/Spring14/user/json/user01"+"?name=user01&age=10";
		
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		HttpEntity responseHttpEntity = httpResponse.getEntity();
		
		InputStream is = responseHttpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		String serverData = br.readLine();
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
	}
	
	public static void RequestHttpGet_UseCodeHaus() throws Exception{
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/Spring14/user/json/user01"+"?name=user02&age=10";
		
		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader("Accept", "application/json");
		httpGet.setHeader("Content-Type", "application/json");
		
		HttpResponse httpResponse = httpClient.execute(httpGet);
		
		HttpEntity responseHttpEntity = httpResponse.getEntity();
		
		InputStream is = responseHttpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		String serverData = br.readLine();
		JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
		
		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.readValue(jsonobj.get("user").toString(), User.class);
		
	}
	
	public static void RequestHttpPostData_UserJsonSimple() throws Exception{
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/Spring14/user/json/getUser/user01";
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject json = new JSONObject();
		json.put("userId", "test");
		json.put("userName", "ȫ�浿");
		
		HttpEntity requestHttpEntity = new StringEntity(json.toString(), "utf-8");
		httpPost.setEntity(requestHttpEntity);
		
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		HttpEntity responseHttpEntity = httpResponse.getEntity();
		
		InputStream is = responseHttpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		String serverData = br.readLine();
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
		
	}
	
	public static void RequestHttpPostData_UseCodeHaus() throws Exception{
		HttpClient httpClient = new DefaultHttpClient();
		
		String url = "http://127.0.0.1:8080/Spring14/user/json/getUser/use01";
		
		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader("Accept", "application/json");
		httpPost.setHeader("Content-Type", "application/json");
		
		JSONObject json = new JSONObject();
		json.put("userId", "test");
		json.put("userName", "ȫ�浿");
		
		HttpEntity requestHttpEntity = new StringEntity(json.toString(), "utf-8");
		httpPost.setEntity(requestHttpEntity);
		
		HttpResponse httpResponse = httpClient.execute(httpPost);
		
		HttpEntity responseHttpEntity = httpResponse.getEntity();
		
		InputStream is = responseHttpEntity.getContent();
		BufferedReader br = new BufferedReader(new InputStreamReader(is,"UTF-8"));
		
		String serverData = br.readLine();
		
		JSONObject jsonobj = (JSONObject)JSONValue.parse(serverData);
		
		ObjectMapper objectMapper = new ObjectMapper();
		User user = objectMapper.readValue(jsonobj.get("user").toString(),User.class);
		
	}
}

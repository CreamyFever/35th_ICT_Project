package com.creamyfever.wow.controllers;

import java.awt.Dimension;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.creamyfever.wow.dao.GraphMapper;
import com.creamyfever.wow.dao.MembersDAO;
import com.creamyfever.wow.dao.TopKeywordMapper;
import com.creamyfever.wow.dao.WorldmapMapper;
import com.creamyfever.wow.vo.AgeGender;
import com.creamyfever.wow.vo.Article;
import com.creamyfever.wow.vo.ArticleReply;
import com.creamyfever.wow.vo.Members;
import com.creamyfever.wow.vo.Reply;
import com.creamyfever.wow.vo.Topkeyword;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class WorldMapController {
	
	@Autowired
	MembersDAO mDao;
	
	//특수문자 제거1
		public static String StringReplace(String str){       
		      String match = "^[\uAC00-\uD7A3xfe0-9a-zA-Zk\\s]";
		      str =str.replaceAll(match, " ");

		      return str;
		   }
		//특수문자 제거2
		public String strsplit(String origin) {
		      String originStr = origin;
		      
		      if(originStr.contains("\"")) {
		    	  String[] strArr = originStr.split("\"");
		    	  String str = "";
		    	  for(int i=0 ; i<strArr.length ; i++) {
		    		  str += strArr[i]+"";
		    	  }
		    	  originStr = str;
		      }
		      if(originStr.contains("\'")) {
		         String[] strArr = originStr.split("\'");
		         String str = "";
		         for(int i=0 ; i<strArr.length ; i++) {
		            str += strArr[i]+"";
		         }
		         originStr = str;
		      }
		      
		      if(originStr.contains(":")) {
		         String[] strArr = originStr.split(":");
		         String str = "";
		         for(int i=0 ; i<strArr.length ; i++) {
		            str += strArr[i]+"";
		         }
		         originStr = str;
		      }
		      
		      if(originStr.contains("(")) { //
		    	  String[] strArr = originStr.split("\\(");
		    	  String str = "";
		    	  for(int i=0 ; i<strArr.length ; i++) {
		    		  str += strArr[i]+"";
		    	  }
		    	  originStr = str;
		      }
		      if(originStr.contains(")")) {
		    	  String[] strArr = originStr.split("\\)");
		    	  String str = "";
		    	  for(int i=0 ; i<strArr.length ; i++) {
		    		  str += strArr[i]+"";
		    	  }
		    	  originStr = str;
		      }
		      if(originStr.contains("$")) {
		    	  String[] strArr = originStr.split("$");
		    	  String str = "";
		    	  for(int i=0 ; i<strArr.length ; i++) {
		    		  str += strArr[i]+"";
		    	  }
		    	  originStr = str;
		      }
		      if(originStr.contains("-")) {
		    	  String[] strArr = originStr.split("-");
		    	  String str = "";
		    	  for(int i=0 ; i<strArr.length ; i++) {
		    		  str += strArr[i]+"";
		    	  }
		    	  originStr = str;
		      }
		      
		      return originStr;
		   }
		//감정 평균 구하기
		public double getSenAve(ArrayList<Article> articleList, String continent) {
			int i = 0;
			double sum = 0;
			double ave = 0;
			for(Article a : articleList) {
				if(a.getContinent().equals(continent)) {
					i++;
					sum+=a.getSentiment();
				}
				ave = sum/(double)i;
			}
			return ave;
		}
		
		public int getArtiCount(ArrayList<Article> articleList, String continent) {
			int i = 0;
			for(Article a : articleList) {
				if(a.getContinent().equals(continent)) {
					i++;
				}
			}
			return i;
		}
		
		
		
		@Autowired
		SqlSession session;
				
		
		
		
		public ArrayList<Integer> AgeListByGender(String search, String gender){
			int under19w=0;
            int up20under29w=0;
            int up30under39w=0;
            int up40under49w=0;
            int up50w=0;
            GraphMapper gMapper = session.getMapper(GraphMapper.class);
            ArrayList<AgeGender> agList = gMapper.selectAgeGender(search);
            
            for(AgeGender data : agList) {
                if(data.getAge()<20&&data.getGender().equals(gender)) {
                   under19w++;
                } else if(data.getAge()>=20&&data.getAge()<30&&data.getGender().equals(gender)) {
                   up20under29w++;
                } else if(data.getAge()>=30&&data.getAge()<40&&data.getGender().equals(gender)) {
                   up30under39w++;
                } else if(data.getAge()>=40&&data.getAge()<50&&data.getGender().equals(gender)) {
                   up40under49w++;
                } else if(data.getAge()>=50&&data.getGender().equals(gender)) {
                   up50w++;
                }
             }
            ArrayList<Integer> ageList = new ArrayList<>();
            
             ageList.add(under19w);
             ageList.add(up20under29w);
             ageList.add(up30under39w);
             ageList.add(up40under49w);
             ageList.add(up50w);
            
             return ageList;
		}
		
		
		
		
		
		//월드맵으로 가기
		 @RequestMapping(value = "/goToWorldMap", method = RequestMethod.GET)
         public String goToWorldMap(HttpSession httpsession, Locale locale, Model model, String search) {
            /*
             * session에 로그인한 사용자 정보 받아오기
             * 이후 변수 처리해서 삽입
             * */
            
            
            //dd
            GraphMapper gMapper = session.getMapper(GraphMapper.class);
            
            String loginId = (String)httpsession.getAttribute("loginId");
            Members members = mDao.get(loginId);
            TopKeywordMapper tkmapper = session.getMapper(TopKeywordMapper.class);
            Topkeyword test = tkmapper.selectOneTopKeyword(search);
            if(test!=null) {
            	//Topkeyword topKeyword = new Topkeyword(search, members.getAge(), members.getGender());
               int result = tkmapper.updateTopKeyword(search);
               System.out.println(result+" 수정성공 "); //
            } else {
               Topkeyword topKeyword = new Topkeyword(search, 1, members.getAge(), members.getGender());
               int result = tkmapper.insertTopKeyword(topKeyword);
               System.out.println(result+" 삽입성공 ");
            }
            
            
            
            
            
            AgeGender ag = new AgeGender(members.getId(), members.getAge(), members.getGender(), search);
            gMapper.insertAgeGender(ag); //키워드에 넣기......
            ArrayList<AgeGender> agList = gMapper.selectAgeGender(search);
            System.out.println("agList"+agList);
            
            Double userSentiment_Asia = gMapper.getAverageByContinent("Asia");
            Double userSentiment_SA = gMapper.getAverageByContinent("South America");
            Double userSentiment_NA = gMapper.getAverageByContinent("North America");
            Double userSentiment_Oceania = gMapper.getAverageByContinent("Oceania");
            Double userSentiment_Europe = gMapper.getAverageByContinent("Europe");
            Double userSentiment_Africa = gMapper.getAverageByContinent("Africa");
            
            ArrayList<Double> userSentiment = new ArrayList<>();
            userSentiment.add(userSentiment_Africa);
            userSentiment.add(userSentiment_Europe);
            userSentiment.add(userSentiment_Oceania);
            userSentiment.add(userSentiment_NA);
            userSentiment.add(userSentiment_SA);
            userSentiment.add(userSentiment_Asia);
            
            int countStars_Asia = gMapper.getNumberByContinent("Asia");
            int countStars_SA = gMapper.getNumberByContinent("South America");
            int countStars_NA = gMapper.getNumberByContinent("North America");
            int countStars_Oceania = gMapper.getNumberByContinent("Oceania");
            int countStars_Europe = gMapper.getNumberByContinent("Europe");
            int countStars_Africa = gMapper.getNumberByContinent("Africa");
            
            
            
            //jsp에 보낼 값 설정
            ArrayList<Integer> genderList = new ArrayList<>();
            int woman = 0;
            int man = 0;
            
            for(AgeGender data : agList) {
               if(data.getGender().equals("female")) {
                  woman++;
               }else {
                  man++;
               }
            }
            		
            genderList.add(woman);
            genderList.add(man);
            ArrayList<Integer> ageList_w = AgeListByGender(search,"female");
            ArrayList<Integer> ageList_m = AgeListByGender(search,"male");
            WorldmapMapper mapMapper = session.getMapper(WorldmapMapper.class);
            ArrayList<Article> articleList = mapMapper.printArticleList(search);
            
            double sentiment_Africa = (double) 100 * getSenAve(articleList, "Africa");
            double sentiment_Asia = (double) 100 * getSenAve(articleList, "Asia");
            double sentiment_SA = (double) 100 * getSenAve(articleList, "South_America");
            double sentiment_NA = (double) 100 * getSenAve(articleList, "North_America");
            double sentiment_Oceania = (double) 100 * getSenAve(articleList, "Oceania");
            double sentiment_Europe = (double) 100 * getSenAve(articleList, "Europe");
            
            if(Double.isNaN(sentiment_Africa)) {
            	sentiment_Africa=0;
        	}
            if(Double.isNaN(sentiment_Asia)) {
            	sentiment_Asia=0;
            }
            if(Double.isNaN(sentiment_SA)) {
            	sentiment_SA=0;
            }
            if(Double.isNaN(sentiment_NA)) {
            	sentiment_NA=0;
            }
            if(Double.isNaN(sentiment_Oceania)) {
            	sentiment_Oceania=0;
            }
            if(Double.isNaN(sentiment_Europe)) {
            	sentiment_Europe=0;
            }
            
            ArrayList<Double> sentimentList = new ArrayList<>();
            sentimentList.add(sentiment_Africa);
            sentimentList.add(sentiment_Asia);
            sentimentList.add(sentiment_SA);
            sentimentList.add(sentiment_NA);
            sentimentList.add(sentiment_Oceania);
            sentimentList.add(sentiment_Europe);
            
            int artiCount_Africa = getArtiCount(articleList, "Africa");
            int artiCount_Asia =  getArtiCount(articleList, "Asia");
            int artiCount_SA =  getArtiCount(articleList, "South_America");
            int artiCount_NA =  getArtiCount(articleList, "North_America");
            int artiCount_Oceania =  getArtiCount(articleList, "Oceania");
            int artiCount_Europe = getArtiCount(articleList, "Europe");
            
            //가중치
            double value_Africa = (double)(50*countStars_Africa+50*artiCount_Africa)/100;
            double value_Asia = (double)(50*countStars_Asia+50*artiCount_Asia)/100;
            double value_SA = (double)(50*countStars_SA+50*artiCount_SA)/100;
            double value_NA = (double)(50*countStars_NA+50*artiCount_NA)/100;
            double value_Oceania = (double)(50*countStars_Oceania+50*artiCount_Oceania)/100;
            double value_Europe = (double)(50*countStars_Europe+50*artiCount_Europe)/100;
            
            ArrayList<Double> bubValue = new ArrayList<>();
            bubValue.add(value_Africa);
            bubValue.add(value_Asia);
            bubValue.add(value_SA);
            bubValue.add(value_NA);
            bubValue.add(value_Oceania);
            bubValue.add(value_Europe);
            
            System.out.println(bubValue);
            
            model.addAttribute("userSentiment", userSentiment);
            model.addAttribute("bubValue", bubValue);
            model.addAttribute("ageList_m", ageList_m);
            model.addAttribute("ageList_w", ageList_w);
            model.addAttribute("genderList", genderList);
            model.addAttribute("sentimentList", sentimentList);
            model.addAttribute("search", search);
            
            return "ArticleView";
         }
		
		//디테일로 가기
		@RequestMapping(value = "/goToDetail", method = RequestMethod.GET)
		public String goToDetail(Locale locale, Model model, String keyword, String continent) {
			System.out.println("Keyword = " + keyword);
			System.out.println("Continent = " + continent);
			WorldmapMapper mapMapper = session.getMapper(WorldmapMapper.class);
			ArrayList<Article> ArticleList = mapMapper.printArticleList(keyword);
			System.out.println(ArticleList);
			
			model.addAttribute("keyword", keyword);
		//	model.addAttribute("articleList", ArticleList);
			model.addAttribute("continent", continent);
			
			return "detail";
		}
		
		
		@RequestMapping(value = "/goToFB", method = RequestMethod.GET)
		public String goToFB(Locale locale, Model model) {
			
			return "firebase";
		}
		
		//키워드......왜 안ㄷ
		@RequestMapping(value = "/keyword", method = RequestMethod.GET)
		public @ResponseBody String keyword(Locale locale, Model model) {
			String uri = "http://api.openhangul.com/dic?api_key=piecesofyou020180816005259&q=좋다";
			
			return "firebase";
		}
		
		
		// **********************************************
		// *** Update or verify the following values. ***
		// **********************************************

		// Replace the subscriptionKey string value with your valid subscription key.
		    static String subscriptionKey = "2a4b7d5d30794b289f27f2cc97a19276";

		    static String host = "https://api.cognitive.microsofttranslator.com";
		    static String path = "/translate?api-version=3.0";

		    // Translate to German and Italian.
		    static String params = "&to=en";

		    static String text = "Hello world!";

		    public static class RequestBody {
		        String Text;

		        public RequestBody(String text) {
		            this.Text = text;
		        }
		    }

		    public static String Post (URL url, String content) throws Exception {
		        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
		        connection.setRequestMethod("POST");
		        connection.setRequestProperty("Content-Type", "application/json");
		        connection.setRequestProperty("Content-Length", content.length() + "");
		        connection.setRequestProperty("Ocp-Apim-Subscription-Key", subscriptionKey);
		        connection.setRequestProperty("X-ClientTraceId", java.util.UUID.randomUUID().toString());
		        connection.setDoOutput(true);

		        DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
		        byte[] encoded_content = content.getBytes("UTF-8");
		        wr.write(encoded_content, 0, encoded_content.length);
		        wr.flush();
		        wr.close();

		        StringBuilder response = new StringBuilder ();
		        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "UTF-8"));
		        String line;
		        while ((line = in.readLine()) != null) {
		            response.append(line);
		        }
		        in.close();

		        return response.toString();
		    }

		    public static String Translate (String sendText) throws Exception {
		        URL url = new URL (host + path + params);

		        List<RequestBody> objList = new ArrayList<RequestBody>();
		        System.out.println("t" + sendText);
		        objList.add(new RequestBody(sendText));
		        System.out.println("o" + objList);
		        String content = new Gson().toJson(objList);
		        System.out.println("c" + content);
		        return Post(url, content);
		    }

		    public static String prettify(String json_text) {
		        JsonParser parser = new JsonParser();
		        JsonElement json = parser.parse(json_text);
		        Gson gson = new GsonBuilder().setPrettyPrinting().create();
		        return gson.toJson(json);
		    }
		    
		
		//디테일로 가기
		@RequestMapping(value = "/translate", method = RequestMethod.POST)
		public @ResponseBody String translate(Locale locale, Model model, String sendText) {
			
			String tran = null;
			System.out.println(sendText);
			
	            String response;
				try {
					response = Translate (sendText);
					System.out.println("res" + response);
					tran = prettify (response);
					System.out.println ("tran" + tran);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			return tran;
		}
		
		
		//컨트롤러 내에서	 감정 처리하기
		@RequestMapping(value = "/total", method = RequestMethod.POST)
		public @ResponseBody ArrayList<String> sentiment(Locale locale, Model model) {
			
			String tran = null;
			String kansei = null;
			ArrayList<String> kanseiResult = new ArrayList<String>();
			ArrayList<Article> test = new ArrayList<Article>();
			WorldmapMapper mapper = session.getMapper(WorldmapMapper.class);
			ArrayList<Article> ArtiList = mapper.printAll();
			for(int i = 0 ; i<ArtiList.size();i++) {
				if(ArtiList.get(i).getArticleid().contains("KR")) {
					System.out.println(ArtiList.get(i).getArticleid());
					test.add(ArtiList.get(i));
				}
			}
			System.out.println(test);
			System.out.println("오류?");
			
			String response;
			
			for(Article a : ArtiList) {
				if(a.getArticleid().contains("KR")) {
					System.out.println(a.getArticleid());
					try {
						response = Translate (a.getArticlecontent());
						System.out.println("res" + response);
						tran = prettify (response);
						System.out.println ("tran" + tran);
						HttpClient httpclient = HttpClients.createDefault();
						
						try
						{
							URIBuilder builder = new URIBuilder("https://japaneast.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment");
							
							
							URI uri = builder.build();
							HttpPost request = new HttpPost(uri);
							request.setHeader("Content-Type", "application/json");
							request.setHeader("Ocp-Apim-Subscription-Key", "a16ae793fb0e47e4bddd7328807a4950");
							
							// Request body
							StringEntity reqEntity = new StringEntity(tran);
							request.setEntity(reqEntity);
							
							HttpResponse response1 = httpclient.execute(request);
							HttpEntity entity = response1.getEntity();
							System.out.println("안들어오남");
							if (entity != null) 
							{
								kansei = EntityUtils.toString(entity);
								System.out.println(EntityUtils.toString(entity));
								int i = 0;
								i++;
								System.out.println(i + "		" + kansei);
								kanseiResult.add(kansei);
							}
						}
						catch (Exception e)
						{
							System.out.println(e.getMessage());
						}
						
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} 
			}
			
			return kanseiResult;
		}
		//컨트롤러 내에서	 감정 처리하기
		@RequestMapping(value = "/total2", method = RequestMethod.POST)
		public @ResponseBody ArrayList<String> sentiment2(Locale locale, Model model) {
			
			String tran = null;
			String kansei = null;
			ArrayList<String> kanseiResult = new ArrayList<String>();
			ArrayList<Article> test = new ArrayList<Article>();
			WorldmapMapper mapper = session.getMapper(WorldmapMapper.class);
			ArrayList<Article> ArtiList = mapper.printAll();
			for(int i = 0 ; i<ArtiList.size();i++) {
				if(ArtiList.get(i).getArticleid().contains("JP")) {
					test.add(ArtiList.get(i));
				}
			}
			
			String response;
			JSONObject documents;
			
			for(Article a : ArtiList) {
				if(a.getArticleid().contains("NA")&& a.getSentiment()==0) { //JP, EU 등 대륙별로 분석을 돌림
					System.out.println(a.getArticleid());
					String cont = StringReplace(a.getArticlecontent());
					try {						
					/*	response = Translate (a.getArticlecontent());
						System.out.println("res" + response);
						tran = prettify (response);
						System.out.println ("tran" + tran);
						
						//tran에서 번역된 내용을 빼는 법
						JsonParser parser = new JsonParser();
						System.out.println("문제");
						JsonArray tran2 = (JsonArray) parser.parse(tran);
						System.out.println(tran2+ "***");
						
						JsonObject result1 = (JsonObject) tran2.get(0);
						System.out.println(result1+"   ");
						System.out.println("*** ***");
						result1.get("translations");
						System.out.println("&&&&" + result1.get("translations"));
						
						JsonArray result2 = (JsonArray) result1.get("translations");
						JsonObject result3 = (JsonObject) result2.get(0); //text쪽
						
						System.out.println("제발떠라"+result2.get(0));
						String text =(result3.get("text")+"");
						text = StringReplace(text);
						System.out.println(text);*/
						HttpClient httpclient = HttpClients.createDefault();
						
						try
						{
							URIBuilder builder = new URIBuilder("https://eastus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment");
							
							
							URI uri = builder.build();
							HttpPost request = new HttpPost(uri);
							request.setHeader("Content-Type", "application/json");
							request.setHeader("Ocp-Apim-Subscription-Key", "fb3d3b08bf0940bd9b5b4b3ab702d2d8");
							
							String testfor = (String) a.getArticlecontent();
							if(testfor.length()>5000) {
								testfor = testfor.substring(0, 5000);
							} //글자수 제한 막기
							
							
							testfor = strsplit(testfor);
							System.out.println(testfor);
							// Request body
							StringEntity reqEntity = new StringEntity("{" + 
									"  \"documents\": [" + 
									"    {" + 
									"      \"language\": \"en\"," + 
									"      \"id\": \"1\"," + 
									"      \"text\": "+ "\""+testfor + "\""+ //a.content
									"    }"  + 
									"  ]" + 
									"}");
							request.setEntity(reqEntity);
							HttpResponse response1 = httpclient.execute(request);
							HttpEntity entity = response1.getEntity();
							System.out.println("안들어오남");
							if (entity != null) 
							{
								kansei = EntityUtils.toString(entity);
								System.out.println("kansei"+kansei);
								JsonParser jsonParser = new JsonParser();
								JsonObject jsonObject = (JsonObject) jsonParser.parse(kansei);
								System.out.println("*"+jsonObject);
								JsonArray dataObject = (JsonArray) jsonObject.get("documents");
								System.out.println("***"+dataObject);
								
								JsonObject getScoreObj = (JsonObject) dataObject.get(0);
								System.out.println("*** **"+getScoreObj);
								getScoreObj.get("score");
								double score = Double.parseDouble(getScoreObj.get("score")+"");
								System.out.println("*** ***");
								
								System.out.println(getScoreObj.get("score"));
								System.out.println(score+"이게 바꾼거임");
								Article article = new Article();
								article.setArticleid(a.getArticleid());
								article.setSentiment(score);
								mapper.updateSentiment(article);
								int i = 0;
								i++;
								System.out.println(i + "		" + kansei);
								
							}
						}
						catch (Exception e)
						{
							System.out.println("ERROR*****"+e.getMessage());
						}						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} 
			}
			
			return kanseiResult;
		}
}

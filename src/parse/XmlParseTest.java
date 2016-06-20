package parse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.SAXException;

public class XmlParseTest {
	URL url;
	HttpURLConnection con;
	StringBuffer sb;
	InputStream is;
	
	
	public XmlParseTest() {
		try {
			url = new URL("http://192.168.1.113:9090/xml/list.jsp");
			con=(HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setDoInput(true);
			
			int code=con.getResponseCode();
			if(code == HttpURLConnection.HTTP_OK){
				System.out.println("요청 성공");
				sb = new StringBuffer();
				
				BufferedReader buffr = new BufferedReader(new InputStreamReader(is=con.getInputStream(), "utf-8"));
				
				/*				
				String data=null;
				while(true){
					data=buffr.readLine();
					if(data==null)break;
					//System.out.println(data);
					sb.append(data); //스트링 버퍼에 data 누적!!! 
				}
				*/				
				//System.out.println(sb.toString());
				
				/*json 아닌 xml을 파싱해보자!!(난이도 高)
				 *자바언어에서 파싱을 하는 방법은 크게 2가지가 있다
				 *1.DOM 방식- 문서의 모든 내용을 해석한 후 , 해당 tag마다 객체를 생성하므로 
				 *                   pc인 경우 문제가 없지만, 스마트폰의 경우 메모리 부족하다..
				 *                   
				 *2.SAX 방식 - 실행부가 문서를 읽어들이면서, 태그 및 내용을 발견할때마다 이벤트를
				 *                   발생시키는 방식이며, DOM 보다 가볍기 때문에 앱개발시 거의 압도적!!
				 *                   
				 * SAXParser 가 필요..
				 * */
				parse();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	//SAX 방식의 파싱 시작!!
	public void parse(){
		SAXParserFactory factory=SAXParserFactory.newInstance();
		try {
			SAXParser saxParser=factory.newSAXParser();
			saxParser.parse(is, new MyHandler());
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public static void main(String[] args) {
		new XmlParseTest();
	}

}

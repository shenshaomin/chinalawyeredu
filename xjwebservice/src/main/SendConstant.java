/**
 * SendConstant.java
 */
package main;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.commons.logging.Log;

/**
 * @author 刘哈哈 Apr 18, 20113:00:15 PM
 * 
 */
public class SendConstant {

	private static final Log LOG = org.apache.commons.logging.LogFactory.getLog(SendConstant.class);

	// 发送短信的详细情况的次数
	public static int DETAIL_COUNT;
	// 几点中发，和那个job中的时间要一致
	public static int SEND_HOUR;
	// 没违章的时候，每周1，5发公共信息
	public static List<Integer> SEND_PROMPT_WEEKDAY = new ArrayList<Integer>();
	public static List<Integer> SEND_WEEKDAY = new ArrayList<Integer>();
	public static String DEFAULT_BANNER = "【尊敬的汽车保姆用户】";// 默认的banner信息
	// 下发的违章信息,要加入这个
	public static String DEFAULT_ENDFIX = "（违章内容仅供参考，详情请前往就近交警大队查询）";

	public static int PAGESIZE = 1000;
	public static String SMSURL;
	public static int SENDCOUNT=10;
	
	public static String SPID = "31100215";
	public static String SPPWD = "2688229";
	public static String SEND_NAME;
	
	public static String QNAME;
	static {
		InputStream in = null;

		try {

			Properties prop = new Properties();

			in = SendConstant.class.getResourceAsStream("/main/send.properties");
			prop.load(in);

			LOG.debug("prop.getProperty(\"detailcount\")=" + prop.getProperty("detailcount"));

			DEFAULT_ENDFIX = new String(prop.getProperty("endfix").getBytes("iso8859-1"), "gbk");
			DEFAULT_BANNER = new String(prop.getProperty("banner").getBytes("iso8859-1"), "gbk");
			//
			// System.out.println(DEFAULT_ENDFIX);
			// System.out.println(DEFAULT_BANNER);

			// DEFAULT_ENDFIX = new String(prop.getProperty("endfix"));
			// DEFAULT_BANNER = new String(prop.getProperty("banner"));

			DETAIL_COUNT = Integer.parseInt(prop.getProperty("detailcount"));
			SENDCOUNT = Integer.parseInt(prop.getProperty("sendcount"));
			SEND_HOUR = Integer.parseInt(prop.getProperty("sendhour"));
			PAGESIZE = Integer.parseInt(prop.getProperty("pagesize"));
			SMSURL=prop.getProperty("smsurl");
			SEND_NAME=prop.getProperty("sendname");
			SPID=prop.getProperty("spid");
			SPPWD=prop.getProperty("sppwd");
			
			QNAME=prop.getProperty("qname");
			String weekdays = prop.getProperty("weekdays");
			String s[] = weekdays.split(",");
			for (String ss : s) {
				if (!ss.equals(""))
					SEND_PROMPT_WEEKDAY.add(Integer.parseInt(ss.trim()));
			}

			String send_days = prop.getProperty("send_days");
			String sss[] = send_days.split(",");
			for (String ss : sss) {
				if (!ss.equals(""))
					SEND_WEEKDAY.add(Integer.parseInt(ss.trim()));
			}

		} catch (Exception e) {
			// SEND_WEEKDAY.add(1);
			// SEND_WEEKDAY.add(2);
			// SEND_WEEKDAY.add(3);
			// SEND_WEEKDAY.add(4);
			// SEND_WEEKDAY.add(5);
			// SEND_PROMPT_WEEKDAY.add(1);
			// SEND_PROMPT_WEEKDAY.add(5);
			// DETAIL_COUNT=3;
			// SEND_HOUR=9;
			// PAGESIZE=1000;
			LOG.error("初始化失败", e);
			try {
				if (in != null)
					in.close();
			} catch (Exception ee) {
				LOG.error("关闭sms.properties异常:" + e);
			}
		}
	}

	public static void main(String[] args) {
		System.out.println(SPID);
		System.out.println(SPPWD);
		System.out.println(QNAME);
		System.out.println(SMSURL);
		System.out.println(SEND_NAME);
		System.out.println(DEFAULT_BANNER);
		System.out.println(DEFAULT_ENDFIX);
	}
}

/**
 * 
 */
package com.sxit.useraction.action;

import java.text.DateFormat;
import java.util.Date;

import com.sxit.common.action.AbstractAction;
import com.sxit.useraction.models.ErrorCodeStat;
import com.sxit.useraction.service.UseractionService;

/**
 * 
 * 
 * 29号错误
 * 
 * @author 华锋 Oct 19, 2009-11:34:22 PM
 * 
 */
public class RaduiasErrorsAction extends AbstractAction {
	private static final DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd");
	private String date;

	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}
	private String exceltitle;
	public String getExceltitle(){
		return this.exceltitle;
	}
	/*
	 * (non-Javadoc)
	 * 
	 * @see com.sxit.common.action.AbstractAction#go()
	 */
	@Override
	protected String go() throws Exception {
		Date thedate=null;
		if (date == null || date.equals("")) {
			thedate=com.sxit.stat.util.StatUtil.getPrevDate();
			date = df.format(thedate);
		}else{
//			try{
//				thedate=df.parse(date);
//			}catch(Exception e){
//				thedate=com.sxit.stat.util.StatUtil.getPrevDate();
//				date = df.format(thedate);
//			}
			thedate= com.sxit.stat.util.StatUtil.getDate(date);
		}
		
		UseractionService service=(UseractionService)this.getBean("useractionService");
		
		codestat=service.getErrcodeList(thedate, "29");
		
		if(resultType.equals("list"))
			return SUCCESS;
			else{
			this.exceltitle=date+"之RADUIS错误(29号错误)情况总表";
				return "excel";
			}
	}
	private ErrorCodeStat codestat;

	/**
	 * @return the codestat
	 */
	public ErrorCodeStat getCodestat() {
		return codestat;
	}
	

}

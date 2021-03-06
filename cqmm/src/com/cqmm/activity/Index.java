package com.cqmm.activity;

import com.cqmm.common.CurSession;
import com.cqmm.common.SysParams;

import android.app.TabActivity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.TabHost;

/**
 * 2个tab,一个是系统维护，一个是本地记录
 * 
 * @author 华锋
 * 
 */
public class Index extends TabActivity {

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		final TabHost tabHost = getTabHost();
		
		setTitle(SysParams.SYS_NAME + "(" + CurSession.username + ")维护随声用");
	
		
		tabHost.addTab(tabHost.newTabSpec("tab1").setIndicator("连接设备")
				.setContent(new Intent(this, DeviceList.class)));

		tabHost.addTab(tabHost.newTabSpec("tab2").setIndicator("本地记录")
				.setContent(
						new Intent(this, LocalHistory.class)
								.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)));
	}
}

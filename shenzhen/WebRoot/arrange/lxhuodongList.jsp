﻿<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<title>%=com.changpeng.common.Constants.SYS_NAME%>-律协活动</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	background-color: #DAE7F6;
}
-->
</style>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/prototype-1.6.0.2.js"></script>
<script language="javascript">

function fanye(str){
  document.form1.pageNo.value=str;
  document.form1.submit();
}
function deleteit(signupid){
  if(confirm("您确定要删除这个报名信息吗?")){
     window.location.href="arrangesignupDelete.pl?arrangeid=${arrangeid}&signupid="+signupid;
  }
}
</script>
</head>
<body>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="23" background="../imagesa/top-bg3.gif" class="baseFontBold">
    	<img src="images/b_02.gif" width="4" height="7"> 
    	当前位置：律协活动报名汇总
    	</td>
  </tr>
</table>
<table width="99%" height="316" border="0" align="center" cellpadding="0" cellspacing="1" >
				
<s:form action="arrangesignupList" name="form1" method="post">
	  <tr>
    <td valign="top">	
    	
    	<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center" class="query-table">
						<tr>
							<td align="left">
					       执业证号:<s:textfield name="lawerno" size="15"/>
      
						 事务所:
                <s:if test="officenameinput">
            	    <s:textfield name="officename" size="15"/>
            	</s:if>
            	<s:else>
           			<s:textfield name="officename" size="15" readonly="true"/>
            	</s:else>
                         
							<s:submit value=" 查 询 " cssClass="button" /></td>
						</tr>
		</table>
   
    	<table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr >
          <td height="24" align="right" background="../imagesa/login_bg1.gif" >
           ${page.pageView} 
            <s:hidden name="pageNo"/>
             	<s:hidden name="arrangeid"/>
          </td>
        </tr>
      </table>
      
  
    	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#EDEDED">
          <tr>
            <td height="23"  align="center" background="../imagesa/top-bg1.gif" >报名者</td>
            <td align="center" background="../imagesa/top-bg1.gif" >事务所</td>
            <td align="center" background="../imagesa/top-bg1.gif" >执业证号</td>
            <td align="center" background="../imagesa/top-bg1.gif">联系电话</td>
            <td align="center" background="../imagesa/top-bg1.gif">备注</td>
               <td align="center" background="../imagesa/top-bg1.gif">删除</td>
          </tr>
          <s:iterator value="page.items" status="stat">
            <tr>
              <td class="tab_content" align="center" title="点此链接进行修改"><a href="arrangesignup!input.pl?signupid=${signupid}&arrangeid=${arrangeid}">${createuser}</a> </td>
              <td class="tab_content" align="center">${groupname}</td>
              <td class="tab_content" align="center">${lawerno}</td>
              <td class="tab_content" align="center">${phone}</td>
              <td class="tab_content" align="center"> ${remarks}</td>
              <td class="tab_content" align="center"><a href="#" onClick="deleteit(${signupid})">【删除】</a></td>
            </tr>
          </s:iterator>
          <tr background-color="#F1F1ED">
            <td  colspan="7" align="center">&nbsp;</td>
          </tr>
        </table>
    	<table width="100%" border="0" cellpadding="0" cellspacing="1">
        <tr >
          <td height="24" align="center" background="../imagesa/login_bg1.gif" >
       
       <input type="button" name="back" value=" 返 回 " onClick="javascript:window.location.href='arrangeList.pl?arrangetype=2'"/>          </td>
        </tr>
      </table>   
    </td>
  </tr>
    </s:form>




</table>
</body>
</html>
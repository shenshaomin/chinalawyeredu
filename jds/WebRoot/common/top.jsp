﻿
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/prototype.js"></script>
<script type="text/javascript" src="../js/callCenter.js"></script>
<script language=javascript>
<!--
var issubmit=false;
function set_Style(style){
 issubmit=true;
if (confirm("您确定重新设置风格么?")) {
    document.setForm.style.value=style;
    document.setForm.submit()
    return true;
  } else {
    return false;
  }
}
function setdate(){ 
var today = new Date();  
var week; var date;  
if(today.getDay()==0) week=" 星期日";  
if(today.getDay()==1) week=" 星期一";  
if(today.getDay()==2) week=" 星期二";  
if(today.getDay()==3) week=" 星期三";  
if(today.getDay()==4) week=" 星期四";  
if(today.getDay()==5) week=" 星期五";  
if(today.getDay()==6) week=" 星期六"; 
//date=(today.getYear())+"年"+(today.getMonth()+1)+"月"+today.getDate()+"日"+" ";  
date = new Date().toLocaleString().substring(0,10);
curdate.innerHTML=date+week;  
}
function submitform (){
	 issubmit=true;
	 document.form1.submit();
}
function exitform(){
  if(!issubmit){//如果没有提交,直接关闭窗口的话
     var url="../commonajax/ajaxlogout.action";
     var pars = 'now=' + new Date().getTime();
     var myAjax = new Ajax.Request(
                    url,
                    {method: 'post', parameters: pars, 
                     onComplete: function(transport){
                        // var response = transport.responseText || "no response text";
                        // alert("Success! \n\n" + response);
                                                    }
                    }
                    );

  }
}
-->
</script>
</head>

<body>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images_1/top_bg.jpg"><img src="images_1/top.jpg" width="752" height="75"></td>
  </tr>
  <tr>
    <td height="27" background="images_1/menu_bg.gif">
     <form name="form1" method="post" action="../userLogout.action" target="_top">
    <table width="99%"  border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="17%" align="center"><span id='curdate'>2007年10月15日 星期一</span> </td>
        <td width="1%" align="center"><img src="images_1/menu_line.gif" width="4" height="27"></td>
        <td width="30%">当前用户:${curuser.username}(${curuser.loginname})</td>
        <td width="5%"><img src="images_1/menu1.jpg" width="45" height="27"></td>
        <td><table border="0" cellspacing="1" cellpadding="3">
          
            <tr align="center">
              <td>皮肤设置</td>
              <td><input name="image" type="image" onClick="set_Style(1)" src="images_1/p1.gif" alt="style_blue"></td>
              <td><input name="image" type="image" onClick="set_Style(2)" src="images_1/p2.gif" alt="style_yellow"></a></td>
              <td><input name="image" type="image" onClick="set_Style(3)" src="images_1/p3.gif" alt="style_green"></td>
            </tr>
                </table>
        </td>
       <!--  
       <s:if test="${curuser.callUser}">         
        <td width="1%" align="center" class="blue"><img src="images_3/menu_line.gif" width="4" height="27"></td>
        <td width="5%" align="center" class="blue"><a href="#" onclick="Answer('${curuser.phone}','${curuser.userno}')" class="blue">应答</a></td>
       </s:if>
       -->
        <td width="1%" align="center" class="blue"><img src="images_3/menu_line.gif" width="4" height="27"></td>
        <td width="5%" align="center" class="blue"><a href="../info/webViewList.action" target="main" class="blue">返回首页</a></td>
        <td width="1%" align="center" class="blue"><img src="images_3/menu_line.gif" width="4" height="27"></td>
        <td width="5%" align="center" class="blue"><a href="userChangePassword.action" target="main" class="blue">修改密码</a></td>
        <td width="1%" align="center"><img src="images_3/menu_line.gif" width="4" height="27"></td>
        <td width="5%" align="center"><a href="../userLogout.action" target="_top" class="blue">注销用户</a></td>
        <td width="1%" align="center"><img src="images_3/menu_line.gif" width="4" height="27"></td>
        <td width="2%">&nbsp;</td>
      </tr>    
      
    </table></form>
<form name="setForm" action="setStyle.action" method="POST" target="_top">
	<s:hidden name="style"/>
</form>
   </td>
  </tr>
</table>
<script language="javascript">
setdate();
</script>
</body>
</html>

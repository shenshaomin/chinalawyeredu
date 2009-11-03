﻿<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="jscalendar" uri="/jscalendar"%>

<html>
<head>
<title><%=com.changpeng.common.Constants.SYS_NAME%>-给角色分配权限</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jscalendar:head/>
<link href="../css/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
<!--
body {
	background-color: #DAE7F6;
}
-->
</style>
<script type="text/javascript" src="../js/common.js"></script>
</head>
<body leftmargin="0" marginwidth="0" marginheight="0" topmargin="0">
<table width="99%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="23" background="../imagesa/top-bg3.gif"
					class="baseFontBold">
					<img src="images/b_02.gif" width="4" height="7">
					${navigator}
				</td>
			</tr>
		</table>
<table width="100%" border="0" cellspacing="1" cellpadding="0"
			align="center" class="border-table">
	<tr>
    <td>
    <s:form name="form1" action="sysRoleRight" method="post">
      <table width="100%" border="0" cellpadding="0" cellspacing="1"
						bgcolor="#EDEDED">
		<tr>
          <td colspan="2">&nbsp;</td>
        </tr>
		 <tr>
          <td align="right" class="tab_content">
             请选择权限:<br/>(已勾选的表示现在选中的权限)
             <s:hidden name="roleid"/>
          </td>
          <td class="tab_content">
      
            <s:set name="grades" value="1"/>
            <s:iterator value="allRights" status="stat">
                 <s:if test="!(#grades==grade||#grades.equals(grade))">
                   <br/>
                   <s:set name="grades" value="grade"/>
                 </s:if>
                 <s:if test="isnode"><!-- 只能选择节点 -->
                     <input type="checkbox" name="roleRights" value="${rightcode}" 
                       <s:if test="roleRights.contains(rightcode)"> checked=true</s:if>
                     />${rightname} 
                 </s:if>
                 <s:else>
                 <span class="hint">${rightname}</span>
                 </s:else>
            </s:iterator>
          </td>
        </tr>
        <tr>
          <td height="2" colspan="2">
          </td>
        </tr>
        <tr>
          <td colspan="2" align="center">
          	<s:submit value=" 保 存 " cssClass="button"/>&nbsp;
           	&nbsp;
          	<input type="button" value=" 返 回 " onClick="javascript:history.back(-1)" class="button">
          </td>
        </tr>
      </table>
    </s:form>
    </td>
  </tr>
</table>
</body>
</html>
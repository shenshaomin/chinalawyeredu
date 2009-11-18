<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<title>${sysName}-广告管理></title>
<link href="../css/system.css" rel="stylesheet" type="text/css">
<link href="../css/system_3.css" rel="stylesheet" type="text/css">


<style type="text/css">
<!--
body {
	margin-left: 2px;
	margin-top: 0px;
	margin-right: 2px;
	margin-bottom: 2px;
}
-->
</style>
</HEAD>
<BODY >
<TABLE width="100%" border=0  align=center cellPadding=0 cellSpacing=5 >
  <TR>
    <TD height=30 bgColor=#FFFFFF>
        <div align="left">
          <table width="80%" border="0" cellspacing="0" cellpadding="4">
            <tr>
              <td width="60">
		 <div align="center">
		  <img src="../images/arr.gif" width="13" height="13">
		 </div>
	      </td>
              <td width="97%"><span class="sort-title">广告管理&gt;&gt;广告新增修改</span></td>
            </tr>
          </table>
      </div></TD>
  </TR>
  <TR>
    <TD height="171" valign="top" bgColor=#FFFFFF><div align="center">
        <TABLE cellSpacing=1 cellPadding=1 width="100%" bgColor=#999999 border=0>
          <TR>
            <TD align="center" valign="top" bgColor=#F9F9F7>
                <br>
                <TABLE width="85%"  border=0 align=center cellPadding=3 cellSpacing=1 bgcolor="#7F9DB9">
                  <TBODY>
               <s:form name="form1" action="adCreateEdit" validate="true" method="post" enctype="multipart/form-data">
             
        			 	<TR>
					  <TD width="15%" class="listheadline">对应广告位:</TD>
					  <TD width="35%" class="listline" colspan="3">
					  <s:hidden name="exist"/>
					  <s:hidden name="oldpic"/>
					  <s:hidden name="adv.advtype" value="1"/>
					  <s:if test="exist==1">
					${adv.pos}（${adv.description}）
					</s:if>
					<s:else>
					  <s:select name="adv.pos" list="allPos" listKey="pos" listValue="description"/>
					</s:else>
					</TD>
					</TR>
				<!-- 	   <TR>
					  <TD width="15%" class="listheadline">内容类型:</TD>
					  <TD width="35%" class="listline" colspan="3">
						<s:select name="adv.advtype" list="#{'1':'图片','2':'FLASH'}"/>
					  </TD>
					</TR>
					 -->
                  <TR>
                    <TR>
					  <TD width="15%" class="listheadline">发布状态:</TD>
					  <TD width="35%" class="listline" colspan="3">
				
					  <s:select name="adv.status" list="#{'0':'发布','1':'禁用'}"/></TD>
					</TR>
                 <TR>
					  <TD width="15%" class="listheadline">广告图片:</TD>
					  <TD width="35%" class="listline" colspan="3">
						<s:if test="exist==1&&(adv.pic!=null)">
					<img src="${resourcepath}${adv.pic}" width="300"/><br/>
					</s:if>
					  <s:file name="upload" size="15"/>
					  </TD>
					</TR>
                  <TR>
					  <TD width="15%" class="listheadline">广告链接:</TD>
					  <TD width="35%" class="listline" colspan="3">
				
					  <s:textfield name="adv.url" size="35" cssClass="text1"/></TD>
					</TR>
                     <TR>
					  <TD width="15%" class="listheadline">广告说明:</TD>
					  <TD width="35%" class="listline" colspan="3">
				
					  <s:textarea name="adv.description" cols="40" rows="3" cssClass="text1"/></TD>
					</TR>
                    
                    
                    
                    <TR bgcolor="#CCCCCC">
                      <TD colspan="4" align="center">
                        <INPUT name="insert" type="submit" class="botton" value="保存">&nbsp;
			            <INPUT name="back" type=button class="botton" onClick="javascript:history.back(-1)" value="返回">
		              </TD>
                    </TR>
                   </s:form>
                  </TBODY>
                </TABLE>
                <br></TD>
          </TR>
        </TABLE>
    </div></TD>
  </TR>
</TABLE>
</BODY>
</HTML>

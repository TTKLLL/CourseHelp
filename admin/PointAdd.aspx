<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PointAdd.aspx.cs" Inherits="Admin_PointManage_PointAdd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>无标题页</title>

     <link href="../../css/L.layout.css" type="text/css" rel="Stylesheet"/>
        <style type="text/css">
       *{ font-size:12px;}
       body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right:0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr height="30">
            <td class="Header">
                <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;知识点信息录入</font>
            </td>
        </tr>
    </table>
    <table class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2" cellspacing="1" cellpadding="1" width="100%" border="1">
        <tr>
            <td align="right" width="25%">一级知识点*:</td>
            <td>
                &nbsp;
                <asp:TextBox ID="tbFirstPoint" runat="server" Width="338px"></asp:TextBox>
                <asp:DropDownList runat="server" ID="dropFirstPoint" AutoPostBack="true" OnSelectedIndexChanged="dropFirstPoint_SelectedIndexChanged">
                    <asp:ListItem>-----请选择一级知识点-------</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="一级知识点不能为空" ControlToValidate="tbFirstPoint" Display="Dynamic"></asp:RequiredFieldValidator></td></tr>
         <tr bgcolor="#e8f4ff">
             <td align="right" width="25%">二级知识点*:</td>
             <td>&nbsp;<asp:TextBox ID="tbSecondPoint" runat="server" Width="338px"></asp:TextBox></td>
         </tr>
         <tr bgcolor="#e8f4ff">
             <td></td>
             <td><asp:Button ID="btnSave" runat="server"  Text="保存"  CssClass="redButtonCss" onclick="btnSave_Click" />
              <input id="Button1" type="button" class="redButtonCss" value="返回" onclick="javascript: if (confirm('确定要返回吗？')) parent.frames['main'].location.href = 'PointManage.aspx'; else return false;"/>
             </td>

         </tr>
    </table>
    </form>
</body>
</html>

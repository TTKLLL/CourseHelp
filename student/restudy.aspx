<%@ Page Language="C#" AutoEventWireup="true" CodeFile="restudy.aspx.cs" Inherits="restudy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>“数据库”在线评测系统申请重修界面</title>
    <link href="../css/restudycss.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 140px;
            font-size: 14px;
            height: 29px;
        }
        .auto-style2 {
            height: 29px;
        }
    </style>
</head>
<body style="background-color: #286778">
    <form id="Form1" runat="server">
        <div style="width: 800px; height: 100%; border-radius: 10px; margin: 5px auto; text-align: center; background-color: #EEEEEE">
            <br />
            <h2 style="text-align: center; font-size: 30px; font-family: Calibri;">“数据库”在线评测系统</h2>
            <h2 style="text-align: center; color: black; font-size: 32px;"><b>申&nbsp;请&nbsp;重&nbsp;修</b></h2>
            <div class="header" style="line-height:1.2;">
                <div class="line">
                    <a href="http://www.hsit.edu.cn/" target="_blank">湖北理工学院官网</a>|<a href="../LogIn.aspx">登陆界面</a>
                </div>
            </div>
            <div style="line-height:1.2;">
                欢迎进入湖北理工学院“数据库”在线评测系统重修界面
            </div>
            <div style="line-height:1.2;">
                申请成功经审核后可以登录该评测系统进行学习<br />
            </div>
            <table id="table1">
                <tr>
                    <td class="td1">
                        <p>输入您重修的学号<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="sno"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="sno" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>输入您的密码<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_password" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <p>重修选择的教学班<span>*</span></p>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="Tclass" runat="server" CssClass="drop">
                            <asp:ListItem>----请选择----</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Tclass" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">                       
                        <asp:Button ID="isrestudy" runat="server" Text="确认" OnClick="isrestudy_Click" /> 
                         <asp:Button ID="register" runat="server" Text="返回注册"  OnClick="Button1_Click" CausesValidation="false"  />
                    </td>
                </tr>
            </table>
            <p class="p1">湖北理工学院(www.hbpu.edu.cn) 邮编：435003 电子邮件：wlzx@hbpu.edu.cn<br />
            </p>
            <p class="p1">地址：湖北省黄石市桂林北路16号</p>
        </div>
    </form>
</body>
</html>

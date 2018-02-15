<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>“数据库”在线评测系统注册界面</title>
    <link href="../css/Registercss.css" rel="stylesheet" />
    <style>
    </style>
</head>
<body style="background-color: #286778">
    <form id="Form1" runat="server">
        <div style="width: 800px; height: 100%; border-radius: 10px; margin: 5px auto; text-align: center; background-color: #EEEEEE">
            <br />
            <h2 style="text-align: center; font-size: 30px;font-family: Calibri;">“数据库”在线评测系统</h2>
            <h2 style="text-align: center; color: black; font-size: 32px;"><b>注&nbsp;&nbsp;册</b></h2>
            <div class="header" style="line-height:1.2;">
                <div class="line">
                    <a href="http://www.hsit.edu.cn/" target="_blank">湖北理工学院官网</a>|<a href="../LogIn.aspx">登陆界面</a>
                </div>
            </div>
            <div  style="line-height:1.2;">
                欢迎注册湖北理工学院“数据库”在线评测系统账号
             <div class="line">
                 已有账号<a href="../LogIn.aspx">立即登录</a>
             </div>
             <div class="line2">
                 <a href="restudy.aspx">申请重修点这里</a>
             </div>
            </div>
            <div>
                注册成功经审核后可以登录该评测系统进行学习<br />
            </div>
            <table id="table1">
                <tr>
                    <td class="td1">
                        <p>学号<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="sno"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="sno" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>姓名<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_name" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>专业班级<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="classname"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="classname" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                        <span style="color: red;">格式如:2015级软件工程(1)班</span>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>手机号<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_phone" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="tb_phone" runat="server" ErrorMessage="手机号输入错误！" ForeColor="Red" ValidationExpression="^[1][3578][0-9]{9}$"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>qq<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="tb_email" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                     <%--   <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" Display="Dynamic" ErrorMessage="邮箱格式不正确" ControlToValidate="tb_email" ValidationExpression="^[a-zA-Z0-9]{1,}@[a-zA-Z0-9]{1,}.(com|net|org|edu|mil|cn|cc)$"></asp:RegularExpressionValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>密码<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_password" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>密码确认<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_Cpassword" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tb_Cpassword" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>教学班<span>*</span></p>
                    </td>
                    <td>
                        <asp:DropDownList ID="Tclass" runat="server" CssClass="drop">
                            <asp:ListItem>----请选择----</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Tclass" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>密保问题一<span>*</span></p>
                    </td>
                    <td>
                        <asp:DropDownList ID="pwdreq1" runat="server" CssClass="drop">
                            <asp:ListItem>----请选择----</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="pwdreq1" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>密保问题一答案<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_answerOne"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="tb_answerOne" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>密保问题二<span>*</span></p>
                    </td>
                    <td>
                        <asp:DropDownList ID="pwdreq2" runat="server" CssClass="drop">
                            <asp:ListItem>----请选择----</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="pwdreq2" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td1">
                        <p>密保问题二答案<span>*</span></p>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tb_answerTwo"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="tb_answerTwo" ForeColor="Red" ErrorMessage="*非空"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="Regiser" runat="server" Text="注&nbsp;&nbsp;&nbsp;册" OnClick="Regiser_Click" />
                        <asp:Button ID="restudy" runat="server"  CausesValidation="false" Text="返回登录"  OnClick="restudy_Click" />
                           
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

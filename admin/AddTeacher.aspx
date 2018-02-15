<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddTeacher.aspx.cs" Inherits="admin_TeacherManage_AddTeacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 
    <link href="../../BS/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
          <div style="margin-bottom:10px; padding:8px 0 8px 15px; background-color:#F5F5F5"><a href="../../Desktop.aspx">桌面</a>&nbsp;&gt;&gt;&nbsp;
            <a href="AdminInfo.aspx">教师信息管理</a>&nbsp;&gt;&gt;&nbsp;
            <a href="UserInfoManger.aspx" style="color:red;">添加老师</a></div>
         <div style="width:800px; margin:0 auto;">
           <%--      <asp:Panel runat="server" ID="pl_CheckPwd">
              <table style="width:350px; margin:25px auto; text-align:left">
                  <tr style="height:35px"><td colspan="2"> 验证密码：</td></tr><tr><td>
        <asp:TextBox runat="server" Width="200px" TextMode="Password" class="form-control" ID="tb_CheckPwd"></asp:TextBox></td><td>
              <asp:Button runat="server" class="btn btn-primary" ID="bt_confirm" OnClick="bt_confirm_Click" Text="确&nbsp;&nbsp;定" />
                      </td> 
                      </tr> 
              </table>
            </asp:Panel>--%>
        <asp:Panel ID="pl_AdmInfo" Visible="true" runat="server">
      <table id="StuInfo" class="table table-bordered table-hover">
            <caption><center><h3><b>添加老师</b></h3></center></caption>
            <tbody>
                 <tr> 
                     <td style="text-align:right;">老师工号：</td>
                  <td > <asp:TextBox ID="tb_TeaNO" class="form-control"  runat="server" required></asp:TextBox></td>
                      <td style="width:110px; text-align:right;">密码：</td>
                    <td><asp:TextBox TextMode="Password" runat="server" class="form-control" ID="tb_Pwd" required></asp:TextBox></td>
                     </tr>
                <tr>
                    <td style="width:120px;text-align:right;">姓名：</td>
                    <td>
                        <asp:TextBox runat="server" class="form-control" ID="tb_name" required ></asp:TextBox></td>
                    <td  style="width:120px;text-align:right;">QQ：</td>
                    <td>
                       <asp:TextBox runat="server" class="form-control" ID="tb_Email" required ></asp:TextBox>
                    </td>
                    </tr>
                <tr>
                   
               <td style="text-align:right;">手机号：</td>
               <td ><asp:TextBox runat="server" class="form-control" ID="tb_Phone" required ></asp:TextBox></td>

                </tr>             
                <tr>
                    <td></td>
                    <td colspan="3" >
                        <asp:Button runat="server" ID="bt_Save" class="btn btn-primary" OnClick="bt_Save_Click" Text="保&nbsp;&nbsp;存"/>
                       </td>
                </tr>
            </tbody>
        </table>
            </asp:Panel>
            </div>
    </form>
</body>
</html>

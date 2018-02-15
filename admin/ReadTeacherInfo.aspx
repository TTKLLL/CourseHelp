<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReadTeacherInfo.aspx.cs" Inherits="admin_TeacherManage_ReadTeacherInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../BS/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-bottom: 10px; padding: 8px 0 8px 15px; background-color: #F5F5F5">
            <a href="../Desktop.aspx">桌面</a>&nbsp;&gt;&gt;&nbsp;
            <a href="AdminInfo.aspx" style="color: red;">教师信息管理</a>
        </div>
        <div>
            <asp:Repeater ID="rp_AdminInfo" runat="server">
                <HeaderTemplate>
                    <table class="table table-bordered table-condensed">
                        <tr class="info" style="font-weight: bolder;">
                            <td style="width: 5%;">序号</td>
                            <td style="width: 25%;">姓名</td>
                            <td style="width: 25%;">联系方式</td>
                            <td style="width: 35%;">QQ</td>
                            <td style="width: 10%;">多选</td>
                        </tr>
                </HeaderTemplate>
                <AlternatingItemTemplate>
                    <tr class="success">
                        <td><%# (Container.ItemIndex + 1) +((Convert.ToBoolean(Request["Page"] != null)) ? (Convert.ToInt32(Request["Page"]) - 1) * 15 : 0)%>


                            <asp:HiddenField runat="server" ID="hi_userName" Value='<%#Eval("teacherId")%>' />
                        </td>
                        <td><%#Eval("teacherName")%></td>
                        <td><%#Eval("teacherPhone")%></td>
                        <td><%#Eval("teacherMail")%></td>
                        <td>
                            <asp:CheckBox runat="server" ID="cb_sel" /></td>
                    </tr>
                </AlternatingItemTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%# (Container.ItemIndex + 1) +((Convert.ToBoolean(Request["Page"] != null)) ? (Convert.ToInt32(Request["Page"]) - 1) * 15 : 0)%>
                            <asp:HiddenField runat="server" ID="hi_userName" Value='<%#Eval("teacherId")%>' />
                        </td>
                        <td><%#Eval("teacherName")%></td>
                        <td><%#Eval("teacherPhone")%></td>
                        <td><%#Eval("teacherMail")%></td>
                        <td>
                            <asp:CheckBox runat="server" ID="cb_sel" /></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
            </asp:Repeater>
            <div style="float: right; padding-right: 50px;">
                <asp:HyperLink ID="lnkPrev" CssClass="btn btn-primary btn-xs" runat="server">上页</asp:HyperLink>
                <asp:HyperLink ID="lnkNext" CssClass="btn btn-primary btn-xs" runat="server">下页</asp:HyperLink>
                &nbsp;第
                <asp:Label ID="lblCurrentPage" runat="server"></asp:Label>
                页 共
        <asp:Label ID="lblTotalPage" runat="server"></asp:Label>页
            </div>
            <div>
                <table style="line-height: 50px;" class="table table-bordered">
                    <tr>
                        <td style="width: 70px; text-align: right;">姓名：</td>
                        <td style="width: 200px">
                            <asp:TextBox runat="server" Width="200px" class="form-control" ID="tb_Query"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Button class="btn btn-primary" runat="server" ID="bt_Query" Text="查&nbsp;&nbsp;询" OnClick="bt_Query_Click" />
                            <a href="AddTeacher.aspx" class="btn btn-primary">添加老师</a>
                            <asp:Button class="btn btn-danger" runat="server" ID="bt_Delete" Text="删除老师" OnClick="bt_Delete_Click" />
                        </td>
                        <td>
                            <asp:Button class="btn btn btn-warning" runat="server" ID="bt_Reset" Text="重置密码" OnClick="bt_Reset_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>

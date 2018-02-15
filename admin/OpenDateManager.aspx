<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OpenDateManager.aspx.cs" Inherits="admin_OpenDateManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/bootstrap-datetimepicker.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">

        <ul style="padding-left: 10px; margin-top: 5px; font-weight: bolder;" id="myTab" class="nav nav-tabs">

            <li class="active">
                <a style="color: red" href="OpenDateManager.aspx">开放时间设置
                </a>
            </li>

        </ul>
        <center><h3 style="color:#777777;"><b>开放时间管理</b></h3></center>
        <div style="width: 600px; height: 500px; border-radius: 8px; margin: 15px auto;">
            <table>
                <tr>
                    <td>
                        <asp:Repeater ID="rp_OpenDate" runat="server">
                            <HeaderTemplate>
                                <table class="table table-bordered table-hover">
                                    <tr>
                                        <td style="width: 105px;">
                                            <b>类别</b>
                                        </td>
                                        <td>
                                            <b>开放开始时间</b>
                                        </td>
                                        <td>
                                            <b>结束开放时间</b>
                                        </td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <%#Eval("name") %><asp:HiddenField runat="server" ID="openId" Value='<%#Eval("Id") %>' />
                                    </td>
                                    <td>
                                        <div class="input-group date form_datetime col-md-5" data-date="2016-04-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
                                            <asp:HiddenField ID="hd_StartDate" runat="server" Value='<%#Eval("openDate") %>' />
                                            <asp:TextBox runat="server" ID="tb_StartDate" class="form-control" ReadOnly="true" Width="180px" Text='<%#Eval("openDate") %>'></asp:TextBox>

                                            
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="input-group date form_datetime col-md-5" data-date="2016-04-16T05:25:07Z" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-field="dtp_input1">
                                            <asp:HiddenField ID="hd_EndDate" runat="server" Value='<%#Eval("endDate") %>' />
                                            <asp:TextBox runat="server" ID="tb_EndDate" class="form-control" Width="180px" ReadOnly="true" Text='<%#Eval("endDate") %>'></asp:TextBox>
                                            <%-- <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>--%>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate></table></FooterTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button runat="server" class="btn btn-primary" ID="bt_Submit" OnClick="bt_Submit_Click" Text="保存修改" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <script src="../js/jquery-1.8.3.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrap-datetimepicker.js"></script>
    <script src="../js/bootstrap-datetimepicker.zh-CN.js"></script>

    <script type="text/javascript">
        $('.form_datetime').datetimepicker({
            language: 'zh-CN',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            forceParse: 0,
            showMeridian: 1
        });
    </script>
</body>
</html>

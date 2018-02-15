<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myClass.aspx.cs" Inherits="student_myClass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/teacher.css" rel="stylesheet" />
    <link href="../BS/Bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <style type="text/css">
        .myClass {
            border: 1px solid #DDDDDD;
            width: 100%;
            font-size: 14px;
            border-collapse: collapse;
        }

            .myClass tr:nth-child(2n) {
                background-color: #E8F4FF;
            }

            .myClass td {
                height: 30px;
                padding-right: 10px;
                padding-left: 10px;
            }



        .myTeacher tr:nth-child(2n+1) {
            /*background-color: #E8F4FF;*/
        }

        .myTeacher tr:nth-child(2n) {
            /*background-color: white;*/
        }

        .myClass td:first-child {
            width: 430px;
            text-align: right;
            border-right: 1px solid #E8F4FF;
        }

        .myTeacher {
            border-collapse: collapse;
        }

            .myTeacher tr {
            }

            .myTeacher td {
                text-align: center;
            }

                .myTeacher td:first-child {
                    width: 60px;
                    border-right: 1px solid #E8F4FF;
                }

            .myTeacher td {
                width: 360px;
            }
            #topTitle {
            padding-top:5px;
            padding-left:5px;
            font-size: 16px !important;
            background-image: url('../image/treetopbg.jpg');
            height: 30px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="topTitle">
            <p style="font-size: 14px">

                <asp:Label ID="Label15" runat="server" Text="我的班级"></asp:Label>
            </p>
        </div>

        <table class="myClass">
            <tr>
                <td class="firstTd">班级名称</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>任课老师</td>
                <td>
                    <asp:Repeater ID="Repeater1" runat="server">
                        <HeaderTemplate>
                            <table class="myTeacher">
                                <tr>
                                    <td>教师名称</td>
                                    <td>手机号</td>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("teacherName") %>'></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("teacherPhone") %>'></asp:Label></td>
                            </tr>

                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
            <tr>
                <td>创建时间</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
            </tr>
            <tr>
                <td>班级人数</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label></td>
            </tr>
        </table>

    </form>
</body>
</html>

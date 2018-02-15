<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fillBlankDetail.aspx.cs" Inherits="student_fillBlankDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/teacher.css" rel="stylesheet" type="text/css" />
    <link href="../css/common.css" rel="stylesheet" />
    <link href="../css/common.css" rel="stylesheet" />
    <link href="../css/L.layout.css" rel="stylesheet" />

    <style type="text/css">
        #content table {
            margin-bottom: 20px;
            font-size: 14px;
            border: 1px #006699 solid;
            width: 940px;
            margin-left: 10px;
            padding-left: 10px;
        }

            #content table tr {
                height: 30px;
            }

                #content table tr td {
                    line-height: 22px;
                }

        #topTitle {
            padding-top: 5px;
            padding-left: 3px;
            font-size: 16px !important;
            background-image: url('../image/treetopbg.jpg');
            height: 30px;
        }

        #topTitle {
            padding-top: 5px;
            padding-left: 5px;
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

                <asp:Label ID="Label15" runat="server" Text="选择题详情"></asp:Label>
            </p>
        </div>
        <div id="content">
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td style="border-bottom: 1px solid #006699">
                                <span style="font-weight: 600">
                                    <label>知识点：</label><asp:Label Visible="false" ID="Label8" runat="server" Text='<%# Eval("PointID") %>'></asp:Label>
                                    <asp:Label ID="Label7" runat="server"></asp:Label>
                                </span>

                                <span style="width: 310px; float: right">
                                    <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("UploadTime") %>'></asp:Label>
                                </span>


                            </td>
                        </tr>
                        <tr>
                            <td><%#Container.ItemIndex+1 %>
                                <asp:Label ID="Label1" runat="server" Text='<%# sub(Eval("FrontTitle").ToString()) %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-top: 1px solid #006699">
                                <label>答案：</label><asp:Label ID="Label6" runat="server" Text='<%# Eval("FAnswer") %>'></asp:Label>
                                <span style="font-weight: 600; padding-left: 20px">
                                    <asp:Label Visible="false" ID="Label11" runat="server" Text='<%# Eval("studentId") %>'></asp:Label>

                                    <asp:Label ID="Label12" Visible="false" runat="server" Text='<%# Eval("TitleState") %>'></asp:Label>
                                    <span style="width: 160px; float: right">
                                        <asp:Label ID="Label13" ForeColor="Red" runat="server" Text="Label"></asp:Label>
                                    </span>
                                </span>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>


            </asp:Repeater>
        </div>
    </form>
</body>
</html>

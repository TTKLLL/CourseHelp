<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindHaveDoFillBlank.aspx.cs" Inherits="student_FindHaveDoFillBlank" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <%--    <link href="../../css/teacher.css" rel="stylesheet" />
    <link href="../../css/L.layout.css" rel="stylesheet" />--%>
    <link href="../css/common.css" rel="stylesheet" />

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
        }

        .PanelCss {
            width: 100%;
            float: left;
        }

        .StuTextBox {
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom-color: #000000;
        }

        #topTitle {
            padding-top: 5px;
            padding-left: 3px;
            font-size: 16px !important;
            background-image: url('../image/treetopbg.jpg');
            height: 30px;
        }
        /*按钮样式*/
        .ButtonCss {
            font-family: "Tahoma", "宋体";
            FONT-SIZE: 9pt;
            color: #003399;
            border: 1px solid #93bee2;
            color: #006699;
            background-image: url('../Image/bluebuttonbg.gif');
            background-color: #e8f4ff;
            CURSOR: hand;
            font-style: normal;
            width: 82px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="topTitle">
                <p style="font-size: 14px">
<span style="position:relative; top:-11px; font-size:14px">已经做完的填空题</span>
                </p>
            </div>
            <div id="content" style="text-align: center;">


                <asp:Panel Visible="true" ID="Panel1" runat="server">
                    <a href="FindHaveDoSingle.aspx" class="targeBtn ">选择题</a>
                    <a href="FindHaveDoFillBlank.aspx" class="targeBtn selected">填空题</a>
                </asp:Panel>

                <table style="width: 100%; height: 85px;">
                    <tr>
                        <td colspan="2" style="height: 10px;" align="left">
                            <asp:Panel ID="PanelC2" runat="server">
                                <asp:Label ID="Label2" runat="server" Text="一、填空题(" Font-Size="9pt"></asp:Label>
                                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="总分" Font-Size="9pt"></asp:Label>
                                <asp:Label ID="Label4" runat="server" ForeColor="Red" Font-Size="9pt">40</asp:Label>
                                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="分，答错不得分" Font-Size="9pt"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text=")" Font-Size="9pt"></asp:Label>
                            </asp:Panel>
                            <asp:Label ID="LabelC2" runat="server" ForeColor="Red" Text="总分" Font-Size="9pt"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">

                            <asp:DataList ID="DataList2" runat="server" BackColor="White" BorderColor="White" BorderStyle="Double" CellPadding="4" Width="474px" Font-Size="9pt">
                                <ItemTemplate>
                                    <p>
                                        <span style="font-weight: 600">
                                            <label>知识点：</label><asp:Label Visible="false" ID="Label8" runat="server" Text='<%# Eval("PointID") %>'></asp:Label>
                                            <asp:Label ID="Label7" runat="server"></asp:Label>
                                        </span>

                                    </p>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Visible="false" Height="19px" Width="1px" Font-Size="9pt" Text='<%#Eval("FID") %>'></asp:Label>
                                    &nbsp;
                                    <asp:Label ID="titleID" runat="server" Height="19px" Width="2px" Font-Size="9pt" Text='<%#Container.ItemIndex+1 %>'></asp:Label>.&nbsp;&nbsp;<%# sub(Eval("FrontTitle").ToString()) %>
                                    <table style="width: 246px; font-size: 9pt;">

                                        <tr>
                                            <td>
                                                <asp:Label ID="titleNote" runat="server" Visible="false" Text='<%#Eval("FAnswer") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="stuAnswer" runat="server" Width="200px" Height="30px" Text='<%#Eval("FAnswer") %>' Enabled="false" CssClass="StuTextBox"></asp:TextBox>
                                            </td>
                                            <td style="text-align: center;">
                                                <asp:Label ID="Label15" runat="server" ForeColor="Red" Text="(注意: 如果有多个空，答案必须用‘$’隔开)" Font-Size="9pt" Width="250px" Height="20px"></asp:Label></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                                <FooterStyle BackColor="White" ForeColor="#333333" />
                                <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                <ItemStyle BackColor="White" ForeColor="#333333" />
                                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />

                            </asp:DataList>
                            <p style="font-size: 9pt">
                                共<asp:Label ID="pageCount" runat="server"></asp:Label>页
                                当前<asp:Label ID="currentPageCount" runat="server"></asp:Label>页
                                <asp:LinkButton ID="first" runat="server" OnClick="buttonPage_Click" CommandName="first">首页</asp:LinkButton>
                                <asp:LinkButton ID="prev" runat="server" OnClick="buttonPage_Click" CommandName="prev">上一页</asp:LinkButton>
                                <asp:LinkButton ID="next" runat="server" OnClick="buttonPage_Click" CommandName="next">下一页</asp:LinkButton>
                                <asp:LinkButton ID="last" runat="server" OnClick="buttonPage_Click" CommandName="last">尾页</asp:LinkButton>
                                <asp:TextBox ID="TextBox1" runat="server" Width="20px"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" CssClass="ButtonCss" Text="Go" OnClick="Button1_Click"></asp:Button>
                            </p>
                        </td>
                    </tr>



                </table>
            </div>
        </div>

    </form>

</body>
</html>

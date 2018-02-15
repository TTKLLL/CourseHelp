<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindHaveDoSingle.aspx.cs" Inherits="student_FindHaveDoSingle" %>

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
            padding-top:5px;
            padding-left:3px;
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

            <div id="content" style="text-align: center;">
                <div id="topTitle" style="text-align: left">
                    <p style="font-size: 12px">
                        <span style="position:relative; top:-10px; font-size:14px">已经做完的选择题</span>
                       
                    </p>
                </div>

                <asp:Panel Visible="true" ID="Panel1" runat="server">
                    <a href="FindHaveDoSingle.aspx" class="targeBtn selected">选择题</a>
                    <a href="FindHaveDoFillBlank.aspx" class="targeBtn">填空题</a>
                </asp:Panel>

                <table style="width: 100%; height: 85px;">
                    <tr>
                        <td colspan="2" style="height: 10px;" align="left">
                            <asp:Panel runat="server" ID="PanelC1">
                                <asp:Label ID="Label14" runat="server" Text="一、单选题(" Font-Size="9pt"></asp:Label>
                                <asp:Label ID="Label15" runat="server" ForeColor="Red" Text="总分" Font-Size="9pt"></asp:Label>
                                <asp:Label ID="Label16" runat="server" ForeColor="Red" Font-Size="9pt">40</asp:Label>
                                <asp:Label ID="Label17" runat="server" ForeColor="Red" Text="分，答错不得分" Font-Size="9pt"></asp:Label>
                                <asp:Label ID="Label18" runat="server" Text=")" Font-Size="9pt"></asp:Label>
                            </asp:Panel>
                            <asp:Label ID="LabelC1" runat="server" ForeColor="Red" Text=" " Font-Size="9pt"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="left">

                            <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Double" CellPadding="4" Width="474px" Font-Size="9pt">

                                <ItemTemplate>

                                    <p>
                                        <span style="font-weight: 600">
                                            <label>知识点：</label><asp:Label Visible="false" ID="Label8" runat="server" Text='<%# Eval("PointID") %>'></asp:Label>
                                            <asp:Label ID="Label7" runat="server"></asp:Label>
                                        </span>

                                    </p>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Height="19px" Width="1px" Font-Size="9pt" Text='<%#Eval("SID") %>' Visible="false"></asp:Label>
                                    &nbsp;
                                    <asp:Label ID="titleID" runat="server" Height="19px" Width="2px" Font-Size="9pt" Text='<%#Container.ItemIndex+1 %>'></asp:Label>.&nbsp;&nbsp;<%# sub(Eval("Title").ToString()) %><table style="width: 246px; font-size: 9pt;">
                                        <tr>
                                            <td colspan="3"></td>
                                        </tr>

                                        <tr>
                                            <td rowspan="4" style="width: 42px;">
                                                <asp:RadioButtonList runat="server" ID="RadioButtonList1" Enabled="false" Height="98px" Font-Size="9pt">
                                                    <asp:ListItem Value="A">A</asp:ListItem>
                                                    <asp:ListItem Value="B">B</asp:ListItem>
                                                    <asp:ListItem Value="C">C</asp:ListItem>
                                                    <asp:ListItem Value="D">D</asp:ListItem>
                                                </asp:RadioButtonList>

                                            </td>
                                            <td colspan="2">
                                                <asp:Label ID="optionA" runat="server" Text='<%#Eval("OptionA") %>'></asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="optionB" runat="server" Text='<%#Eval("OptionB") %>'></asp:Label></td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="optionC" runat="server" Text='<%#Eval("OptionC") %>'></asp:Label></td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Label ID="optionD" runat="server" Text='<%#Eval("OptionD") %>'></asp:Label></td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="titleNote" runat="server" Text='<%#Eval("SAnswer") %>' Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>

                                </ItemTemplate>
                                <FooterStyle BackColor="White" ForeColor="#333333" />
                                <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                <ItemStyle BackColor="White" ForeColor="#333333" />
                                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />

                            </asp:DataList>
                            <p style="font-size: 9pt;">
                                共<asp:Label ID="pageCount" runat="server"></asp:Label>页
                                当前<asp:Label ID="currentPageCount" runat="server"></asp:Label>页
                                <asp:LinkButton ID="first" runat="server" OnClick="buttonPage_Click" CommandName="first">首页</asp:LinkButton>
                                <asp:LinkButton ID="prev" runat="server" OnClick="buttonPage_Click" CommandName="prev">上一页</asp:LinkButton>
                                <asp:LinkButton ID="next" runat="server" OnClick="buttonPage_Click" CommandName="next">下一页</asp:LinkButton>
                                <asp:LinkButton ID="last" runat="server" OnClick="buttonPage_Click" CommandName="last">尾页</asp:LinkButton>
                                <asp:TextBox ID="TextBox1" runat="server" Width="20px"></asp:TextBox>
                                <asp:Button ID="Button1" CssClass="ButtonCss" runat="server" Text="Go" OnClick="Button1_Click"></asp:Button>
                            </p>

                        </td>
                    </tr>



                </table>
            </div>
        </div>

    </form>

</body>
</html>

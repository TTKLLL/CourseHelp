<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StartDoPractice.aspx.cs" Inherits="Studetnt_Practice_StartDoPractice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
<%--    <link href="../css/teacher.css" rel="stylesheet" />
    <link href="../css/L.layout.css" rel="stylesheet" />--%>


    <style type="text/css">
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
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div id="content" style="text-align: center;">

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
                                                <asp:RadioButtonList runat="server" ID="RadioButtonList1" Height="98px" Font-Size="9pt">
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

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="height: 10px;" align="left">
                            <asp:Panel runat="server" ID="PanelC2">
                                <asp:Label ID="Label1" runat="server" Text="二、填空题(" Font-Size="9pt"></asp:Label>
                                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="总分" Font-Size="9pt"></asp:Label>
                                <asp:Label ID="Label4" runat="server" ForeColor="Red" Font-Size="9pt">40</asp:Label>
                                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="分，答错不得分" Font-Size="9pt"></asp:Label>
                                <asp:Label ID="Label6" runat="server" Text=")" Font-Size="9pt"></asp:Label>
                            </asp:Panel>
                             <asp:Label ID="LabelC2" runat="server" ForeColor="Red" Text=" " Font-Size="9pt"></asp:Label>
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
                                    <asp:Label ID="titleID" runat="server" Height="19px" Width="2px" Font-Size="9pt" Text='<%#Container.ItemIndex+1 %>'></asp:Label>.&nbsp;&nbsp;<%# sub(Eval("FrontTitle").ToString())%>
                                    <table style="width: 246px; font-size: 9pt;">

                                        <tr>
                                            <td>
                                                <asp:Label ID="titleNote" runat="server" Visible="false" Text='<%#Eval("FAnswer") %>'></asp:Label>
                                            </td>
                                            <td>

                                                <asp:TextBox TextMode="MultiLine" ID="stuAnswer" runat="server" Width="500px" Height="30px" CssClass="StuTextBox"></asp:TextBox>
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

                        </td>
                    </tr>
                    <tr style="color: #000000">
                        <td align="center" colspan="2" rowspan="2">&nbsp;
                            <asp:Button ID="btnSubmit" runat="server" Font-Size="9pt" OnClick="btnSubmit_Click" Text="交卷" Width="117px" Height="24px" />&nbsp;&nbsp; &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </div>

    </form>

</body>
</html>

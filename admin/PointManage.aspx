<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PointManage.aspx.cs" Inherits="Admin_PointManage_PointManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/L.layout.css" rel="stylesheet" />
    <style type="text/css">
        * {
            font-family: "宋体";
            font-size: 12px;
        }

        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
        }

        .auto-style1 {
            height: 24px;
            width: 110px;
            background-image: url('../image/maillistbutton1.jpg');
            background-size: 110px 24px;
            background-repeat: no-repeat;
            background-position: center;
            vertical-align: middle;
            text-align: center;
        }

        .Labels {
            height: 24px;
            width: 90px;
            background-image: url('../image/maillistbutton2.jpg');
            vertical-align: middle;
            text-align: center;
        }

        .Labelf {
            height: 24px;
            width: 90px;
            background-image: url('../image/maillistbutton1.jpg');
            vertical-align: middle;
            text-align: center;
        }


        * {
            font-family: "宋体";
            font-size: 12px;
        }

        .Newbutton {
            FONT-SIZE: 9pt;
            color: White;
            font-family: "Tahoma","宋体";
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr height="30">
                    <td class="Header">
                        <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;知识点管理</font>
                    </td>
                </tr>
            </table>
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="Labels">
                        <a href="PointManage.aspx" class="Newbutton"><font>&nbsp;查看知识点&nbsp;</font></a></td>
                    <td class="Labelf">
                        <a href="PointAdd.aspx" class="Newbutton"><font>&nbsp;添加知识点&nbsp;</font></a></td>
                    <td align="right"></td>
                    <td align="right"></td>
                </tr>
            </table>
            <div>
                <asp:GridView ID="gvPoint" runat="server" CellPadding="4" ForeColor="#333333"
                    GridLines="None" AutoGenerateColumns="False" Width="100%" DataKeyNames="PointID"
                    OnRowDataBound="gvPoint_RowDataBound" OnRowEditing="gvPoint_RowEditing" OnRowUpdating="gvPoint_RowUpdating" OnRowCancelingEdit="gvPoint_RowCancelingEdit"
                    OnRowDeleting="gvPoint_RowDeleting" UseAccessibleHeader="False" OnPageIndexChanging="gvPoint_PageIndexChanging"
                    PageSize="18" EnableModelValidation="True">
                    <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#E8F4FF" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="cbSelect" runat="server" AutoPostBack="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Label ID="lbNo" runat="server" Text='<%#Eval("PointID") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="编号">
                            <ItemTemplate>
                                <asp:Label ID="label" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField runat="server" HeaderText="一级知识点" DataField="LevelOnePoint"></asp:BoundField>
                        <asp:BoundField runat="server" HeaderText="二级知识点" DataField="LevelTwoPoint"></asp:BoundField>
                        <asp:CommandField ShowEditButton="true" HeaderText="编辑" />
                        <asp:CommandField ShowDeleteButton="true" HeaderText="删除" />
                    </Columns>
                </asp:GridView>
            </div>
            <div>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" CssClass="redButtonCss" Text="查询" OnClick="Button2_Click" />
                <asp:CheckBox ID="cb2" runat="server" Text="全选" AutoPostBack="True"
                    OnCheckedChanged="cb2_CheckedChanged" />
                <asp:Button ID="btnDelete" runat="server" CssClass="redButtonCss" Text="删除" OnClick="btnDelete_Click" />
            </div>
        </div>
    </form>
</body>
</html>

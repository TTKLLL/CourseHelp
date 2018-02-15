<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mySingle.aspx.cs" Inherits="student_mySingle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/teacher.css" rel="stylesheet" type="text/css" />
    <link href="../css/common.css" rel="stylesheet" />
    <link href="../css/L.layout.css" rel="stylesheet" />
    <style type="text/css">
        .gridviewItem {
            height: 30px !important;
            font-size:12px ;
        }

        .selected {
            background-color: #29709A !important;
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
        <div>
            <div id="topTitle">
                <p style="font-size:14px">

                    <asp:Label ID="Label15" runat="server" Text="我上传的选择题"></asp:Label>
                </p>
            </div>

            <asp:Panel Visible="true" ID="Panel1" runat="server">
                 <a href="/student/mySingle.aspx" class="targeBtn selected">我的上传</a>
                <a href="/public/addSingle.aspx" class="targeBtn">上传选择题</a>
            </asp:Panel>

            <div style="margin-top:50px">
                <asp:GridView   RowStyle-CssClass="gridviewItem" OnRowDataBound="mySingle_RowDataBound" RowStyle-Font-Size="18px" ID="mySingle" runat="server" OnPageIndexChanging="mySingle_PageIndexChanging" AutoGenerateColumns="False" EnableModelValidation="True"
                Width="100%" AllowPaging="True" CellPadding="4" ForeColor="#333333" BorderWidth="0px" PageSize="40" GridLines="None" Style="margin-top: 0px" Font-Size="30">
                <AlternatingRowStyle BackColor="White" CssClass="myGrid" />
                <Columns>
                    <asp:TemplateField ItemStyle-CssClass="gridviewItem" ItemStyle-Width="6%" HeaderText="序号">
                        <ItemTemplate>
                            <asp:Label ID="order" runat="server" Text=""></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="gridviewItem" ItemStyle-Width="10%" HeaderText="一级知识点">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("PointID") %>'></asp:Label>
                            <asp:Label ID="Label1" runat="server" Text=''></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="gridviewItem" ItemStyle-Width="20%" HeaderText="二级知识点">
                        <ItemTemplate>
                            <asp:Label ID="levelTwo" runat="server" Text=''></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  ItemStyle-CssClass="gridviewItem" ItemStyle-Width="35%" ItemStyle-ForeColor="Blue" ControlStyle-Font-Size="14px" HeaderText="题目标题">
                        <ItemTemplate>
                            <asp:Label ID="Label3" Visible="false" runat="server" Text='<%# Eval("SID") %>'></asp:Label>
                            <asp:HyperLink ID="title" runat="server"><%# StringTruncat(Eval("Title").ToString(), 30, "...") %></asp:HyperLink>

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="gridviewItem" ItemStyle-Width="15%" HeaderText="上传时间">
                        <ItemTemplate>
                            <asp:Label ID="time" runat="server" Text='<%# Eval("UploadTime") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-CssClass="gridviewItem"  ItemStyle-Width="20%" HeaderText="审核状态">
                        <ItemTemplate>
                            <asp:Label ForeColor="Red" ID="state" runat="server" Text='<%# Eval("TitleState") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#498dbd" Font-Bold="false" ForeColor="White" Font-Size="14px" />
                <PagerStyle BackColor="#498dbd" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#e8f4ff" Font-Size="12px" HorizontalAlign="Center" Font-Names="Arial" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:GridView>
            </div>
            


        </div>
    </form>
</body>
</html>

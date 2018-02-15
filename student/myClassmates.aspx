<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myClassmates.aspx.cs" Inherits="teacher_classExercise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/common.css" rel="stylesheet" />
    <link href="../css/L.layout.css" rel="stylesheet" />
    <link href="../css/TabStyle.css" rel="stylesheet" />
    <link href="../css/teacher.css" rel="stylesheet" />
    <style type="text/css">
        .gridviewItem {
            height: 30px;
            font-size: 18px;
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
                <asp:Label ID="Label1" runat="server" Text="我的同学"></asp:Label>
            </p>
        </div>

        <div style="margin-top: 10px">
            <asp:GridView RowStyle-CssClass="gridviewItem" OnRowDataBound="myClassMates_RowDataBound"  ID="myClassMates" runat="server" OnPageIndexChanging="myClassMates_PageIndexChanging" AutoGenerateColumns="False" EnableModelValidation="True"
                Width="100%" AllowPaging="True" CellPadding="4" ForeColor="#333333" BorderWidth="0px" PageSize="40" GridLines="None" Style="margin-top: 0px">
                <AlternatingRowStyle BackColor="White"  CssClass="myGrid" />
                <Columns>
                    <asp:TemplateField ItemStyle-Height="30" ItemStyle-Width="6%"  HeaderText="序号">
                        <ItemTemplate>
                            <asp:Label ID="order" runat="server" Text=""></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="10%"  HeaderText="学号">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("studentId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="10%"  HeaderText="姓名">
                        <ItemTemplate>
                            <asp:Label ID="name" runat="server" Text='<%# Eval("studentName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField ItemStyle-Width="15%" HeaderText="专业"> 
                        <ItemTemplate>
                            <asp:Label ID="natulaClass" runat="server" Text='<%# Eval("NaturalClass") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    
                    <asp:TemplateField ItemStyle-Width="10%" HeaderText="正确的选择题">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField ItemStyle-Width="10%" HeaderText="正确的填空题">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink3" runat="server"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="10%" HeaderText="成功上传的选择题">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="10%" HeaderText="成功上传的填空题">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
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



    </form>
</body>
</html>

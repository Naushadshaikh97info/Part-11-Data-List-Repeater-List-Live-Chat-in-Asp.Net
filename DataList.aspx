<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataList.aspx.cs" Inherits="Admin_Pear" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
  <table>
        <tr>
            <td>
                Name
            </td>
            <td>
                <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Photo
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                Price
            </td>
            <td>
                <asp:TextBox ID="txt_price" runat="server"></asp:TextBox>
            </td>
        </tr>  
        <tr>
            <td>
                <asp:Button ID="btn_submit" runat="server" Text="Submit" onclick="btn_submit_Click" 
                    />
                <asp:Button ID="btn_update" runat="server" Text="Update" onclick="btn_update_Click" 
                    />
            </td>
        </tr>
    </table>
    <table>
    <tr>
    <td>
    <asp:GridView ID="GridView1_shop" runat="server" AllowPaging="true" 
            AutoGenerateColumns="false" DataKeyNames="code" PageSize="5" 
            onrowdeleting="GridView1_shop_RowDeleting" onrowediting="GridView1_shop_RowEditing" 
            
           >
        <Columns>
        <asp:BoundField HeaderText="Name" DataField="name"/>
          <asp:TemplateField HeaderText="Image">
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("fhoto_nm") %>' Width="50px" Height="50px"/>
        </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="Price" DataField="price"/>
        <asp:CommandField HeaderText="Delete" ButtonType="Link" ShowDeleteButton="true"/>
        <asp:CommandField HeaderText="Edit" ButtonType="Link" ShowEditButton="true"/>
        </Columns>
        </asp:GridView>
    </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>

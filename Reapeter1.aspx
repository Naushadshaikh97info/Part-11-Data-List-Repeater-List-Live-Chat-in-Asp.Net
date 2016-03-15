<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reapeter1.aspx.cs" Inherits="Admin_Reapeter1" %>

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
                    Photo
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btn_submit_Click" />
                    <asp:Button ID="btn_update" runat="server" Text="Update" OnClick="btn_update_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="GridView1_repeater" runat="server" AllowPaging="true" AutoGenerateColumns="false"
                        PageSize="5" DataKeyNames="code" OnRowDeleting="GridView1_repeater_RowDeleting"
                        OnRowEditing="GridView1_repeater_RowEditing" 
                        onpageindexchanging="GridView1_repeater_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("fhoto_nm") %>' Width="50px"
                                        Height="50px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField HeaderText="Delete" ButtonType="Link" ShowDeleteButton="true" />
                            <asp:CommandField HeaderText="Edit" ButtonType="Link" ShowEditButton="true" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>

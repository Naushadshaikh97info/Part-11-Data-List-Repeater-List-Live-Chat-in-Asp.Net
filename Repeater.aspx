<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Repeater.aspx.cs" Inherits="Admin_Repeater" %>

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
                    Titel
                </td>
                <td>
                    <asp:TextBox ID="txt_titel" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Name
                </td>
                <td>
                    <asp:TextBox ID="txt_Name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Details
                </td>
                <td>
                    <asp:TextBox ID="txt_details" runat="server"></asp:TextBox>
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
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" 
                        onclick="btn_submit_Click" />
                    <asp:Button ID="btn_update" runat="server" Text="Update" 
                        onclick="btn_update_Click" />
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td>
                    <asp:GridView ID="GridView1_repeater" runat="server" AllowPaging="true" AutoGenerateColumns="false"  PageSize="5"
                        DataKeyNames="code" onrowdeleting="GridView1_repeater_RowDeleting" 
                        onrowediting="GridView1_repeater_RowEditing">
                        <Columns>
                            <asp:BoundField HeaderText="Titel" DataField="titel" />
                            <asp:BoundField HeaderText="Name" DataField="name" />
                            <asp:BoundField HeaderText="Details" DataField="details" />
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

<%@ Page Title="" Language="C#" MasterPageFile="~/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="AddressBookSystem.AddressBook.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleSheet/ListPageCss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="container">
        <div>
            <div class="add-bttn">
                <asp:Button ID="Button1" CssClass="btn btn-lg btn-success" runat="server" Text="Add Contact" OnClick="Button1_Click" />
            </div>
            <div>
                <div>
                    <asp:GridView runat="server" ID="GridViewdata" AutoGenerateColumns="False" DataKeyNames="Id" OnRowCancelingEdit="GridViewdata_RowCancelingEdit" OnRowDeleting="GridViewdata_RowDeleting" OnRowEditing="GridViewdata_RowEditing" OnRowUpdating="GridViewdata_RowUpdating" CellPadding="10" CellSpacing="10" HorizontalAlign="Center">
                        <HeaderStyle CssClass="headerstyle" />
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Contact ID" ReadOnly="true" />
                            <asp:TemplateField HeaderText="First Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" CssClass="box-size" runat="server" Text='<%# Eval("FirstName") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Last Name">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("LastName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" CssClass="box-size" runat="server" Text='<%# Eval("LastName") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" CssClass="box-size" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="City">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("City") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" CssClass="box-size" runat="server" Text='<%# Eval("City") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="State">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList style="width:170px" Text='<%# Eval("State") %>' ID="State" runat="server">
                                         <asp:ListItem>Maharashtra</asp:ListItem>
                                        <asp:ListItem>Gujarat</asp:ListItem>
                                        <asp:ListItem>Madhya Pradesh</asp:ListItem>
                                        <asp:ListItem>Jammu and Kashmir</asp:ListItem>
                                        <asp:ListItem>Uttar Pradesh</asp:ListItem>
                                        <asp:ListItem>Punjab</asp:ListItem>
                                        <asp:ListItem>Rajasthan</asp:ListItem>     
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pincode">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Pincode") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" CssClass="box-size" runat="server" Text='<%# Eval("Pincode") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" CssClass="box-size" runat="server" Text='<%# Eval("Phone") %>'></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="rev" runat="server" ErrorMessage="The PhoneNumber field is not a valid phone number." ControlToValidate="TextBox7" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" ></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox7"
                                         ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" style="width:160px" runat="server" Text='<%# Eval("Email") %>'></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox8"
                      ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                      Display = "Dynamic" ErrorMessage = "Invalid email address"/>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox8"
                        ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                         
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField  ShowEditButton="True" ShowDeleteButton="true" ButtonType="Image" CancelImageUrl="~/Images/Cancel.png" DeleteImageUrl="~/Images/Delete.png" EditImageUrl="~/Images/Edit.png" UpdateImageUrl="~/Images/Update.png" HeaderText="Operations" >
                            <ControlStyle Width="30px" />
                            </asp:CommandField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div>
                <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

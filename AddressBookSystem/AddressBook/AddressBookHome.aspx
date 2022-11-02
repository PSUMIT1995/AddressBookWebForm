<%@ Page Title="" Language="C#" MasterPageFile="~/AddressBookMasterPage.Master" AutoEventWireup="true" CodeBehind="AddressBookHome.aspx.cs" Inherits="AddressBookSystem.AddressBook.AddressBookHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../StyleSheet/HomePageCss.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Container">
        <div class="sub-container" style="padding:48px">
            <div class="heading-container">
                <div>
                    <h2>ContactBook</h2>
                </div>
            </div>
            <div class="field-container1">
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="FirstName"></asp:Label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                </div>
                <div>
                    <asp:Label ID="Label2" runat="server" Text="LastName"></asp:Label>
                    <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                </div>
            </div>
            <div class="field-container2">
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox8"
                      ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                      Display = "Dynamic" ErrorMessage = "Invalid email address"/>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox8"
                        ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                         
                        
   
                      
  
                </div>
            </div>
            <div class="field-container3">
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                </div>
            </div>
            <div class="field-container4">
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="City"></asp:Label>
                    <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                </div>


                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="State"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="State" runat="server">
                        <asp:ListItem>------- Select -------</asp:ListItem>
                        <asp:ListItem>Maharashtra</asp:ListItem>
                        <asp:ListItem>Gujarat</asp:ListItem>
                        <asp:ListItem>Madhya Pradesh</asp:ListItem>
                        <asp:ListItem>Punjab</asp:ListItem>
                        <asp:ListItem>Rajasthan</asp:ListItem>
                        <asp:ListItem>Uttar Pradesh</asp:ListItem>
                       
                    </asp:DropDownList>
                </div>
            </div>
            <div class="field-container5">
                <div class="form-group">
                    <asp:Label ID="Label6" runat="server" Text="Zip"></asp:Label>
                    <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                </div>


                <div class="form-group">
                    <asp:Label ID="Label7" runat="server" Text="Phone"></asp:Label>
                    <asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="rev" runat="server" ErrorMessage="The PhoneNumber field is not a valid phone number." ControlToValidate="TextBox7" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$" ></asp:RegularExpressionValidator>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox7"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                </div>

            </div>
            <div class="field-container6">
                <div class="form-group">
                    <asp:Button ID="Button1" CssClass="btn btn-group-lg btn-warning" runat="server" Text="Back To List" OnClick="Button1_Click" />
                </div>
                <div>
                    <asp:Button ID="Button2" CssClass="btn btn-group-lg btn-success" runat="server" Text="Submit" OnClick="Button2_Click" />
                </div>
            </div>
            <div class="error-msg">
                <div class="form-group">
                    <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventManager.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Navigation" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="UserEmail" CssClass="col-md-2 control-label">User Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="UserEmail" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserEmail"
                                CssClass="text-danger" ErrorMessage="The User Email field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" CssClass="form-control" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                CssClass="text-danger" ErrorMessage="The Password field is required." />
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="UserLogin" Text="Login" CssClass="btn btn-default" />
                            <br />
                            <asp:Label ID="LoginFail" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>

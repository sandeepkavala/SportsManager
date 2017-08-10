<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameManager.aspx.cs" Inherits="EventManager.GameManager" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Navigation" runat="server">
    <ul class="nav navbar-nav">
        <li><a runat="server" href="~/AdminHome">Home</a></li>
        <li><a runat="server" href="~/GameManager">Games</a></li>
        <li><a runat="server" href="~/PlayerManager">Competitors</a></li>
        <li><a runat="server" href="~/Plays">Game Plays</a></li>
        <li><a runat="server" href="~/EditGames">Manage</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="GameID1" CssClass="col-md-2 control-label">GameID</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="GameID1" MaxLength="25" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="GameID1"
                                CssClass="text-danger" ErrorMessage="The GameID field is required." />
                            <asp:Label ID="IDTest1" runat="server" CssClass="text-warning" Text="GameID Already Exists" Visible="False"></asp:Label>
                            <asp:RegularExpressionValidator ID="GameIdValidator" runat="server" ControlToValidate="GameID1" CssClass="text-danger" ErrorMessage="Invalid Game Code. Enter 1-99999" ValidationExpression="\d{1,5}"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="GameCode" CssClass="col-md-2 control-label">Game Code</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="GameCode" MaxLength="7" CssClass="form-control" OnTextChanged="GameCode_TextChanged" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="GameCode"
                                CssClass="text-danger" ErrorMessage="The GameCode field is required." />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="GameCode"
                                CssClass="text-danger" ErrorMessage="Enter Game Code in Format : ABCD123" ValidationExpression="^[A-Z]{4}\d{3}">
                            </asp:RegularExpressionValidator>
                            <asp:Label ID="CodeTest" AssociatedControlID="GameCode" Visible="False" runat="server" CssClass="text-warning" Text="Game Code Already Exists"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="GameName" CssClass="col-md-2 control-label">Game Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="GameName" MaxLength="25" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="GameName"
                                CssClass="text-danger" ErrorMessage="The Game Name field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="GameDuration" CssClass="col-md-2 control-label">Duration(hrs)</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="GameDuration" CssClass="form-control" />
                            <asp:RegularExpressionValidator ID="DurationValidator" runat="server" ControlToValidate="GameDuration"
                                CssClass="text-danger" ErrorMessage="Invalid Duration time" ValidationExpression="\d{1,2}(.\d{1,2})?"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="GameDescription" CssClass="col-md-2 control-label">Description</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="GameDescription" MaxLength="225" CssClass="form-control" TextMode="MultiLine" Rows="2" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="GameRules" CssClass="col-md-2 control-label">Game Rules</asp:Label>
                        <div class="col-md-10">
                            <asp:FileUpload ID="GameRules" runat="server" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="GameRules"
                                CssClass="text-danger" ErrorMessage="The GameRules field is required." />
                            <asp:RegularExpressionValidator ID="FileUploadValidator" runat="server" ControlToValidate="GameRules" CssClass="text-danger" ErrorMessage="Upload .pdf .doc .docx files only" ValidationExpression="^.*\.(docx|DOCX|doc|DOC|pdf|PDF)$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="EnterData" Text="Submit" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>

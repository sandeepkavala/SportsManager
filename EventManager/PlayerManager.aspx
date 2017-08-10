<%@ Page Title="Competitor Manager" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PlayerManager.aspx.cs" Inherits="EventManager.PlayerManager" %>

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
    <h2>Add Competitor Details </h2>
    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="CompID" CssClass="col-md-2 control-label">CompID</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="CompID" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CompID"
                                CssClass="text-danger" ErrorMessage="The CompID field is required." />
                            <asp:Label ID="CompIDTest" runat="server" AssociatedControlID="CompID" CssClass="text-warning" Text="CompID Already Exists" Visible="False"></asp:Label>
                            <asp:RegularExpressionValidator ID="CompIDegex" runat="server" ControlToValidate="CompID" CssClass="text-danger" ErrorMessage="Enter ID between 1-99999" ValidationExpression="\d{1,5}"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="DropDownList3" CssClass="col-md-2 control-label">Salutation</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control">
                                <asp:ListItem Value=" ">-</asp:ListItem>
                                <asp:ListItem>Mr</asp:ListItem>
                                <asp:ListItem>Ms</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="CompName" CssClass="col-md-2 control-label">Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="CompName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CompName"
                                CssClass="text-danger" ErrorMessage="The Name field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="DOB" CssClass="col-md-2 control-label">Date of Birth</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="DOB" CssClass="form-control" TextMode="Date" />
                            <br />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email ID</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" OnTextChanged="Email_TextChanged" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The Email ID field is required." />
                            <asp:RegularExpressionValidator ID="RegExEmail" runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="Please Enter Valid Email ID"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <asp:Label ID="EmailTest" runat="server" CssClass="text-warning" Text="Email already exists" Visible="False"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="CDescription" CssClass="col-md-2 control-label">Description</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="CDescription" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                            <br />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Country" CssClass="col-md-2 control-label">Country</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Country" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Country"
                                CssClass="text-danger" ErrorMessage="The Country field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="DropDownList1" CssClass="col-md-2 control-label">Gender</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownList1"
                                CssClass="text-danger" ErrorMessage="The Gender field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Contact" CssClass="col-md-2 control-label">Contact#</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Contact" CssClass="form-control" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Contact" CssClass="text-danger" ErrorMessage="No - / allowed Please enter digits" ValidationExpression="\d{5,12}"></asp:RegularExpressionValidator>
                            <br />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Website" CssClass="col-md-2 control-label">Website</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Website" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Photo" CssClass="col-md-2 control-label">Photo</asp:Label>
                        <div class="col-md-10">
                            <asp:FileUpload ID="Photo" runat="server" />
                            <asp:RegularExpressionValidator ID="Photocheck" runat="server" ControlToValidate="Photo" CssClass="text-danger" ErrorMessage="Invalid File Format" ValidationExpression="^.*\.(jpg|JPG|JPEG|jpeg|png|PNG|bmp|BMP)$"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="DropDownList2" CssClass="col-md-2 control-label">GameID</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1"
                                DataTextField="GameCode" DataValueField="GameID" AppendDataBoundItems="true">
                                <asp:ListItem> </asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT * FROM [Game]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="DropDownList2"
                                CssClass="text-danger" ErrorMessage="Participation in atleast one game is required." />
                            <asp:Label ID="PlayTest" runat="server" AssociatedControlID="DropDownList2" CssClass="text-warning" Text="Already Participates in this game" Visible="False"></asp:Label>
                        </div>
                    </div>
                    <hr />

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="EnterData" Text="Submit" CssClass="btn btn-default" />
                        </div>
                    </div>
                    <hr />
                </div>
            </section>
        </div>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Photos.aspx.cs" Inherits="EventManager.Photos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Navigation" runat="server">
    <ul class="nav navbar-nav">
        <li><a runat="server" href="~/EventHome">Home</a></li>
        <li><a runat="server" href="~/EventManager">Events</a></li>
        <li><a runat="server" href="~/Photos">Photos</a></li>
        <li><a runat="server" href="~/Results">Results</a></li>
        <li><a runat="server" href="~/EditEvents">Manage</a></li>
        <li><a runat="server" href="~/Report">Report</a></li>
        <li><a runat="server" href="~/Search">Search</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EventList" CssClass="col-md-2 control-label">Event ID</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="EventList" CssClass="form-control" Width="44%" runat="server"
                                DataSourceID="EventQuery" DataTextField="EventID" DataValueField="EventID" AppendDataBoundItems="true">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EventList"
                                CssClass="text-danger" ErrorMessage="The EventID field is required." />
                            <asp:SqlDataSource ID="EventQuery" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT [EventID] FROM [Event]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Photo" CssClass="col-md-2 control-label">Photo</asp:Label>
                        <div class="col-md-10">
                            <asp:FileUpload ID="Photo" CssClass="form-control" Width="44%" runat="server" />
                            <asp:RequiredFieldValidator ID="PhotoValidator" runat="server" ControlToValidate="Photo"
                                CssClass="text-danger" ErrorMessage="Upload a Photo"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="PhotoRegex" runat="server" ControlToValidate="Photo" CssClass="text-danger" ErrorMessage="Invalid Photo format" ValidationExpression="^.*\.(jpg|JPG|JPEG|jpeg|png|PNG|bmp|BMP)$"></asp:RegularExpressionValidator>
                        </div>
                    </div>


                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="PhotoTags" CssClass="col-md-2 control-label">Photo Tags</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="PhotoTags" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="PhotoTagsValid" runat="server" ErrorMessage="EnterPhotoTags" ControlToValidate="PhotoTags" CssClass="text-danger"></asp:RequiredFieldValidator>
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

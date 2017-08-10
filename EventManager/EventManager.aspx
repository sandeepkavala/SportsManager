<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventManager.aspx.cs" Inherits="EventManager.EventManager" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Navigation" runat="server">
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

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EventID" CssClass="col-md-2 control-label">Event ID</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="EventID" MaxLength="5" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EventID"
                                CssClass="text-danger" ErrorMessage="The EventID field is required." />
                            <asp:RegularExpressionValidator ID="EventIDValidator" runat="server" ErrorMessage="Enter Valid ID from 1-99999" ValidationExpression="\d{1,5}" ControlToValidate="EventID" CssClass="text-danger"></asp:RegularExpressionValidator>
                            <br />
                            <asp:Label ID="EventCheck" runat="server" CssClass="text-warning" Text="EventID Already Exists" Visible="False"></asp:Label>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="GameIDList" CssClass="col-md-2 control-label">GameID</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="GameIDList" Width="44%" CssClass="form-conrtol" runat="server" DataSourceID="GameIDQuery"
                                DataTextField="GameID" DataValueField="GameID" AppendDataBoundItems="true">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="GameIDQuery" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT [GameID], [GameCode] FROM [Game]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="GameIDList"
                                CssClass="text-danger" ErrorMessage="The GameID field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="FeatureEvent" CssClass="col-md-2 control-label">Feature Event</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="FeatureEvent" MaxLength="50" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EventVenue" CssClass="col-md-2 control-label">Event Venue</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="EventVenue" MaxLength="50" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EventVenue"
                                CssClass="text-danger" ErrorMessage="The Event Venue field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EventDate" CssClass="col-md-2 control-label">Event Date</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="EventDate" Width="44%" CssClass="form-control" TextMode="Date" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EventDate"
                                CssClass="text-danger" ErrorMessage="The Event Date field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EventStartTime" CssClass="col-md-2 control-label">Start Time</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="EventStartTime" CssClass="form-control" AutoPostBack="True" OnTextChanged="EventStartTime_TextChanged" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EventStartTime"
                                CssClass="text-danger" ErrorMessage="The Event Start Time is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EventEndTime" CssClass="col-md-2 control-label">End Time</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="EventEndTime" MaxLength="10" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EventEndTime"
                                CssClass="text-danger" ErrorMessage="The Event End Time field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EventDescription" CssClass="col-md-2 control-label">Description</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="EventDescription" Width="44%" MaxLength="225" CssClass="form-control" Rows="4" TextMode="MultiLine" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EventDescription"
                                CssClass="text-danger" ErrorMessage="The Event Description field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="WorldRecord" CssClass="col-md-2 control-label">World Record</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="WorldRecord" Width="44%" CssClass="form-control" runat="server">
                                <asp:ListItem>No</asp:ListItem>
                                <asp:ListItem>Yes</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EventPhoto" CssClass="col-md-2 control-label">Photo</asp:Label>
                        <div class="col-md-10">
                            <asp:FileUpload ID="EventPhoto" Width="44%" CssClass="form-control" runat="server" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EventPhoto"
                                CssClass="text-danger" ErrorMessage="The Event Photo field is required." />
                            <asp:RegularExpressionValidator ID="PhotoRegex" runat="server" ErrorMessage="Invalid File Format" CssClass="text-danger" ValidationExpression="^.*\.(jpg|JPG|JPEG|jpeg|png|PNG|bmp|BMP)$" ControlToValidate="EventPhoto"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="PhotoTags" CssClass="col-md-2 control-label">Photo Tags</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="PhotoTags" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="PhotoTags"
                                CssClass="text-danger" ErrorMessage="Photo tags are required." />
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

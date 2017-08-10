<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="EventManager.Results" %>

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
                    <h2>Add Results</h2>
                    <hr />
                    <asp:Label ID="EventCheck" runat="server" Text="Competitor Already Added for the Event" CssClass="text-danger" Visible="False"></asp:Label>
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EventList" CssClass="col-md-2 control-label">EventID</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="EventList" CssClass="form-control" Width="44%" runat="server" DataSourceID="EventQuery"
                                DataTextField="EventID" DataValueField="EventID" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="EventList_SelectedIndexChanged1">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EventList"
                                CssClass="text-danger" ErrorMessage="The EventID field is required." />
                            <asp:SqlDataSource ID="EventQuery" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT [EventID] FROM [Event]
ORDER BY [EventID]"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="CompList" CssClass="col-md-2 control-label">CompID</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="CompList" CssClas="form-control" Width="44%" runat="server" DataSourceID="CompQuery"
                                DataTextField="CompID" DataValueField="CompID" AppendDataBoundItems="True">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CompList"
                                CssClass="text-danger" ErrorMessage="The CompetitorID field is required." />
                            <asp:SqlDataSource ID="CompQuery" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT [CompID] FROM [Competitor]
ORDER BY [CompID]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="CompPosition" CssClass="col-md-2 control-label">Position</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="CompPosition" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CompPosition"
                                CssClass="text-danger" ErrorMessage="The Position field is required." />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="CompPosition" CssClass="text-danger" ErrorMessage="Invalid Position" ValidationExpression="\d{1,3}"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Medals" CssClass="col-md-2 control-label">Medal</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="Medals" Width="44%" CssClass="from-control" runat="server">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>NONE</asp:ListItem>
                                <asp:ListItem>GOLD</asp:ListItem>
                                <asp:ListItem>SILVER</asp:ListItem>
                                <asp:ListItem>BRONZE</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Medals"
                                CssClass="text-danger" ErrorMessage="The Medals field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Record" CssClass="col-md-2 control-label">World Record</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="Record" Width="44%" CssClass="from-control" runat="server">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>NO</asp:ListItem>
                                <asp:ListItem>YES</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Record"
                                CssClass="text-danger" ErrorMessage="The World Record field is required." />
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

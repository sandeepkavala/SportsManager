<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Plays.aspx.cs" Inherits="EventManager.Plays" %>

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
        <h2>Add Competitors to Game Events</h2>
        <div class="col-md-8">
            <section id="PlayForm">
                <div class="form-horizontal">
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="GameList" CssClass="col-md-2 control-label">GameID</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="GameList" CssClass="form-control" runat="server" DataSourceID="GameDataSQL"
                                DataTextField="GameCode" DataValueField="GameID" AppendDataBoundItems="True">
                                <asp:ListItem> </asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="GameList"
                                CssClass="text-danger" ErrorMessage="The GameCode is required." />
                            <asp:SqlDataSource ID="GameDataSQL" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT * FROM [Game]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="PlayerList" CssClass="col-md-2 control-label">Competitor ID</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="PlayerList" CssClass="form-control" runat="server" DataSourceID="PlayerDataSQL"
                                DataTextField="CompName" DataValueField="CompID" AppendDataBoundItems="True">
                                <asp:ListItem> </asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="PlayerDataSQL" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT * FROM [Competitor]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="PlayerList"
                                CssClass="text-danger" ErrorMessage="The Competitor ID is required." />
                        </div>
                    </div>

                    <asp:Label ID="Playcheck" runat="server" CssClass="text-danger" Text="The Competitor is already registered for the given game." Visible="False"></asp:Label>

                    <hr />

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="EnterPlays" Text="Submit" CssClass="btn btn-default" />
                        </div>
                    </div>
                    <hr />
            </section>
        </div>
    </div>
</asp:Content>

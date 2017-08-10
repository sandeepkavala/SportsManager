<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminManage.aspx.cs" Inherits="EventManager.AdminManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Navigation" runat="server">
    <ul class="nav navbar-nav">
        <li><a runat="server" href="~/AdminHome">Home</a></li>
        <li><a runat="server" href="~/GameManager">Games</a></li>
        <li><a runat="server" href="~/PlayerManager">Competitors</a></li>
        <li><a runat="server" href="~/Plays">Game Plays</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="Games" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" DeleteCommand="DELETE FROM [Game] WHERE [GameID] = @GameID" InsertCommand="INSERT INTO [Game] ([GameCode], [GameName], [GameDuration], [GameDescription], [GameRules]) VALUES (@GameCode, @GameName, @GameDuration, @GameDescription, @GameRules)" SelectCommand="SELECT * FROM [Game]" UpdateCommand="UPDATE [Game] SET [GameCode] = @GameCode, [GameName] = @GameName, [GameDuration] = @GameDuration, [GameDescription] = @GameDescription, [GameRules] = @GameRules WHERE [GameID] = @GameID">
        <DeleteParameters>
            <asp:Parameter Name="GameID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="GameCode" Type="String" />
            <asp:Parameter Name="GameName" Type="String" />
            <asp:Parameter Name="GameDuration" Type="Decimal" />
            <asp:Parameter Name="GameDescription" Type="String" />
            <asp:Parameter Name="GameRules" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="GameCode" Type="String" />
            <asp:Parameter Name="GameName" Type="String" />
            <asp:Parameter Name="GameDuration" Type="Decimal" />
            <asp:Parameter Name="GameDescription" Type="String" />
            <asp:Parameter Name="GameRules" Type="String" />
            <asp:Parameter Name="GameID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="GameID" DataSourceID="Games">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="GameCode" HeaderText="GameCode" SortExpression="GameCode" />
            <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
            <asp:BoundField DataField="GameDuration" HeaderText="GameDuration" SortExpression="GameDuration" />
            <asp:BoundField DataField="GameDescription" HeaderText="GameDescription" SortExpression="GameDescription" />
        </Columns>
    </asp:GridView>
    <br />
</asp:Content>

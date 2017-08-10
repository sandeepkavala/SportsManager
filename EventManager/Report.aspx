<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="EventManager.Report" %>

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
    <h2>CountryList by Medals</h2>
    <div>

        <asp:SqlDataSource ID="MedalQuery" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="select CompCountry as Country, count(case when CompMedal ='GOLD' then 1 else null end) as Gold,
count(case when CompMedal='SILVER' then 1 else null end) as Silver,
count(case when CompMedal='BRONZE' then 1 else null end) as Bornze,
count(CompMedal) as Total
from Competitor as c inner join result as r
on c.CompID = r.CompID
group by CompCountry
order by Total DESC, CompCountry;"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" CellPadding="6" width="500px" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="MedalQuery">
            <Columns>
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:BoundField DataField="Gold" HeaderText="Gold" ReadOnly="True" SortExpression="Gold" />
                <asp:BoundField DataField="Silver" HeaderText="Silver" ReadOnly="True" SortExpression="Silver" />
                <asp:BoundField DataField="Bornze" HeaderText="Bornze" ReadOnly="True" SortExpression="Bornze" />
                <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
            </Columns>
            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:GridView>

    </div>
    <h2>World Records</h2>
    <div>

        <asp:SqlDataSource ID="WorlRecordQuery" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT Competitor.CompName AS Competitor, Competitor.CompCountry AS Country, Game.GameName FROM Competitor INNER JOIN Result ON Competitor.CompID = Result.CompID INNER JOIN Plays ON Competitor.CompID = Plays.CompID INNER JOIN Game ON Plays.GameID = Game.GameID INNER JOIN Event ON Result.EventID = Event.EventID AND Game.GameID = Event.GameID WHERE (Result.WorldRecord = 'YES')"></asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="WorlRecordQuery">
            <Columns>
                <asp:BoundField DataField="Competitor" HeaderText="Competitor" SortExpression="Competitor" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
            </Columns>
        </asp:GridView>

    </div>
</asp:Content>

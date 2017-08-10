<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditEvents.aspx.cs" Inherits="EventManager.EditEvents" %>

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
    <h2>Manage Events</h2>
    <div>
        <asp:SqlDataSource ID="EventQuery" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" DeleteCommand="DELETE FROM [Event] WHERE [EventID] = @original_EventID AND [GameID] = @original_GameID AND (([FeatureEvent] = @original_FeatureEvent) OR ([FeatureEvent] IS NULL AND @original_FeatureEvent IS NULL)) AND [EventVenue] = @original_EventVenue AND (([EventDate] = @original_EventDate) OR ([EventDate] IS NULL AND @original_EventDate IS NULL)) AND (([EventStartTime] = @original_EventStartTime) OR ([EventStartTime] IS NULL AND @original_EventStartTime IS NULL)) AND (([EventEndTime] = @original_EventEndTime) OR ([EventEndTime] IS NULL AND @original_EventEndTime IS NULL)) AND [EventDescription] = @original_EventDescription AND [WorldRecord] = @original_WorldRecord" InsertCommand="INSERT INTO [Event] ([EventID], [GameID], [FeatureEvent], [EventVenue], [EventDate], [EventStartTime], [EventEndTime], [EventDescription], [WorldRecord]) VALUES (@EventID, @GameID, @FeatureEvent, @EventVenue, @EventDate, @EventStartTime, @EventEndTime, @EventDescription, @WorldRecord)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Event]" UpdateCommand="UPDATE [Event] SET [GameID] = @GameID, [FeatureEvent] = @FeatureEvent, [EventVenue] = @EventVenue, [EventDate] = @EventDate, [EventStartTime] = @EventStartTime, [EventEndTime] = @EventEndTime, [EventDescription] = @EventDescription, [WorldRecord] = @WorldRecord WHERE [EventID] = @original_EventID AND [GameID] = @original_GameID AND (([FeatureEvent] = @original_FeatureEvent) OR ([FeatureEvent] IS NULL AND @original_FeatureEvent IS NULL)) AND [EventVenue] = @original_EventVenue AND (([EventDate] = @original_EventDate) OR ([EventDate] IS NULL AND @original_EventDate IS NULL)) AND (([EventStartTime] = @original_EventStartTime) OR ([EventStartTime] IS NULL AND @original_EventStartTime IS NULL)) AND (([EventEndTime] = @original_EventEndTime) OR ([EventEndTime] IS NULL AND @original_EventEndTime IS NULL)) AND [EventDescription] = @original_EventDescription AND [WorldRecord] = @original_WorldRecord">
            <DeleteParameters>
                <asp:Parameter Name="original_EventID" Type="Int32" />
                <asp:Parameter Name="original_GameID" Type="Int32" />
                <asp:Parameter Name="original_FeatureEvent" Type="String" />
                <asp:Parameter Name="original_EventVenue" Type="String" />
                <asp:Parameter Name="original_EventDate" Type="String" />
                <asp:Parameter Name="original_EventStartTime" Type="String" />
                <asp:Parameter Name="original_EventEndTime" Type="String" />
                <asp:Parameter Name="original_EventDescription" Type="String" />
                <asp:Parameter Name="original_WorldRecord" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EventID" Type="Int32" />
                <asp:Parameter Name="GameID" Type="Int32" />
                <asp:Parameter Name="FeatureEvent" Type="String" />
                <asp:Parameter Name="EventVenue" Type="String" />
                <asp:Parameter Name="EventDate" Type="String" />
                <asp:Parameter Name="EventStartTime" Type="String" />
                <asp:Parameter Name="EventEndTime" Type="String" />
                <asp:Parameter Name="EventDescription" Type="String" />
                <asp:Parameter Name="WorldRecord" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="GameID" Type="Int32" />
                <asp:Parameter Name="FeatureEvent" Type="String" />
                <asp:Parameter Name="EventVenue" Type="String" />
                <asp:Parameter Name="EventDate" Type="String" />
                <asp:Parameter Name="EventStartTime" Type="String" />
                <asp:Parameter Name="EventEndTime" Type="String" />
                <asp:Parameter Name="EventDescription" Type="String" />
                <asp:Parameter Name="WorldRecord" Type="String" />
                <asp:Parameter Name="original_EventID" Type="Int32" />
                <asp:Parameter Name="original_GameID" Type="Int32" />
                <asp:Parameter Name="original_FeatureEvent" Type="String" />
                <asp:Parameter Name="original_EventVenue" Type="String" />
                <asp:Parameter Name="original_EventDate" Type="String" />
                <asp:Parameter Name="original_EventStartTime" Type="String" />
                <asp:Parameter Name="original_EventEndTime" Type="String" />
                <asp:Parameter Name="original_EventDescription" Type="String" />
                <asp:Parameter Name="original_WorldRecord" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EventID" DataSourceID="EventQuery">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="EventID" HeaderText="EventID" ReadOnly="True" SortExpression="EventID" />
                <asp:BoundField DataField="GameID" HeaderText="GameID" SortExpression="GameID" />
                <asp:BoundField DataField="FeatureEvent" HeaderText="FeatureEvent" SortExpression="FeatureEvent" />
                <asp:BoundField DataField="EventVenue" HeaderText="EventVenue" SortExpression="EventVenue" />
                <asp:BoundField DataField="EventDate" HeaderText="EventDate" SortExpression="EventDate" />
                <asp:BoundField DataField="EventStartTime" HeaderText="EventStartTime" SortExpression="EventStartTime" />
                <asp:BoundField DataField="EventEndTime" HeaderText="EventEndTime" SortExpression="EventEndTime" />
                <asp:BoundField DataField="EventDescription" HeaderText="EventDescription" SortExpression="EventDescription" />
                <asp:BoundField DataField="WorldRecord" HeaderText="WorldRecord" SortExpression="WorldRecord" />
            </Columns>
        </asp:GridView>
    </div>
    <h2>Manage Results</h2>
    <div>
        <asp:SqlDataSource ID="ResultsQuery" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" DeleteCommand="DELETE FROM [Result] WHERE [EventID] = @original_EventID AND [CompID] = @original_CompID AND [CompPosition] = @original_CompPosition AND [CompMedal] = @original_CompMedal AND (([WorldRecord] = @original_WorldRecord) OR ([WorldRecord] IS NULL AND @original_WorldRecord IS NULL))" InsertCommand="INSERT INTO [Result] ([EventID], [CompID], [CompPosition], [CompMedal], [WorldRecord]) VALUES (@EventID, @CompID, @CompPosition, @CompMedal, @WorldRecord)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Result]" UpdateCommand="UPDATE [Result] SET [CompPosition] = @CompPosition, [CompMedal] = @CompMedal, [WorldRecord] = @WorldRecord WHERE [EventID] = @original_EventID AND [CompID] = @original_CompID AND [CompPosition] = @original_CompPosition AND [CompMedal] = @original_CompMedal AND (([WorldRecord] = @original_WorldRecord) OR ([WorldRecord] IS NULL AND @original_WorldRecord IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_EventID" Type="Int32" />
                <asp:Parameter Name="original_CompID" Type="Int32" />
                <asp:Parameter Name="original_CompPosition" Type="Int32" />
                <asp:Parameter Name="original_CompMedal" Type="String" />
                <asp:Parameter Name="original_WorldRecord" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EventID" Type="Int32" />
                <asp:Parameter Name="CompID" Type="Int32" />
                <asp:Parameter Name="CompPosition" Type="Int32" />
                <asp:Parameter Name="CompMedal" Type="String" />
                <asp:Parameter Name="WorldRecord" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CompPosition" Type="Int32" />
                <asp:Parameter Name="CompMedal" Type="String" />
                <asp:Parameter Name="WorldRecord" Type="String" />
                <asp:Parameter Name="original_EventID" Type="Int32" />
                <asp:Parameter Name="original_CompID" Type="Int32" />
                <asp:Parameter Name="original_CompPosition" Type="Int32" />
                <asp:Parameter Name="original_CompMedal" Type="String" />
                <asp:Parameter Name="original_WorldRecord" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EventID,CompID" DataSourceID="ResultsQuery">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="EventID" HeaderText="EventID" ReadOnly="True" SortExpression="EventID" />
                <asp:BoundField DataField="CompID" HeaderText="CompID" ReadOnly="True" SortExpression="CompID" />
                <asp:BoundField DataField="CompPosition" HeaderText="CompPosition" SortExpression="CompPosition" />
                <asp:BoundField DataField="CompMedal" HeaderText="CompMedal" SortExpression="CompMedal" />
                <asp:BoundField DataField="WorldRecord" HeaderText="WorldRecord" SortExpression="WorldRecord" />
            </Columns>
        </asp:GridView>
    </div>
    <h2>&nbsp;Photos</h2>
    <div>
        <asp:SqlDataSource ID="PhotoQuery" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" DeleteCommand="DELETE FROM [Photo] WHERE [PhotoID] = @original_PhotoID AND [EventPhoto] = @original_EventPhoto AND (([EventPhotoTags] = @original_EventPhotoTags) OR ([EventPhotoTags] IS NULL AND @original_EventPhotoTags IS NULL)) AND [EventID] = @original_EventID" InsertCommand="INSERT INTO [Photo] ([EventPhoto], [EventPhotoTags], [EventID]) VALUES (@EventPhoto, @EventPhotoTags, @EventID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Photo]" UpdateCommand="UPDATE [Photo] SET [EventPhoto] = @EventPhoto, [EventPhotoTags] = @EventPhotoTags, [EventID] = @EventID WHERE [PhotoID] = @original_PhotoID AND [EventPhoto] = @original_EventPhoto AND (([EventPhotoTags] = @original_EventPhotoTags) OR ([EventPhotoTags] IS NULL AND @original_EventPhotoTags IS NULL)) AND [EventID] = @original_EventID">
            <DeleteParameters>
                <asp:Parameter Name="original_PhotoID" Type="Int32" />
                <asp:Parameter Name="original_EventPhoto" Type="String" />
                <asp:Parameter Name="original_EventPhotoTags" Type="String" />
                <asp:Parameter Name="original_EventID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EventPhoto" Type="String" />
                <asp:Parameter Name="EventPhotoTags" Type="String" />
                <asp:Parameter Name="EventID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EventPhoto" Type="String" />
                <asp:Parameter Name="EventPhotoTags" Type="String" />
                <asp:Parameter Name="EventID" Type="Int32" />
                <asp:Parameter Name="original_PhotoID" Type="Int32" />
                <asp:Parameter Name="original_EventPhoto" Type="String" />
                <asp:Parameter Name="original_EventPhotoTags" Type="String" />
                <asp:Parameter Name="original_EventID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PhotoID" DataSourceID="PhotoQuery">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="PhotoID" HeaderText="PhotoID" InsertVisible="False" ReadOnly="True" SortExpression="PhotoID" />
                <asp:BoundField DataField="EventPhotoTags" HeaderText="EventPhotoTags" SortExpression="EventPhotoTags" />
                <asp:BoundField DataField="EventID" HeaderText="EventID" SortExpression="EventID" />
                <asp:ImageField DataImageUrlField="EventPhoto" ControlStyle-Width="150"
                    ControlStyle-Height="125" HeaderText="Preview Image" ReadOnly="True">
                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                </asp:ImageField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

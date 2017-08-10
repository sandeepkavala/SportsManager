<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="EventManager.Search" %>

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
    <h2>Search Events</h2>
    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">

                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="PhotoTags" CssClass="col-md-2 control-label">Photo Tags</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="PhotoTags" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="EnterData" Text="Search" CssClass="btn btn-default" />
                        </div>
                    </div>
                    <div>

                        <asp:SqlDataSource ID="PhotoQuery" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT [EventPhotoTags], [EventID], [EventPhoto] FROM [Photo] WHERE ([EventPhotoTags] LIKE '%' + @EventPhotoTags + '%')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="PhotoTags" DefaultValue="0" Name="EventPhotoTags" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="PhotoQuery" HorizontalAlign="Center">
                            <Columns>
                                <asp:BoundField DataField="EventID" HeaderText="EventID" SortExpression="EventID" />
                                <asp:ImageField DataImageUrlField="EventPhoto" ControlStyle-Width="150"
                                    ControlStyle-Height="125" HeaderText="Event Image" ReadOnly="True">
                                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                                </asp:ImageField>
                            </Columns>
                        </asp:GridView>

                    </div>
                    <hr />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="EventTags" CssClass="col-md-2 control-label">Event</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="EventTags" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="EnterData" Text="Search" CssClass="btn btn-default" />
                        </div>
                    </div>
                    <hr />
                    <div>

                        <asp:SqlDataSource ID="EventSearch" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT * FROM [Event] WHERE ([EventDescription] LIKE '%' + @EventDescription + '%')">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="EventTags" DefaultValue="0" Name="EventDescription" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EventID" DataSourceID="EventSearch">
                            <Columns>
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

                        <br />
                        <asp:Button ID="ExportPDF" runat="server" OnClick="ExportPDF_Click" Text="Export DOC" />

                    </div>
                </div>
            </section>
        </div>
    </div>
</asp:Content>

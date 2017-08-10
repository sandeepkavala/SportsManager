<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditGames.aspx.cs" Inherits="EventManager.EditGames" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Navigation" runat="server">
    <ul class="nav navbar-nav">
        <li><a runat="server" href="~/AdminHome">Home</a></li>
        <li><a runat="server" href="~/GameManager">Games</a></li>
        <li><a runat="server" href="~/PlayerManager">Competitors</a></li>
        <li><a runat="server" href="~/Plays">Game Plays</a></li>
        <li><a runat="server" href="~/EditGames">Manage</a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Manage Games</h2>
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT * FROM [Game]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Game] WHERE [GameID] = @original_GameID AND [GameCode] = @original_GameCode AND [GameName] = @original_GameName AND [GameDuration] = @original_GameDuration AND (([GameDescription] = @original_GameDescription) OR ([GameDescription] IS NULL AND @original_GameDescription IS NULL)) AND [GameRules] = @original_GameRules" InsertCommand="INSERT INTO [Game] ([GameCode], [GameName], [GameDuration], [GameDescription], [GameRules]) VALUES (@GameCode, @GameName, @GameDuration, @GameDescription, @GameRules)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Game] SET [GameCode] = @GameCode, [GameName] = @GameName, [GameDuration] = @GameDuration, [GameDescription] = @GameDescription, [GameRules] = @GameRules WHERE [GameID] = @original_GameID AND [GameCode] = @original_GameCode AND [GameName] = @original_GameName AND [GameDuration] = @original_GameDuration AND (([GameDescription] = @original_GameDescription) OR ([GameDescription] IS NULL AND @original_GameDescription IS NULL)) AND [GameRules] = @original_GameRules">
            <DeleteParameters>
                <asp:Parameter Name="original_GameID" Type="Int32" />
                <asp:Parameter Name="original_GameCode" Type="String" />
                <asp:Parameter Name="original_GameName" Type="String" />
                <asp:Parameter Name="original_GameDuration" Type="Double" />
                <asp:Parameter Name="original_GameDescription" Type="String" />
                <asp:Parameter Name="original_GameRules" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="GameCode" Type="String" />
                <asp:Parameter Name="GameName" Type="String" />
                <asp:Parameter Name="GameDuration" Type="Double" />
                <asp:Parameter Name="GameDescription" Type="String" />
                <asp:Parameter Name="GameRules" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="GameCode" Type="String" />
                <asp:Parameter Name="GameName" Type="String" />
                <asp:Parameter Name="GameDuration" Type="Double" />
                <asp:Parameter Name="GameDescription" Type="String" />
                <asp:Parameter Name="GameRules" Type="String" />
                <asp:Parameter Name="original_GameID" Type="Int32" />
                <asp:Parameter Name="original_GameCode" Type="String" />
                <asp:Parameter Name="original_GameName" Type="String" />
                <asp:Parameter Name="original_GameDuration" Type="Double" />
                <asp:Parameter Name="original_GameDescription" Type="String" />
                <asp:Parameter Name="original_GameRules" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <h2>Manage Competitors</h2>
    <div>


        <br />


        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="GameID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="GameID" HeaderText="GameID" InsertVisible="False" ReadOnly="True" SortExpression="GameID" />
                <asp:BoundField DataField="GameCode" HeaderText="GameCode" SortExpression="GameCode" />
                <asp:BoundField DataField="GameName" HeaderText="GameName" SortExpression="GameName" />
                <asp:BoundField DataField="GameDuration" HeaderText="GameDuration" SortExpression="GameDuration" />
                <asp:BoundField DataField="GameDescription" HeaderText="GameDescription" SortExpression="GameDescription" />
            </Columns>
        </asp:GridView>


        <br />
        <br />
        <asp:SqlDataSource ID="EditPlayers" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" DeleteCommand="DELETE FROM [Competitor] WHERE [CompID] = @original_CompID AND (([CompSalutation] = @original_CompSalutation) OR ([CompSalutation] IS NULL AND @original_CompSalutation IS NULL)) AND [CompName] = @original_CompName AND (([CompDOB] = @original_CompDOB) OR ([CompDOB] IS NULL AND @original_CompDOB IS NULL)) AND [CompEmail] = @original_CompEmail AND [CompCountry] = @original_CompCountry AND [CompGender] = @original_CompGender AND (([CompContact] = @original_CompContact) OR ([CompContact] IS NULL AND @original_CompContact IS NULL)) AND (([CompWebsite] = @original_CompWebsite) OR ([CompWebsite] IS NULL AND @original_CompWebsite IS NULL)) AND (([CompPhoto] = @original_CompPhoto) OR ([CompPhoto] IS NULL AND @original_CompPhoto IS NULL))" InsertCommand="INSERT INTO [Competitor] ([CompID], [CompSalutation], [CompName], [CompDOB], [CompEmail], [CompCountry], [CompGender], [CompContact], [CompWebsite], [CompPhoto]) VALUES (@CompID, @CompSalutation, @CompName, @CompDOB, @CompEmail, @CompCountry, @CompGender, @CompContact, @CompWebsite, @CompPhoto)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Competitor]" UpdateCommand="UPDATE [Competitor] SET [CompSalutation] = @CompSalutation, [CompName] = @CompName, [CompDOB] = @CompDOB, [CompEmail] = @CompEmail, [CompCountry] = @CompCountry, [CompGender] = @CompGender, [CompContact] = @CompContact, [CompWebsite] = @CompWebsite, [CompPhoto] = @CompPhoto WHERE [CompID] = @original_CompID AND (([CompSalutation] = @original_CompSalutation) OR ([CompSalutation] IS NULL AND @original_CompSalutation IS NULL)) AND [CompName] = @original_CompName AND (([CompDOB] = @original_CompDOB) OR ([CompDOB] IS NULL AND @original_CompDOB IS NULL)) AND [CompEmail] = @original_CompEmail AND [CompCountry] = @original_CompCountry AND [CompGender] = @original_CompGender AND (([CompContact] = @original_CompContact) OR ([CompContact] IS NULL AND @original_CompContact IS NULL)) AND (([CompWebsite] = @original_CompWebsite) OR ([CompWebsite] IS NULL AND @original_CompWebsite IS NULL)) AND (([CompPhoto] = @original_CompPhoto) OR ([CompPhoto] IS NULL AND @original_CompPhoto IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_CompID" Type="Int32" />
                <asp:Parameter Name="original_CompSalutation" Type="String" />
                <asp:Parameter Name="original_CompName" Type="String" />
                <asp:Parameter DbType="Date" Name="original_CompDOB" />
                <asp:Parameter Name="original_CompEmail" Type="String" />
                <asp:Parameter Name="original_CompCountry" Type="String" />
                <asp:Parameter Name="original_CompGender" Type="String" />
                <asp:Parameter Name="original_CompContact" Type="String" />
                <asp:Parameter Name="original_CompWebsite" Type="String" />
                <asp:Parameter Name="original_CompPhoto" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CompID" Type="Int32" />
                <asp:Parameter Name="CompSalutation" Type="String" />
                <asp:Parameter Name="CompName" Type="String" />
                <asp:Parameter DbType="Date" Name="CompDOB" />
                <asp:Parameter Name="CompEmail" Type="String" />
                <asp:Parameter Name="CompCountry" Type="String" />
                <asp:Parameter Name="CompGender" Type="String" />
                <asp:Parameter Name="CompContact" Type="String" />
                <asp:Parameter Name="CompWebsite" Type="String" />
                <asp:Parameter Name="CompPhoto" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CompSalutation" Type="String" />
                <asp:Parameter Name="CompName" Type="String" />
                <asp:Parameter DbType="Date" Name="CompDOB" />
                <asp:Parameter Name="CompEmail" Type="String" />
                <asp:Parameter Name="CompCountry" Type="String" />
                <asp:Parameter Name="CompGender" Type="String" />
                <asp:Parameter Name="CompContact" Type="String" />
                <asp:Parameter Name="CompWebsite" Type="String" />
                <asp:Parameter Name="CompPhoto" Type="String" />
                <asp:Parameter Name="original_CompID" Type="Int32" />
                <asp:Parameter Name="original_CompSalutation" Type="String" />
                <asp:Parameter Name="original_CompName" Type="String" />
                <asp:Parameter DbType="Date" Name="original_CompDOB" />
                <asp:Parameter Name="original_CompEmail" Type="String" />
                <asp:Parameter Name="original_CompCountry" Type="String" />
                <asp:Parameter Name="original_CompGender" Type="String" />
                <asp:Parameter Name="original_CompContact" Type="String" />
                <asp:Parameter Name="original_CompWebsite" Type="String" />
                <asp:Parameter Name="original_CompPhoto" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="CompID" DataSourceID="EditPlayers" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="CompID" HeaderText="CompID" ReadOnly="True" SortExpression="CompID" />
                <asp:BoundField DataField="CompSalutation" HeaderText="CompSalutation" SortExpression="CompSalutation" />
                <asp:BoundField DataField="CompName" HeaderText="CompName" SortExpression="CompName" />
                <asp:BoundField DataField="CompDOB" HeaderText="CompDOB" SortExpression="CompDOB" />
                <asp:BoundField DataField="CompEmail" HeaderText="CompEmail" SortExpression="CompEmail" />
                <asp:BoundField DataField="CompCountry" HeaderText="CompCountry" SortExpression="CompCountry" />
                <asp:BoundField DataField="CompDescription" HeaderText="CompDescription" SortExpression="CompDescription" />
                <asp:BoundField DataField="CompGender" HeaderText="CompGender" SortExpression="CompGender" />
                <asp:BoundField DataField="CompContact" HeaderText="CompContact" SortExpression="CompContact" />
                <asp:BoundField DataField="CompWebsite" HeaderText="CompWebsite" SortExpression="CompWebsite" />
                <asp:ImageField DataImageUrlField="CompPhoto" ControlStyle-Width="150"
                    ControlStyle-Height="125" HeaderText="Preview Image" ReadOnly="True">
                    <ControlStyle Height="100px" Width="100px"></ControlStyle>
                </asp:ImageField>
            </Columns>
        </asp:GridView>
        <br />


    </div>
    <h2>Manage Plays</h2>
    <div>

        <asp:SqlDataSource ID="PlaysQuery" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" DeleteCommand="DELETE FROM [Plays] WHERE [GameID] = @original_GameID AND [CompID] = @original_CompID" InsertCommand="INSERT INTO [Plays] ([GameID], [CompID]) VALUES (@GameID, @CompID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Plays]">
            <DeleteParameters>
                <asp:Parameter Name="original_GameID" Type="Int32" />
                <asp:Parameter Name="original_CompID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="GameID" Type="Int32" />
                <asp:Parameter Name="CompID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="GameID,CompID" DataSourceID="PlaysQuery">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:TemplateField HeaderText="Game" SortExpression="GameID">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("GameID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="GID" runat="server" Text='<%# Bind("GameID") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="GameName" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT [GameID], [GameName] FROM [Game] WHERE ([GameID] = @GameID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GID" Name="GameID" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Repeater ID="ShowGameName" runat="server" DataSourceID="GameName">
                            <ItemTemplate>
                                <%#DataBinder.Eval(Container.DataItem,"GameName") %>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Competitor" SortExpression="CompID">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("CompID") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CID" runat="server" Text='<%# Bind("CompID") %>' Visible="False"></asp:Label>
                        <asp:SqlDataSource ID="CompName" runat="server" ConnectionString="<%$ ConnectionStrings:EventsConnectionString %>" SelectCommand="SELECT * FROM [Competitor] WHERE ([CompID] = @CompID)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="CID" Name="CompID" PropertyName="Text" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Repeater ID="ShowCompName" runat="server" DataSourceID="CompName">
                            <ItemTemplate>
                                  <%#DataBinder.Eval(Container.DataItem,"CompName") %>
                            </ItemTemplate>
                          
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>

</asp:Content>

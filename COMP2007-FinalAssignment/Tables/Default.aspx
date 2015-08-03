<%@ Page Title="TableList" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Default.aspx.cs" Inherits="COMP2007_FinalAssignment.Tables.Default" %>
<%@ Register TagPrefix="FriendlyUrls" Namespace="Microsoft.AspNet.FriendlyUrls" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <h2>Tables List</h2>
    <p>
        <asp:HyperLink runat="server" NavigateUrl="Insert" Text="Create new" />
    </p>
    <div>
        <asp:ListView id="ListView1" runat="server"
            DataKeyNames="projectID" 
			ItemType="COMP2007_FinalAssignment.Models.Table"
            SelectMethod="GetData">
            <EmptyDataTemplate>
                There are no entries found for Tables
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr>
                            <th>
								<asp:LinkButton Text="projectID" CommandName="Sort" CommandArgument="projectID" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="projectName" CommandName="Sort" CommandArgument="projectName" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="date" CommandName="Sort" CommandArgument="date" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="HoursWorked" CommandName="Sort" CommandArgument="HoursWorked" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="typeOfWork" CommandName="Sort" CommandArgument="typeOfWork" runat="Server" />
							</th>
                            <th>
								<asp:LinkButton Text="description" CommandName="Sort" CommandArgument="description" runat="Server" />
							</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr runat="server" id="itemPlaceholder" />
                    </tbody>
                </table>
				<asp:DataPager PageSize="5"  runat="server">
					<Fields>
                        <asp:NextPreviousPagerField ShowLastPageButton="False" ShowNextPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                        <asp:NumericPagerField ButtonType="Button"  NumericButtonCssClass="btn" CurrentPageLabelCssClass="btn disabled" NextPreviousButtonCssClass="btn" />
                        <asp:NextPreviousPagerField ShowFirstPageButton="False" ShowPreviousPageButton="False" ButtonType="Button" ButtonCssClass="btn" />
                    </Fields>
				</asp:DataPager>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
							<td>
								<asp:DynamicControl runat="server" DataField="projectID" ID="projectID" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="projectName" ID="projectName" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="date" ID="date" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="HoursWorked" ID="HoursWorked" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="typeOfWork" ID="typeOfWork" Mode="ReadOnly" />
							</td>
							<td>
								<asp:DynamicControl runat="server" DataField="description" ID="description" Mode="ReadOnly" />
							</td>
                    <td>
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Tables/Details", Item.projectID) %>' Text="Details" /> | 
					    <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Tables/Edit", Item.projectID) %>' Text="Edit" /> | 
                        <asp:HyperLink runat="server" NavigateUrl='<%# FriendlyUrl.Href("~/Tables/Delete", Item.projectID) %>' Text="Delete" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>
</asp:Content>


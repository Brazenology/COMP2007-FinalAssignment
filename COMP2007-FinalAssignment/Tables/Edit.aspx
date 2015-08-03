<%@ Page Title="TableEdit" Language="C#" MasterPageFile="~/Default.Master" CodeBehind="Edit.aspx.cs" Inherits="COMP2007_FinalAssignment.Tables.Edit" %>
<asp:Content runat="server" ContentPlaceHolderID="MainContent">
    <div>
		<p>&nbsp;</p>
        <asp:FormView runat="server"
            ItemType="COMP2007_FinalAssignment.Models.Table" DefaultMode="Edit" DataKeyNames="projectID"
            UpdateMethod="UpdateItem" SelectMethod="GetItem"
            OnItemCommand="ItemCommand" RenderOuterTable="false">
            <EmptyDataTemplate>
                Cannot find the Table with projectID <%: Request.QueryString["projectID"] %>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <fieldset class="form-horizontal">
                    <legend>Edit Table</legend>
					<asp:ValidationSummary runat="server" CssClass="alert alert-danger"  />                 
						    <asp:DynamicControl Mode="Edit" DataField="projectID" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="projectName" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="date" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="HoursWorked" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="typeOfWork" runat="server" />
						    <asp:DynamicControl Mode="Edit" DataField="description" runat="server" />
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
							<asp:Button runat="server" ID="UpdateButton" CommandName="Update" Text="Update" CssClass="btn btn-primary" />
							<asp:Button runat="server" ID="CancelButton" CommandName="Cancel" Text="Cancel" CausesValidation="false" CssClass="btn btn-default" />
						</div>
					</div>
                </fieldset>
            </EditItemTemplate>
        </asp:FormView>
    </div>
</asp:Content>


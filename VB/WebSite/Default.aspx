<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Xpo.v9.3, Version=9.3.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.3, Version=9.3.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.3, Version=9.3.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>E2103 - How to display and edit persistent objects with a many-to-many association in the ASPxGridView</title>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<table>
				<tr>
					<td valign="top">
						<dx:ASPxGridView ID="gridUsers" runat="server" KeyFieldName="Oid" AutoGenerateColumns="False"
							DataSourceID="xpUsers">
							<Columns>
								<dx:GridViewDataTextColumn FieldName="Oid" ReadOnly="True" VisibleIndex="0">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="FullName" VisibleIndex="1">
								</dx:GridViewDataTextColumn>
							</Columns>
							<SettingsBehavior AllowFocusedRow="True" />
							<ClientSideEvents FocusedRowChanged="function(s, e) {
	gridUserRoles.PerformCallback();
}" />
						</dx:ASPxGridView>
						<dx:XpoDataSource ID="xpUsers" runat="server" TypeName="User">
						</dx:XpoDataSource>
					</td>
					<td align="center">
						<dx:ASPxButton ID="btnLink" runat="server" Text="Link" OnClick="btnLink_Click">
						</dx:ASPxButton>
						<dx:ASPxButton ID="btnUnlink" runat="server" Text="Unlink" OnClick="btnUnlink_Click">
						</dx:ASPxButton>
					</td>
					<td valign="top">
						<dx:ASPxGridView ID="gridRoles" runat="server" AutoGenerateColumns="False" DataSourceID="xpRoles"
							KeyFieldName="Oid">
							<SettingsBehavior AllowFocusedRow="True" />
							<Columns>
								<dx:GridViewDataTextColumn FieldName="Oid" ReadOnly="True" VisibleIndex="0">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
								</dx:GridViewDataTextColumn>
							</Columns>
							<ClientSideEvents FocusedRowChanged="function(s, e) {
	gridRoleUsers.PerformCallback();
}" />
						</dx:ASPxGridView>
						<dx:XpoDataSource ID="xpRoles" runat="server" TypeName="Role">
						</dx:XpoDataSource>
					</td>
				</tr>
				<tr>
					<td valign="top">
						<dx:ASPxLabel ID="lblUser" runat="server" Text="Roles for user: ">
						</dx:ASPxLabel>
						<dx:ASPxGridView ID="gridUserRoles" ClientInstanceName="gridUserRoles" runat="server"
							AutoGenerateColumns="False" DataSourceID="xpUserRoles" KeyFieldName="Oid" OnBeforePerformDataSelect="gridUserRoles_BeforePerformDataSelect"
							OnCustomCallback="grids_CustomCallback">
							<SettingsBehavior AllowFocusedRow="True" />
							<Columns>
								<dx:GridViewDataTextColumn FieldName="Oid" ReadOnly="True" VisibleIndex="0">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
								</dx:GridViewDataTextColumn>
							</Columns>
						</dx:ASPxGridView>
						<dx:XpoDataSource ID="xpUserRoles" runat="server" TypeName="Role">
						</dx:XpoDataSource>
					</td>
					<td>
					</td>
					<td valign="top">
						<dx:ASPxLabel ID="lblRole" runat="server" Text="Users in role: ">
						</dx:ASPxLabel>
						<dx:ASPxGridView ID="gridRoleUsers" ClientInstanceName="gridRoleUsers" runat="server"
							AutoGenerateColumns="False" DataSourceID="xpRoleUsers" KeyFieldName="Oid" OnBeforePerformDataSelect="gridRoleUsers_BeforePerformDataSelect"
							OnCustomCallback="grids_CustomCallback">
							<SettingsBehavior AllowFocusedRow="True" />
							<Columns>
								<dx:GridViewDataTextColumn FieldName="Oid" ReadOnly="True" VisibleIndex="0">
								</dx:GridViewDataTextColumn>
								<dx:GridViewDataTextColumn FieldName="FullName" VisibleIndex="1">
								</dx:GridViewDataTextColumn>
							</Columns>
						</dx:ASPxGridView>
						<dx:XpoDataSource ID="xpRoleUsers" runat="server" TypeName="User">
						</dx:XpoDataSource>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>

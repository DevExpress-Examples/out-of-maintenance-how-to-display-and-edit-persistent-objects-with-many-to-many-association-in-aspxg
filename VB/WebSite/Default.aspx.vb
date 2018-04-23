Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Xpo
Imports DevExpress.Data.Filtering
Imports DevExpress.Web.ASPxGridView

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private session As New Session()
	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		xpRoles.Session = session
		xpUsers.Session = session
		xpUserRoles.Session = session
		xpRoleUsers.Session = session
	End Sub
	Protected Sub gridUserRoles_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
		Dim user As User = CType(gridUsers.GetRow(gridUsers.FocusedRowIndex), User)
		xpUserRoles.Criteria = CriteriaOperator.Parse("Users[Oid = ?]", user.Oid).ToString()
	End Sub

	Protected Sub gridRoleUsers_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs)
		Dim role As Role = CType(gridRoles.GetRow(gridRoles.FocusedRowIndex), Role)
		xpRoleUsers.Criteria = CriteriaOperator.Parse("Roles[Oid = ?]", role.Oid).ToString()
	End Sub
	Protected Sub btnLink_Click(ByVal sender As Object, ByVal e As EventArgs)
		Dim user As User = CType(gridUsers.GetRow(gridUsers.FocusedRowIndex), User)
		Dim role As Role = CType(gridRoles.GetRow(gridRoles.FocusedRowIndex), Role)
		If user IsNot Nothing AndAlso role IsNot Nothing Then
			user.Roles.Add(role) ' It's enough to add a link on one side only
			user.Save()

			gridRoleUsers.DataBind()
			gridUserRoles.DataBind()
		End If
	End Sub
	Protected Sub btnUnlink_Click(ByVal sender As Object, ByVal e As EventArgs)
		Dim user As User = CType(gridUsers.GetRow(gridUsers.FocusedRowIndex), User)
		Dim role As Role = CType(gridRoles.GetRow(gridRoles.FocusedRowIndex), Role)
		If user IsNot Nothing AndAlso role IsNot Nothing Then
			user.Roles.Remove(role) ' It's enough to remove a link from one side only
			user.Save()

			gridRoleUsers.DataBind()
			gridUserRoles.DataBind()
		End If
	End Sub

	Protected Sub grids_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs)
		Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
		grid.DataBind()
	End Sub
End Class

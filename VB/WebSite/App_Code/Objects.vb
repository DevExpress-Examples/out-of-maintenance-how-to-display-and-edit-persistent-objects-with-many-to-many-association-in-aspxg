Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Xpo

Public Class User
	Inherits XPObject
	Public Sub New(ByVal session As Session)
		MyBase.New(session)
	End Sub

	Private _FullName As String
	<DisplayName("Full Name")> _
	Public Property FullName() As String
		Get
			Return _FullName
		End Get
		Set(ByVal value As String)
			SetPropertyValue("FullName", _FullName, value)
		End Set
	End Property

	<Association("Users-Roles")> _
	Public ReadOnly Property Roles() As XPCollection(Of Role)
		Get
			Dim result As XPCollection(Of Role) = GetCollection(Of Role)("Roles")
			result.DisplayableProperties = "Name"
			Return result
		End Get
	End Property
End Class

Public Class Role
	Inherits XPObject
	Public Sub New(ByVal session As Session)
		MyBase.New(session)
	End Sub

	Private _Name As String
	Public Property Name() As String
		Get
			Return _Name
		End Get
		Set(ByVal value As String)
			SetPropertyValue("Name", _Name, value)
		End Set
	End Property

	<Association("Users-Roles")> _
	Public ReadOnly Property Users() As XPCollection(Of User)
		Get
			Dim result As XPCollection(Of User) = GetCollection(Of User)("Users")
			result.DisplayableProperties = "FullName"
			Return result
		End Get
	End Property
End Class


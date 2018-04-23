<%@ Application Language="vb" %>

<script runat="server">

	Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
		Dim ds As New DevExpress.Xpo.DB.InMemoryDataStore()
		Dim dict As DevExpress.Xpo.Metadata.XPDictionary = New DevExpress.Xpo.Metadata.ReflectionDictionary()
		dict.GetDataStoreSchema(GetType(Role).Assembly)
		DevExpress.Xpo.XpoDefault.DataLayer = New DevExpress.Xpo.ThreadSafeDataLayer(dict, ds)
		DevExpress.Xpo.XpoDefault.Session = Nothing

		CreateDefaultObjects()
	End Sub

	Private Shared Sub CreateDefaultObjects()
		Using uow As New DevExpress.Xpo.UnitOfWork()
			If uow.FindObject(Of User)(Nothing) IsNot Nothing Then
				Return
			End If

			Dim adminRole As New Role(uow)
			adminRole.Name = "Administrator"

			Dim userRole As New Role(uow)
			userRole.Name = "User"

			Dim u1 As New User(uow)
			u1.FullName = "Mario Esprito"
			u1.Roles.Add(adminRole)

			Dim u2 As New User(uow)
			u2.FullName = "Carter Jones"
			u2.Roles.Add(adminRole)

			Dim u3 As New User(uow)
			u3.FullName = "Bart Richdale"
			u3.Roles.Add(userRole)

			Dim u4 As New User(uow)
			u4.FullName = "Cindy Harwell"
			u4.Roles.Add(userRole)

			uow.CommitChanges()
		End Using
	End Sub

	Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
		'  Code that runs on application shutdown

	End Sub

	Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
		' Code that runs when an unhandled error occurs

	End Sub

	Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
		' Code that runs when a new session is started

	End Sub

	Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
		' Code that runs when a session ends. 
		' Note: The Session_End event is raised only when the sessionstate mode
		' is set to InProc in the Web.config file. If session mode is set to StateServer 
		' or SQLServer, the event is not raised.

	End Sub

</script>

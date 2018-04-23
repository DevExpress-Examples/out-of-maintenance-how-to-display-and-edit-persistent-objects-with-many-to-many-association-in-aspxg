<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        DevExpress.Xpo.DB.InMemoryDataStore ds = new DevExpress.Xpo.DB.InMemoryDataStore();
        DevExpress.Xpo.Metadata.XPDictionary dict = new DevExpress.Xpo.Metadata.ReflectionDictionary();
        dict.GetDataStoreSchema(typeof(Role).Assembly);
        DevExpress.Xpo.XpoDefault.DataLayer = new DevExpress.Xpo.ThreadSafeDataLayer(dict, ds);
        DevExpress.Xpo.XpoDefault.Session = null;

        CreateDefaultObjects();
    }

    private static void CreateDefaultObjects()
    {
        using (DevExpress.Xpo.UnitOfWork uow = new DevExpress.Xpo.UnitOfWork())
        {
            if (uow.FindObject<User>(null) != null) return;

            Role adminRole = new Role(uow);
            adminRole.Name = "Administrator";

            Role userRole = new Role(uow);
            userRole.Name = "User";

            User u1 = new User(uow);
            u1.FullName = "Mario Esprito";
            u1.Roles.Add(adminRole);

            User u2 = new User(uow);
            u2.FullName = "Carter Jones";
            u2.Roles.Add(adminRole);

            User u3 = new User(uow);
            u3.FullName = "Bart Richdale";
            u3.Roles.Add(userRole);

            User u4 = new User(uow);
            u4.FullName = "Cindy Harwell";
            u4.Roles.Add(userRole);

            uow.CommitChanges();
        }
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>

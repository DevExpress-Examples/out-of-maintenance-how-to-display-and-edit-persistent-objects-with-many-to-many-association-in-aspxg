using System;
using DevExpress.Xpo;

public class User : XPObject
{
    public User(Session session) : base(session) { }

    private string _FullName;
    [DisplayName("Full Name")]
    public string FullName
    {
        get
        {
            return _FullName;
        }
        set
        {
            SetPropertyValue("FullName", ref _FullName, value);
        }
    }

    [Association("Users-Roles")]
    public XPCollection<Role> Roles
    {
        get
        {
            XPCollection<Role> result = GetCollection<Role>("Roles");
            result.DisplayableProperties = "Name";
            return result;
        }
    }
}

public class Role : XPObject
{
    public Role(Session session) : base(session) { }

    private string _Name;
    public string Name
    {
        get
        {
            return _Name;
        }
        set
        {
            SetPropertyValue("Name", ref _Name, value);
        }
    }

    [Association("Users-Roles")]
    public XPCollection<User> Users
    {
        get
        {
            XPCollection<User> result = GetCollection<User>("Users");
            result.DisplayableProperties = "FullName";
            return result;
        }
    }
}


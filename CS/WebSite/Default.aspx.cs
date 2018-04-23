using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Xpo;
using DevExpress.Data.Filtering;
using DevExpress.Web.ASPxGridView;

public partial class _Default : System.Web.UI.Page
{
    Session session = new Session();
    protected void Page_Init(object sender, EventArgs e)
    {
        xpRoles.Session = session;
        xpUsers.Session = session;
        xpUserRoles.Session = session;
        xpRoleUsers.Session = session;
    }
    protected void gridUserRoles_BeforePerformDataSelect(object sender, EventArgs e)
    {
        User user = (User)gridUsers.GetRow(gridUsers.FocusedRowIndex);
        xpUserRoles.Criteria = CriteriaOperator.Parse("Users[Oid = ?]", user.Oid).ToString();
    }

    protected void gridRoleUsers_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Role role = (Role)gridRoles.GetRow(gridRoles.FocusedRowIndex);
        xpRoleUsers.Criteria = CriteriaOperator.Parse("Roles[Oid = ?]", role.Oid).ToString();
    }
    protected void btnLink_Click(object sender, EventArgs e)
    {
        User user = (User)gridUsers.GetRow(gridUsers.FocusedRowIndex);
        Role role = (Role)gridRoles.GetRow(gridRoles.FocusedRowIndex);
        if (user != null && role != null)
        {
            user.Roles.Add(role); // It's enough to add a link on one side only
            user.Save();

            gridRoleUsers.DataBind();
            gridUserRoles.DataBind();
        }
    }
    protected void btnUnlink_Click(object sender, EventArgs e)
    {
        User user = (User)gridUsers.GetRow(gridUsers.FocusedRowIndex);
        Role role = (Role)gridRoles.GetRow(gridRoles.FocusedRowIndex);
        if (user != null && role != null)
        {
            user.Roles.Remove(role); // It's enough to remove a link from one side only
            user.Save();

            gridRoleUsers.DataBind();
            gridUserRoles.DataBind();
        }
    }

    protected void grids_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
    {
        ASPxGridView grid = sender as ASPxGridView;
        grid.DataBind();
    }
}

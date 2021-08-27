<!-- default badges list -->
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E2103)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Objects.cs](./CS/WebSite/App_Code/Objects.cs) (VB: [Objects.vb](./VB/WebSite/App_Code/Objects.vb))
* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
* [Global.asax](./CS/WebSite/Global.asax) (VB: [Global.asax](./VB/WebSite/Global.asax))
<!-- default file list end -->
# How to display and edit persistent objects with many-to-many association in ASPxGridView
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e2103)**
<!-- run online end -->


<p>This example was created for the ASPxGridView control based on the Knowledge Base article for the XtraGrid: <a href="https://www.devexpress.com/Support/Center/p/A920">How to display and edit persistent objects with a many-to-many association in the XtraGrid</a>.</p>


<h3>Description</h3>

<p>The only difference between WinForm and ASP.NET implementation is that all controls (whose datasources were changed) should be rebound with the DataBind method, and that updated objects should be saved to the Session via the <a href="http://documentation.devexpress.com/#XPO/DevExpressXpoSession_Savetopic">Session.Save</a> method.</p>

<br/>



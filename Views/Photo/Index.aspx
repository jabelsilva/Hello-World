<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Cosmetology.Web.Models.Photo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Fotografias
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h2>Fotografias</h2>
<% Html.RenderPartial("Upload"); %>
<hr />
<% if (Model.ToList().Count > 0)
   { %>
<% Html.RenderPartial("List", Model); %>

<%--<% Html.RenderPartial("SlideShow", Model); %>--%>
<% } %>

</asp:Content>

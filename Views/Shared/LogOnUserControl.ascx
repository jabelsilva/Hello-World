<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        <strong><%: Html.ActionLink(Page.User.Identity.Name, "Index", "Profile")%></strong>
        [ <%: Html.ActionLink("Saír", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%: Html.ActionLink("Entrar", "LogOn", "Account") %> ]
<%
    }
%>

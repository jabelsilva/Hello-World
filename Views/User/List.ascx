<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Cosmetology.Web.Models.ViewUser>>" %>
<table>
    <thead>
        <th>
        </th>
        <th>
            Login
        </th>
        <th>
            Nome
        </th>
        <th>
            Web Site
        </th>
    </thead>
    <tbody>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.ActionLink(item.UserProfile.Value.ToString(), "Details",  new { id = item.UserProfile }, null)%>
            </td>
            <td>
                <%: item.UserName  %>
            </td>
            <td>
                <%: item.Name  %>
            </td>
            <td>
                <%: item.WebSite  %>
            </td>
        </tr>
        <% } %>
    </tbody>
</table>

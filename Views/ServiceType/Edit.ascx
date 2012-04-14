<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Cosmetology.Web.Models.ServiceType>" %>
<tr>
    <td>
        <% if (Model.Id == 0)
           { %>
        <a class="action-create">Novo</a>
        <% }
           else
           { %>
        <a class="action-update">Actulizar</a> <a class="action-cancel">Cancelar</a>
        <% } %>
    </td>
    <td>
        <%: Html.Label(Model.Id.ToString())%>
        <%: Html.HiddenFor(o => o.Id)%>
    </td>
    <td>
        <%: Html.TextBoxFor(o => o.Name)%>
    </td>
</tr>

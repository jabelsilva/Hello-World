<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Cosmetology.Web.Models.ServiceType>" %>
<tr>
    <td>
        <a class="action-edit">Editar</a>
        <a class="action-delete">Apagar</a>       
    </td>
    <td>
        <%: Html.Label(Model.Id.ToString())%>        
        <input type="hidden" id="Id" value="<%: Model.Id.ToString() %>" />
    </td>
    <td>
        <%: Html.Label(Model.Name) %>
    </td>
</tr>

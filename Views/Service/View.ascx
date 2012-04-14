<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Cosmetology.Web.Models.ViewService>" %>
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
    <td>
        <%: Html.Label(Model.ServiceTypeName) %>
    </td>
    <td>
        <%: Html.Label(Model.Order.HasValue ? Model.Order.Value.ToString() : "") %>
    </td>
</tr>

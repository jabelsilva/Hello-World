 <%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Cosmetology.Web.Models.ViewUserService>>" %>
<% var serviceType = (from vs in Model select new { ServiceType = vs.ServiceType, ServiceTypeName = vs.ServiceTypeName }).Distinct().ToList();  %>
<% var editable = ((bool)ViewData["Editable"]);  %>

<div id="viewuserservice">    
    
   <% if (editable)
      { if(serviceType.Count > 0) { %> <input type="button" id="EditService" value="Editar" class="ui-button ui-widget ui-state-default ui-corner-all" role="button" aria-disabled="false" /><% } %>
           <input type="button" id="AddService" value="Adicionar Serviços" class="ui-button ui-widget ui-state-default ui-corner-all" role="button" aria-disabled="false" /><% } %>
       <br />
    
    <% foreach (var st in serviceType)
       { %>
    <div class="grid_4 alpha">
        <table class="content">
        <thead>
            <tr>
                <th>
                    <%: Html.Label(st.ServiceTypeName) %>
                </th>
                <th>
                    Preço
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var s in Model.Where(o => o.ServiceType == st.ServiceType))
               { %>
            <tr>
                <td>
                    <%: Html.Label(s.ServiceName) %>
                </td>
                <td>
                    <%: Html.Label(s.Price.HasValue ? s.Price.Value.ToString() : "") %>
                    <%--<% foreach (var ss in Model.SubService.Where(o => o.Service == s.Id))
                       { %>
                    <br />
                    &nbsp;&nbsp;&nbsp;<%: Html.CheckBox(ss.Name, false, new { Service = ss.Id, @class = "SubService" })%>
                    <%: Html.Label(ss.Name) %>
                    <% } %>--%>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    </div>
    <% } %>
</div>

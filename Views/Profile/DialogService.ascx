<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Cosmetology.Web.Models.Profile>" %>
<% var serviceType = (from vs in Model.DialogService.Service select new { ServiceType = vs.ServiceType, ServiceTypeName = vs.ServiceTypeName }).Distinct();  %>

<% foreach (var st in serviceType)
   { %>
<div id="DialogService" class="grid_4">
    <table class="content">
        <thead>
            <tr>
                <th>
                    <%: Html.Label(st.ServiceTypeName) %>
                </th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var s in Model.DialogService.Service.Where(o => o.ServiceType == st.ServiceType))
               { %>
            <tr>
                <td>
                    <%: Html.CheckBox(s.Name, Model.UserService.Where(i => i.Service ==  s.Id).Any() ? true : false, new { Service = s.Id }) %>
                    <%: Html.Label(s.Name) %>                    
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>
<% } %>


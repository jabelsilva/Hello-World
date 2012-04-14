<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Cosmetology.Web.Models.ViewUserService>>" %>
<div id="edituserservice">
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <% using (Html.BeginForm())
       {%>
        <%: Html.ValidationSummary("Corrija os erros.") %>
    <input type="button" id="UpdateService" value="Guardar" class="ui-button ui-widget ui-state-default ui-corner-all" aria-disabled="false" />
    <input type="button" id="CancelService" value="Cancelar" class="ui-button ui-widget ui-state-default ui-corner-all" aria-disabled="false" />

    <br />

    <% var serviceType = (from vs in Model select new { ServiceType = vs.ServiceType, ServiceTypeName = vs.ServiceTypeName }).Distinct();
       var i = 0; %>
    <% foreach (var st in serviceType)
       { %>
    <div class="grid_4">
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
                        <%: Html.Hidden(string.Format("UserService[{0}].Service", i), s.Service)%>
                        <%--<% foreach (var ss in Model.SubService.Where(o => o.Service == s.Id))
                       { %>
                    <br />
                    &nbsp;&nbsp;&nbsp;<%: Html.CheckBox(ss.Name, false, new { Service = ss.Id, @class = "SubService" })%>
                    <%: Html.Label(ss.Name) %>
                    <% } %>--%>
                    </td>
                    <td>
                        <%: Html.TextBox(string.Format("UserService[{0}].Price", i), s.Price.HasValue ? s.Price.Value.ToString() : "", new { @style = "width:50px" })%>
                        <%: Html.ValidationMessage(string.Format("UserService[{0}].Price", i), "*")%>

                    </td>
                </tr>
                <% i++;
               } %>
            </tbody>
        </table>
    </div>
    <% } %>
     <% }%>
</div>

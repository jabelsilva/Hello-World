<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Cosmetology.Web.Models.ViewUserProfile>" %>
<div id="viewuserprofile">
    <% if (Model.Editable)
       { %><input type="button" id="EditProfile" value="Editar" class="ui-button ui-widget ui-state-default ui-corner-all"
           role="button" aria-disabled="false" /><% } %>
            <br />
    <div class="grid_6">
        <table class="content">
            <tr>
                <td>
                    Nome
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.Name) ? "" : Model.Name)%>
                </td>
            </tr>
            <tr>
                <td>
                    Phone
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.Phone) ? "" : Model.Phone)%>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.Mobile) ? "" : Model.Mobile)%>
                </td>
            </tr>
            <tr>
                <td>
                    Fax
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.Fax) ? "" : Model.Fax)%>
                </td>
            </tr>
            <tr>
                <td>
                    Mail
                </td>
                <td>
                 <% if (!string.IsNullOrEmpty(Model.WebSite))
            { %> <a href="http://<%: Model.WebSite %>" target="_blank"><%: Model.WebSite%></a><% } %>
                </td>
            </tr>
            <tr>
                <td>
                    WebSite
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.WebSite) ? "" : Model.WebSite)%>
                </td>
            </tr>
        </table>
    </div>
    <div class="grid_6">
        <table class="content">
            <tr>
                <td>
                    Tipo de Serviço
                </td>
                <td>
                    <% if (Model.ServiceType.HasValue)
                       { %>
                        <%: Html.Label(Cosmetology.Web.Models.Enums.ServiceType(null).Where(o => o.Value == Model.ServiceType.Value.ToString()).First().Text) %>
                    <% } %>
                </td>
            </tr>
            <tr>
                <td>
                    Morada
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.Address) ? "" : Model.Address)%>
                </td>
            </tr>
            <tr>
                <td>
                    Distrito
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.DistrictName) ? "" : Model.DistrictName)%>
                </td>
            </tr>
            <tr>
                <td>
                    Concelho
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.CountyName) ? "" : Model.CountyName)%>
                </td>
            </tr>
            <tr>
                <td>
                    Codigo Postal
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.PostalCode) ? "" : Model.PostalCode)%>
                </td>
            </tr>            
            <% if (Model.Editable)
               { %>
            <tr>
                <td>
                    Latitude
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.Lat) ? "" : Model.Lat)%>
                </td>
            </tr>
            <tr>
                <td>
                    Longitude
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.Lng) ? "" : Model.Lng)%>
                </td>
            </tr>
           
            <tr>
                <td>
                    Apresentação
                </td>
                <td>
                    <%: Html.Label(string.IsNullOrEmpty(Model.Presentation) ? "" : Model.Presentation)%>
                </td>
            </tr>
             <% } %>
        </table>
    </div>
</div>

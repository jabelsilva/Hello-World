<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Cosmetology.Web.Models.ViewUserProfile>" %>
<div id="edituserprofile">
   <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <% using (Html.BeginForm())
       {%>
        <%: Html.ValidationSummary("Corrija os erros.") %>
        <input type="button" id="UpdateProfile" value="Guardar" class="ui-button ui-widget ui-state-default ui-corner-all" />
        <input type="button" id="CancelProfile" value="Cancelar" class="ui-button ui-widget ui-state-default ui-corner-all" role="button" aria-disabled="false" />    
        <br />
        <div class="grid_6">
        <table class="content">
            <tr>
                <td>
                    Nome
                </td>
                <td class="editor-field">
                    <%: Html.TextBoxFor(o => o.Name)%>
                    <%: Html.ValidationMessageFor(o => o.Name, "*")%>                   
                </td>
            </tr>
            <tr>
                <td>
                    Phone
                </td>
                <td>
                    <%: Html.TextBox("Phone", Model.Phone)%>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile
                </td>
                <td>
                    <%: Html.TextBox("Mobile", Model.Mobile)%>
                </td>
            </tr>
            <tr>
                <td>
                    Fax
                </td>
                <td>
                    <%: Html.TextBox("Fax", Model.Fax)%>
                </td>
            </tr>
            <tr>
                <td>
                    Mail
                </td>
                <td>
                    <%: Html.TextBox("Mail", Model.Mail)%>
                </td>
            </tr>
            <tr>
                <td>
                    WebSite
                </td>
                <td>
                    <%: Html.TextBox("WebSite", Model.WebSite)%>
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
                    <%: Html.DropDownList("ServiceType", Cosmetology.Web.Models.Enums.ServiceType(Model.ServiceType))%>
                </td>
            </tr>
            <tr>
                <td>
                    Morada
                </td>
                <td>
                    <%: Html.TextBox("Address", Model.Address)%>
                </td>
            </tr>
            <tr>
                <td>
                    Distrito
                </td>
                <td>
                    <%: Html.DropDownListFor(o => o.District, ((List<SelectListItem>)ViewData["DistrictList"]))%>
                    <%: Html.ValidationMessageFor(o => o.District, "*")%> 
                </td>
            </tr>
            <tr>
                <td>
                    Concelho
                </td>
                <td>
                    <%: Html.DropDownListFor(o => o.County, ((List<SelectListItem>)ViewData["CountyList"]) ?? new List<SelectListItem>())%>
                    <%: Html.ValidationMessageFor(o => o.County, "*")%> 
                </td>
            </tr>
            <tr>
                <td>
                    Código Postal
                </td>
                <td>
                    <%: Html.TextBox("PostalCode", string.IsNullOrEmpty(Model.PostalCode) ? "" : Model.PostalCode)%>
                </td>
            </tr>
            <tr>
                <td>
                    Latitude
                </td>
                <td>
                    <%: Html.TextBox("Lat", Model.Lat)%>
                </td>
            </tr>
            <tr>
                <td>
                    Longitude
                </td>
                <td>
                    <%: Html.TextBox("Lng", Model.Lng)%>
                </td>
            </tr>
            <tr>
                <td>
                    Apresentação
                </td>
                <td>
                    <%: Html.TextArea("Presentation", Model.Presentation)%>
                </td>
            </tr>
        </table>
        </div>
    <% }%>
</div>

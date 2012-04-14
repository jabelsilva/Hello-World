<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Cosmetology.Web.Models.ServiceType>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Tipos de Serviço
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<script src="<%: Url.Content("~/Scripts/forms-inline.js") %>" type="text/javascript"></script>
    <h2>
        Tipos de Serviço</h2>
    <table>
        <thead>
            <th>
            </th>
            <th>
                Id
            </th>
            <th>
                Nome
            </th>
        </thead>
        <tbody>
            <% foreach (var row in Model)
               { %>
            <% Html.RenderPartial("View", row); %>
            <% } %>
        </tbody>
        <tfoot>
            <% Html.RenderPartial("Edit", new Cosmetology.Web.Models.ServiceType()); %>
        </tfoot>
    </table>

    <script type="text/javascript">
        $(function () {
            inline.initialize();
        });    
    </script>
</asp:Content>

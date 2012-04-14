<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Cosmetology.Web.Models.UserProfileDetails>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% var map = new Cosmetology.Web.Models.Maps()
       {
           Key = System.Configuration.ConfigurationSettings.AppSettings["GoogleApiKey"],
           Lat = Model.UserProfile.Lat,
           Lng = Model.UserProfile.Lng,
           Zoom = 15
       }; %>
    
    <% Html.RenderPartial("Maps", map); %>
    <table>
        <tr>
            <td valign="top">                
                <div>
                    <h2>
                        <%: Model.UserProfile.Name %>
                    </h2>
                        <%: Model.UserProfile.Presentation %>
                    <fieldset>
                        <legend>Serviços</legend>
                        <% Html.RenderPartial("../Profile/View-UserService", Model.UserService ?? new List<Cosmetology.Web.Models.ViewUserService>()); %>
                    </fieldset>
                </div>
                <fieldset>
                    <legend>Contactos</legend>
                    <a id="OpenMap">Ver Mapa</a>
                    <%: string.Format("{0}", "Morada") %>

                    <%--<% Html.RenderPartial("../Profile/View-UserProfile", Model.UserProfile); %>--%>
                </fieldset>
            </td>
            <td valign="top">
                <% if (Model.Photo.Count > 0)
                   { %>
                <%--<div>
                    <% Html.RenderPartial("../Photo/SlideShow", Model.Photo); %>
                </div>--%>
                <div>
                    <% Html.RenderPartial("../Photo/List", Model.Photo); %>
                </div>
                <% } %>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        var mapsOpened = false;
        $(function () {
            $('#map_canvas').dialog({ autoOpen: false, width:600, height:400 });

            //$('#ViewerMap').hide();
            $('#OpenMap').live('click', function () {

                if (!mapsOpened) {
                    initialize();
                    mapsOpened = true;
                }

                $('#map_canvas').dialog('open');


                //                var viewerMap = $('#ViewerMap');
                //                var map = $(this).attr('map');
                //                $.ajax({
                //                    type: 'post',
                //                    url: '<%: Url.Action("GetMap") %>',
                //                    data: { id: map },
                //                    dataType: 'html',
                //                    success: function (request) {
                //                        viewerMap.append(request);
                //                        initialize();
                //                        //viewerMap.show();
                //                    }
                //                });
            });
        });
                
    </script>
</asp:Content>

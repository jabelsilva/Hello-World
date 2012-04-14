<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Cosmetology.Web.Models.Profile>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Perfile
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <%-- <script src="<%: Url.Content("~/Scripts/MicrosoftAjax.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/MicrosoftMvcValidation.js") %>" type="text/javascript"></script>
    <% Html.EnableClientValidation(); %>--%>
    <% foreach (var item in Model.UserService)
       { item.Editable = true; } %>
    <div>
        <h2>
            Os meus serviços</h2>
        <% Html.RenderPartial("View-UserService", Model.UserService ?? new List<Cosmetology.Web.Models.ViewUserService>()); %>
    </div>
    <div class="clear">
    </div>
    <div>
        <h2>
            Perfile</h2>
        <% if (Model.UserProfile.Count > 0)
           {%>
        <% foreach (var item in Model.UserProfile)  %>
        <% Html.RenderPartial("View-UserProfile", item); %>
        <% }
           else
           {%>
        <% Html.RenderPartial("Edit-UserProfile", new Cosmetology.Web.Models.ViewUserProfile()); %>
        <% }%>
    </div>
    <div id="Dialog">
        <% Html.RenderPartial("DialogService", Model); %>
    </div>
    <script type="text/javascript">
        $(function () {
            //$('#Dialog').hide()
            //            $('#EditProfile').button();
            //            $('#EditService').button();
            //            $('#UpdateProfile').button();
            //            $('#UpdateService').button();
            //            $('#CancelProfile').button();
            //            $('#CancelService').button();

            $('select[name=District]').live('change', function () {

                var tbody = $(this).parents('tbody');
                var county = tbody.find('select[name=County]');

                $.ajax({
                    type: 'POST',
                    url: '<%: Url.Action("CountyList") %>',
                    dataType: 'json',
                    data: { id: $(this).val() },
                    traditional: true,
                    success: function (request) {
                        county.empty();
                        county.append(request);
                    }
                });
            });

            $('#Dialog').dialog({
                title: 'Seleccione os seus serviços!',
                autoOpen: false,
                modal: true,
                buttons: [
                    {
                        text: "Cancelar",
                        click: function () { $(this).dialog("close"); }
                    },
                    {
                        text: "Confirmar",
                        click: function () {
                            $(this).dialog("close");
                            SaveService();
                        }
                    }
                ]
            });


            $('#UpdateProfile').live('click', function () {

                if (!$(this).parents('form').valid())
                    return false;

                var div = $(this).parents('div#edituserprofile');

                $.ajax({
                    type: 'POST',
                    url: '<%: Url.Action("UpdateProfile") %>',
                    dataType: 'html',
                    data: serilizeRow(div),
                    traditional: true,
                    success: function (request) {
                        div.replaceWith(request);
                    }
                });
            });

            $('#CancelProfile').live('click', function () {
                var div = $(this).parents('div#edituserprofile');
                $.ajax({
                    url: '<%: Url.Action("CancelProfile") %>',
                    type: 'GET',
                    dataType: 'html',
                    traditional: true,
                    success: function (request) {
                        div.replaceWith(request);
                    }
                });
            });

            $('#CancelService').live('click', function () {
                var div = $(this).parents('div#edituserservice');
                $.ajax({
                    url: '<%: Url.Action("CancelService") %>',
                    type: 'GET',
                    dataType: 'html',
                    traditional: true,
                    success: function (request) {
                        div.replaceWith(request);
                    }
                });
            });

            $('#EditProfile').live('click', function () {
                var div = $(this).parents('div#viewuserprofile');
                $.ajax({
                    url: '<%: Url.Action("EditProfile") %>',
                    type: 'GET',
                    dataType: 'html',
                    traditional: true,
                    success: function (request) {
                        div.replaceWith(request);
                    }
                });
            });

            $('#EditService').live('click', function () {
                var div = $(this).parents('div#viewuserservice');
                $.ajax({
                    url: '<%: Url.Action("EditService") %>',
                    type: 'GET',
                    dataType: 'html',
                    traditional: true,
                    success: function (request) {
                        div.replaceWith(request);
                    }
                });
            });

            $('#AddService').live('click', function () {
                $('#Dialog').dialog('open');
            });

            $('#UpdateService').live('click', function () {
                if (!$(this).parents('form').valid())
                    return false;
                var div = $(this).parents('div#edituserservice');

                $.ajax({
                    type: 'GET',
                    url: '<%: Url.Action("UpdateService") %>',
                    dataType: 'html',
                    data: serilizeRow(div),
                    traditional: true,
                    success: function (request) {
                        div.replaceWith(request);
                    }
                });
            });
        });

        function serilizeRow($row) {

            var row = new Object();
            $row.find('input,select,textarea').each(function () {

                var $type = $(this).attr("type");
                var $name = $(this).attr('name');

                //                if ($(this).is('select')) { 
                //                    
                //                
                //                }

                if ($name != undefined)
                    if ($type == "checkbox") {
                        row[$name] = $(this).is(':checked');
                    }
                    else {
                        row[$name] = $(this).val();
                    }
            });
            return row;
        }

        //function CheckParent()

        function SaveService() {
            var div = $('div#viewuserservice');

            var checked = $('div#DialogService').find('input[type=checkbox]:checked');
            var services = new Array;

            checked.each(function () {
                services.push($(this).attr('Service'));
            });

            $.ajax({ type: "POST",
                url: '<%: Url.Action("SaveService") %>',
                type: 'POST',
                data: { services: services },
                dataType: 'html',
                traditional: true,
                success: function (request) {
                    div.replaceWith(request);
                }
            });
        }
    </script>
</asp:Content>

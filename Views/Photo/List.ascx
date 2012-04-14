<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Cosmetology.Web.Models.Photo>>" %>
<% int i = 0; %>
<table>
    <% 
        foreach (var item in Model.Where(o => o.Size == (int)Cosmetology.Web.Models.PhotoSizeEnum.size150))
        {
            if (i % 4 == 0 || i == 0)
            {  %>
        <tr>
        <% } %>

        <td id="img" big="<%: item.Big %>">
            <img class="img" src="<%: Url.Action("Get", "Photo", new { id = item.File }) %>" />
            <br />
            <%: item.Name %>
        </td>

        <%  if (i % 8 == 0 && i != 0)
            {  %>
        <tr>

            <% } i++;
            }%>
</table>
<div id="big">
</div>
<script type="text/javascript">
    var currentImg = '';
    var m_y = 0;
    var m_x = 0;
    $(document).ready(function(){
        $(document).mousemove(function (e) {

            $('div#big').css('top', e.pageY + 5);
            $('div#big').css('left', e.pageX + 5);
//          m_x = e.pageX;
//          m_y = e.pageY;
       }); 
    });
    $(function () {

        $('td[id=img]').mouseover(function () {
            $('div#big').show(200);
            if ($(this).attr('big') == currentImg)
                return false;
            
            currentImg = $(this).attr('big');

            var img = '<img class="img" src="/Photo/Get/' + currentImg + '" />';
            $('div#big').empty();
            $('div#big').append(img);
            //$('div#big').show(200);

            $(this).mouseleave(function () {

                $('div#big').hide(100);

            });

        });

       
    });
</script>

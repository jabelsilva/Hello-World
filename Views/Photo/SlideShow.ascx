<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Cosmetology.Web.Models.Photo>>" %>
<link href="../../Content/slideShow.css" rel="stylesheet" type="text/css" />
<script src="<%: Url.Content("~/Scripts/jquery.rotate.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/slide-Show.js") %>" type="text/javascript"></script>
<div id="slideShowContainer">
    <div id="slideShow">
        <ul>
            <% 
                foreach (var item in Model.Where(o => o.Size == (int)Cosmetology.Web.Models.PhotoSizeEnum.size500))
                {%>
            <li><img class="img" src="<%: Url.Action("Get", "Photo", new { id = item.File }) %>" /></li>
            <% } %>
        </ul>
    </div>
    <a id="previousLink" href="#">&raquo;</a> <a id="nextLink" href="#">&laquo;</a>
</div>

<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Cosmetology.Web.Models.ViewIndex>>" %>
<ul class="list">
    <% foreach (var item in Model)
       {  %>
    <li>
        <div>
         <h3><a href="<%: Url.Action("Details", new { id = item.Url}) %>"> <%: Html.Label(string.IsNullOrEmpty(item.Name) ? "" : item.Name)%></a></h3>
        <div>
            <%: Html.Label(string.IsNullOrEmpty(item.ServiceName) ? "" : item.ServiceName + " - ")%>
            <%: Html.Label(string.IsNullOrEmpty(item.ServiceName) ? "" : item.ServiceName)%>
            <%: Html.Label(item.Price.HasValue ? "€" + item.Price.Value.ToString() : "")%>        
        </div>
        
         <%: Html.Label(string.IsNullOrEmpty(item.Phone) ? "" : item.Phone)%>
         <br />
         <%: Html.Label(string.IsNullOrEmpty(item.Mobile) ? "" : item.Mobile)%>
         <br />
         <% if (!string.IsNullOrEmpty(item.WebSite))
            { %> <a href="http://<%: item.WebSite %>" target="_blank"><%: item.WebSite%></a><% } %>
        </div>
        
        <div>
            
        </div>
    </li>
    <% } %>
</ul>

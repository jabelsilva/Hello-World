<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Cosmetology.Web.Models.District>>" %>
<div id="Dis">
<table class="content">
    <% int i = 1;
       foreach (var item in Model)
       {
           if (i % 4 == 0 && i == 1)
           {
    %><tr>
        <%
       }%>
        <td>
            <label id="name"><%: item.Name %></label> 
            <%: Html.Hidden("Id", item.Id) %>
        </td>
        <% if (i % 4 == 0 && i != 0)
           {%><tr>
            <%}
           i++;
   }
   
   %>
</table>
</div>
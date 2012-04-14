<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div id="FileUpload">
 <form method="post" enctype="multipart/form-data" action="<%: Url.Action("Save", "Photo") %>">        
        <input type="file" id="FileBlob" name="FileBlob" />
        <%: Html.TextBox("Name", "") %>
        <input type="submit" value="Guardar" /> 
    </form>
</div>

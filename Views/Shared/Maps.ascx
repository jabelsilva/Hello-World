<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<Cosmetology.Web.Models.Maps>" %>

 
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <style type="text/css">
     
      #map_canvas { height: 200px; width:400px; }
    </style>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=<%: Model.Key %>&sensor=true">
    </script>
    <script type="text/javascript">
        function initialize() {
            var myOptions = {
                center: new google.maps.LatLng(<%: Model.Lat %>, <%: Model.Lng %>),
                zoom: <%: Model.Zoom %>,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
        }
    </script>
 
    <div id="map_canvas"></div>	

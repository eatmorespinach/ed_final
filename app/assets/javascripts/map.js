$(document).ready(function(){
	if (document.getElementById('list_map') != null) {

		google.load("visualization", "1", {packages:["geochart"], callback:drawRegionsMap})

		function drawRegionsMap() {

			$.get('map.json', function(data) {

				var list = new google.visualization.arrayToDataTable(data);

				var options = {};

				var chart = new google.visualization.GeoChart(document.getElementById('list_map'));
				chart.draw(list, options);
			})
	     
		};
	};
});


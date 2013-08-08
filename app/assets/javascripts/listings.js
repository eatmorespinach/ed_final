// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){

	$('.carousel').carousel({
		interval: false
	});	
	google.load("visualization", "1", {packages:["geochart"], callback:drawRegionsMap})

	function drawRegionsMap() {

		$.get('map.json', function(data) {

			var list = new google.visualization.arrayToDataTable(data);

			var options = {};

			var chart = new google.visualization.GeoChart(document.getElementById('list_map'));
			chart.draw(list, options);
		})
     
	};
});


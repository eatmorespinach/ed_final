$(document).ready(function(){
	if (document.getElementById('list_map') != null) {

		google.load("visualization", "1", {packages:["geochart"], callback:drawRegionsMap})

		function drawRegionsMap() {

			$.get('map.json', function(data) {
				var list = new google.visualization.arrayToDataTable(data.list);
				var people = new google.visualization.arrayToDataTable(data.people);

				var options = {'width':900, 'height':500};

				var listchart = new google.visualization.GeoChart(document.getElementById('list_map'));
				listchart.draw(list, options);
				var peoplechart = new google.visualization.GeoChart(document.getElementById('people_map'));
				peoplechart.draw(people, options);
			})


	     
		};

		$('#switch_map').click(function() {
			if ($(this).text() == "Switch to Users") {
				$('#list_map').toggle( function() {
					$('#people_map').toggle( function() {
						$('#switch_map').text('Switch to Listing')
					});
				});
			} else if ($(this).text() == "Switch to Listing") {
				$('#people_map').toggle( function() {
					$('#list_map').toggle( function() {
						$('#switch_map').text('Switch to Users')
					});
				});
			}

		});
	};
});


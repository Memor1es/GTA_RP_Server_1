$(document).ready(function() {
    window.addEventListener("message", function(event) {
        if (event.data.update == true) {		
			setImageIcon(event.data.url)			
        };  
		if (event.data.display == true){	
			$("#m").html = "";			
			$(".hud").fadeIn();
			$('#ten').html('Name :' + event.data.ten);
			$('#id').html('ID :' + event.data.id);
			$('#lydo').html('Reason:' + event.data.lydo);			
			$('#m').html('Time :' +event.data.m+ ' min');									
		}else if (event.data.display == false){
			$(".hud").fadeOut();
		};		
    });	
	function setImageIcon(value){
		$('#photo').attr("src", value);
	} 
});
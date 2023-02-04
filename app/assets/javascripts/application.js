//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(function() {
	var modal = document.getElementById('myModal');
	var info = document.getElementById("info");
	var upd = document.getElementById("update");
	var span = document.getElementsByClassName("close")[0];
	var modalContent = document.getElementsByClassName("modal-content")[0];
	var close = document.getElementById("close");

	[...document.querySelectorAll(".myBtn")].map(
		function(element) {
			element.onclick = function() {
			  modal.style.display = "block";
			  info.style.display = "block";
			  upd.style.display = "none";
			  close.style.display = "none";

				if ($("#user_throw").find("img").length !== 0)
					$('#user_throw').empty()
				$('#user_throw').append(element.querySelector('img').outerHTML)
				$('#user_throw').append('<p>Your bet</p>')
			}
		}
	);
	span.onclick = function() {
	  modal.style.display = "none";
	 	modalContent.style.height = "470px";
		modalContent.style.width = "880px";
	};
	close.onclick = function() {
	  modal.style.display = "none";
	 	modalContent.style.height = "470px";
		modalContent.style.width = "880px";
	};
});

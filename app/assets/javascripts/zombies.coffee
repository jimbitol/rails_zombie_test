# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$("#bio-toggle").click (event) ->
		alert "click has loaded!"
		event.preventDefault()
		$(this).hide()
		$('.field#bio').show()

$(document).ready ->
	$('div#custom_phase_two form').submit (event) ->
		event.preventDefault()

		url = $(this).attr('action')
		custom_decomp = $('div#custom_phase_two #zombie_decomp').val()

		$.ajax
			type: 'put'
			url: url
			dataType: "json"
			data: { zombie: { decomp: custom_decomp } }
			success: (json) ->
				$('#decomp').text(json.decomp).effect('highlight')
				$('div#custom_phase_two').fadeOut() if json.decomp == "Dead (again)"

$(document).ready ->
	$('.modal-click').click ->
		document.getElementsByClassName('modal')[0].style.display = 'block'
		return
	window.onclick = (event) ->
		if event.target == document.getElementsByClassName('modal')[0]
			document.getElementsByClassName('modal')[0].style.display = 'none'
		return
	$('.close').click ->
		document.getElementsByClassName('modal')[0].style.display = 'none'
		return
	return

window.onload = ->

	canvas = document.getElementById 'canvas'
	ctx = canvas.getContext '2d'
	width = canvas.width = window.innerWidth
	height = canvas.height = window.innerHeight

	update = ->

		ctx.clearRect 0, 0, width, height

		

		requestAnimationFrame update
		return
	update()


	return
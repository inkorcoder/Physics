window.onload = ->

	canvas = document.getElementById 'canvas'
	ctx = canvas.getContext '2d'
	width = canvas.width = window.innerWidth
	height = canvas.height = window.innerHeight

	circle0 =
		x: Math.random() * width
		y: Math.random() * height
		radius: 50 + Math.random() * 100

	circle1 =
		x: Math.random() * width
		y: Math.random() * height
		radius: 50 + Math.random() * 100

	document.body.addEventListener "mousemove", (event)->
		circle1.x = event.clientX
		circle1.y = event.clientY

		if utils.circleCollision circle0, circle1
			ctx.fillStyle = "#f66"
		else
			ctx.fillStyle = "#999"

		ctx.clearRect 0, 0, width, height
		ctx.beginPath()
		ctx.arc circle0.x, circle0.y, circle0.radius,
					0, Math.PI * 2, off
		ctx.fill()

		ctx.beginPath()
		ctx.arc circle1.x, circle1.y, circle1.radius,
					0, Math.PI * 2, off
		ctx.fill()

		return


	return
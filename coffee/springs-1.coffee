window.onload = ->

	canvas = document.getElementById 'canvas'
	ctx = canvas.getContext '2d'
	width = canvas.width = window.innerWidth
	height = canvas.height = window.innerHeight

	springPoint = vector.create width / 2, height / 2
	weight = particle.create(
		Math.random() * width
		Math.random() * height
		50, Math.random() * Math.PI * 2
	)
	weight.radius = 20
	weight.friction = 0.9

	k = 0.1

	document.body.addEventListener "mousemove", (event)->
		springPoint.setX event.clientX
		springPoint.setY event.clientY

	update = ->

		ctx.clearRect 0, 0, width, height

		distance = springPoint.substract weight.position
		springForce = distance.multiply k

		weight.velocity.addTo springForce

		weight.update()

		ctx.beginPath()
		ctx.arc weight.position.getX(), weight.position.getY(), weight.radius, 0, Math.PI * 2, off
		ctx.fill()

		ctx.beginPath()
		ctx.arc springPoint.getX(), springPoint.getY(), 4, 0, Math.PI * 2, off
		ctx.fill()

		ctx.beginPath()
		ctx.moveTo weight.position.getX(), weight.position.getY()
		ctx.lineTo springPoint.getX(), springPoint.getY()
		ctx.stroke()

		requestAnimationFrame update
		return
	update()


	return
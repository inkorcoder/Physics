window.onload = ->

	canvas = document.getElementById 'canvas'
	ctx = canvas.getContext '2d'
	width = canvas.width = window.innerWidth
	height = canvas.height = window.innerHeight

	p = particle.create(
		100, height,
		10,
		-Math.PI / 2
	)
	accel = vector.create 0.1, 0.1

	update = ->

		ctx.clearRect 0, 0, width, height

		p.accelerate accel
		p.update()

		ctx.beginPath()
		ctx.arc p.position.getX(), p.position.getY(), 3, 0, Math.PI*2, off
		ctx.fill()

		requestAnimationFrame update
		return
	update()


	return
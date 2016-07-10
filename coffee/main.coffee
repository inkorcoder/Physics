window.onload = ->

	canvas = document.getElementById 'canvas'
	ctx = canvas.getContext '2d'
	width = canvas.width = window.innerWidth
	height = canvas.height = window.innerHeight

	particles = []

	for i in [0...100]
		particles.push(
			particle.create(
				width / 2, height / 3,
				Math.random() * 5 + 2,
				Math.random() * Math.PI * 2
				0.1
			)
		)

	update = ->

		ctx.clearRect 0, 0, width, height

		for p in particles
			p.update()
			ctx.beginPath()
			ctx.arc p.position.getX(), p.position.getY(), 3, 0, Math.PI*2, off
			ctx.fill()

		requestAnimationFrame update
		return
	update()


	return
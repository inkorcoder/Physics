window.onload = ->

	canvas = document.getElementById 'canvas'
	ctx = canvas.getContext '2d'
	width = canvas.width = window.innerWidth
	height = canvas.height = window.innerHeight

	particles = []

	for i in [0...100]
		p = particle.create width / 2, height, Math.random() * 8 + 5, -Math.PI / 2 + (Math.random() * .2 - .1), 0.1
		p.radius = Math.random() * 10 + 2
		particles.push p

	update = ->

		ctx.clearRect 0, 0, width, height

		for p in particles
			p.update()
			ctx.beginPath()
			ctx.fillStyle = "#0000ff"
			ctx.arc p.position.getX(), p.position.getY(), p.radius, 0, Math.PI * 2, off
			ctx.fill()

			if p.position.getY() - p.radius > height
				p.position.setX width / 2
				p.position.setY height
				p.velocity.setLength Math.random() * 8 + 5
				p.velocity.setAngle -Math.PI / 2 + (Math.random() * .2 - .1)

		# if p.position.getX() - p.radius > width
		# 	p.position.setX -p.radius
		# if p.position.getX() + p.radius < 0
		# 	p.position.setX width + p.radius
		# if p.position.getY() - p.radius > height
		# 	p.position.setY -p.radius
		# if p.position.getY() + p.radius < 0
		# 	p.position.setY height + p.radius

		requestAnimationFrame update
		return
	update()


	return
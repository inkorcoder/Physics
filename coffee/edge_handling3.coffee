window.onload = ->

	canvas = document.getElementById 'canvas'
	ctx = canvas.getContext '2d'
	width = canvas.width = window.innerWidth
	height = canvas.height = window.innerHeight

	p = particle.create width / 2, height, Math.random() * 8 + 5, 1, 0.1, 0.1
	p.radius = 40
	p.bounce = -0.9

	update = ->

		ctx.clearRect 0, 0, width, height

		p.update()

		ctx.beginPath()
		ctx.fillStyle = "#000000"
		ctx.arc p.position.getX(), p.position.getY(), p.radius, 0, Math.PI * 2, off
		ctx.fill()

		if p.position.getX() + p.radius > width
			p.position.setX width - p.radius
			p.velocity.setX p.velocity.getX() * p.bounce

		if p.position.getX() - p.radius < 0
			p.position.setX p.radius
			p.velocity.setX p.velocity.getX() * p.bounce

		if p.position.getY() + p.radius > height
			p.position.setY height - p.radius
			p.velocity.setY p.velocity.getY() * p.bounce

		if p.position.getY() - p.radius < 0
			p.position.setY p.radius
			p.velocity.setY p.velocity.getY() * p.bounce


		requestAnimationFrame update
		return
	update()


	return
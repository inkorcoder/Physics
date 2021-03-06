window.onload = ->

	canvas = document.getElementById 'canvas'
	ctx = canvas.getContext '2d'
	width = canvas.width = window.innerWidth
	height = canvas.height = window.innerHeight

	p = particle.create width / 2, height / 2, 10, Math.random() * Math.PI * 2
	p.radius = 10
	p.friction = 0.95

	update = ->

		ctx.clearRect 0, 0, width, height

		p.update()

		ctx.beginPath()
		ctx.fillStyle = "#000000"
		ctx.arc p.position.getX(), p.position.getY(), p.radius, 0, Math.PI * 2, off
		ctx.fill()

		requestAnimationFrame update
		return
	update()


	return
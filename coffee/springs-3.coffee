window.onload = ->

	canvas = document.getElementById 'canvas'
	ctx = canvas.getContext '2d'
	width = canvas.width = window.innerWidth
	height = canvas.height = window.innerHeight

	particleA = particle.create(
		utils.randomRange 0, width
		utils.randomRange 0, height
		utils.randomRange 0, 50
		utils.randomRange 0, Math.PI * 2
		0.2
	)

	particleB = particle.create(
		utils.randomRange 0, width
		utils.randomRange 0, height
		utils.randomRange 0, 50
		utils.randomRange 0, Math.PI * 2
		0.2
	)

	particleC = particle.create(
		utils.randomRange 0, width
		utils.randomRange 0, height
		utils.randomRange 0, 50
		utils.randomRange 0, Math.PI * 2
		0.2
	)

	k = 0.01
	separation = 100

	particleA.friction = 0.9
	particleA.radius = 10

	particleB.friction = 0.9
	particleB.radius = 10

	particleC.friction = 0.9
	particleC.radius = 10

	spring = (p0, p1, separation)->

		distance = p0.position.substract p1.position
		distance.setLength distance.getLength() - separation

		springForce = distance.multiply k

		p1.velocity.addTo springForce
		p0.velocity.substractFrom springForce

	checkEdges = (p)->
		if p.position.getY() + p.radius > height
			p.position.setY height - p.radius
			p.velocity.setY p.velocity.getY() * -0.95

	update = ->

		ctx.clearRect 0, 0, width, height

		spring particleA, particleB, separation
		spring particleB, particleC, separation
		spring particleC, particleA, separation

		checkEdges particleA
		checkEdges particleB
		checkEdges particleC

		particleA.update()
		particleB.update()
		particleC.update()

		ctx.beginPath()
		ctx.arc particleA.position.getX(), particleA.position.getY(),
						particleA.radius, 0, Math.PI * 2, off
		ctx.fill()

		ctx.beginPath()
		ctx.arc particleB.position.getX(), particleB.position.getY(),
						particleB.radius, 0, Math.PI * 2, off
		ctx.fill()

		ctx.beginPath()
		ctx.arc particleC.position.getX(), particleC.position.getY(),
						particleC.radius, 0, Math.PI * 2, off
		ctx.fill()

		ctx.beginPath()
		ctx.moveTo particleA.position.getX(), particleA.position.getY()
		ctx.lineTo particleB.position.getX(), particleB.position.getY()
		ctx.lineTo particleC.position.getX(), particleC.position.getY()
		ctx.lineTo particleA.position.getX(), particleA.position.getY()
		ctx.stroke()

		requestAnimationFrame update
		return
	update()

	setTimeout ->
		location.reload()
	, 10000

	return
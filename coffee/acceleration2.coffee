window.onload = ->

	canvas = document.getElementById 'canvas'
	ctx = canvas.getContext '2d'
	width = canvas.width = window.innerWidth
	height = canvas.height = window.innerHeight

	ship = particle.create width / 2, height / 2, 0, 0
	thrust = vector.create 0, 0
	angle = 0
	turningLeft = off
	turningRight = off
	thrusting = off

	document.addEventListener 'keydown', (e)->
		switch e.keyCode
			when 38 then thrusting = on
			when 37 then turningLeft = on
			when 39 then turningRight = on

	document.addEventListener 'keyup', (e)->
		switch e.keyCode
			when 38 then thrusting = off
			when 37 then turningLeft = off
			when 39 then turningRight = off

	update = ->

		ctx.clearRect 0, 0, width, height

		if turningLeft then angle -= 0.05
		if turningRight then angle += 0.05

		thrust.setAngle angle
		thrust.setLength if thrusting then 0.1 else 0

		ship.accelerate thrust
		ship.update()

		ctx.save()
		ctx.translate ship.position.getX(), ship.position.getY()
		ctx.rotate angle

		ctx.beginPath()
		ctx.moveTo 10, 0
		ctx.lineTo -10, -7
		ctx.lineTo -10, 7
		ctx.lineTo 10, 0
		if thrusting
			ctx.moveTo -10, 0
			ctx.lineTo -20, 0
		ctx.stroke()

		ctx.restore()

		if ship.position.getX() > width
			ship.position.setX 0
		if ship.position.getX() < 0
			ship.position.setX width
		if ship.position.getY() > height
			ship.position.setY 0
		if ship.position.getY() < 0
			ship.position.setY height

		requestAnimationFrame update
		return
	update()


	return
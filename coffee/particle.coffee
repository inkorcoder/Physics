particle =
	position: null
	velocity: null
	mass: 1
	radius: 0
	bounce: -1
	friction: 1
	gravity: 0

	create: (x, y, speed, direction, grav) ->
		obj = Object.create(this)
		obj.position = vector.create(x, y)
		obj.velocity = vector.create(0, 0)
		obj.velocity.setLength speed
		obj.velocity.setAngle direction
		obj.gravity = vector.create(0, grav or 0)
		obj

	accelerate: (accel) ->
		@velocity.addTo accel
		return

	update: ->
		@velocity.multiplyBy @friction
		@velocity.addTo @gravity
		@position.addTo @velocity
		return

	angleTo: (p2) ->
		Math.atan2 p2.position.getY() - @position.getY(), p2.position.getX() - @position.getX()

	distanceTo: (p2) ->
		dx = p2.position.getX() - @position.getX()
		dy = p2.position.getY() - @position.getY()
		Math.sqrt dx * dx + dy * dy

	gravitateTo: (p2) ->
		grav = vector.create(0, 0)
		dist = @distanceTo(p2)
		grav.setLength p2.mass / (dist * dist)
		grav.setAngle @angleTo(p2)
		@velocity.addTo grav
		return
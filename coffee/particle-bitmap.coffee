particle =
	x: 0
	y: 0
	vx: 0
	vy: 0
	mass: 1
	radius: 0
	bounce: -1
	friction: 1
	gravity: 0
	springs: null
	gravitations: null

	create: (x, y, speed, direction, grav) ->
		obj = Object.create(this)
		obj.x = x
		obj.y = y
		obj.vx = Math.cos(direction) * speed
		obj.vy = Math.sin(direction) * speed
		obj.gravity = grav or 0
		obj.springs = []
		obj.gravitations = []
		obj

	addGravitation: (p) ->
		@removeGravitation p
		@gravitations.push p
		return

	removeGravitation: (p) ->
		i = 0
		while i < @gravitations.length
			if p == @gravitations[i]
				@gravitations.splice i, 1
				return
			i += 1
		return

	addSpring: (point, k, length) ->
		@removeSpring point
		@springs.push
			point: point
			k: k
			length: length or 0
		return

	removeSpring: (point) ->
		i = 0
		while i < @springs.length
			if point == @springs[i].point
				@springs.splice i, 1
				return
			i += 1
		return

	getSpeed: ->
		Math.sqrt @vx * @vx + @vy * @vy

	setSpeed: (speed) ->
		heading = @getHeading()
		@vx = Math.cos(heading) * speed
		@vy = Math.sin(heading) * speed
		return

	getHeading: ->
		Math.atan2 @vy, @vx

	setHeading: (heading) ->
		speed = @getSpeed()
		@vx = Math.cos(heading) * speed
		@vy = Math.sin(heading) * speed
		return

	accelerate: (ax, ay) ->
		@vx += ax
		@vy += ay
		return

	update: ->
		@handleSprings()
		@handleGravitations()
		@vx *= @friction
		@vy *= @friction
		@vy += @gravity
		@x += @vx
		@y += @vy
		return

	handleGravitations: ->
		i = 0
		while i < @gravitations.length
			@gravitateTo @gravitations[i]
			i += 1
		return

	handleSprings: ->
		i = 0
		while i < @springs.length
			spring = @springs[i]
			@springTo spring.point, spring.k, spring.length
			i += 1
		return

	angleTo: (p2) ->
		Math.atan2 p2.y - (@y), p2.x - (@x)

	distanceTo: (p2) ->
		dx = p2.x - (@x)
		dy = p2.y - (@y)
		Math.sqrt dx * dx + dy * dy

	gravitateTo: (p2) ->
		dx = p2.x - (@x)
		dy = p2.y - (@y)
		distSQ = dx * dx + dy * dy
		dist = Math.sqrt(distSQ)
		force = p2.mass / distSQ
		ax = dx / dist * force
		ay = dy / dist * force
		@vx += ax
		@vy += ay
		return

	springTo: (point, k, length) ->
		dx = point.x - (@x)
		dy = point.y - (@y)
		distance = Math.sqrt(dx * dx + dy * dy)
		springForce = (distance - length or 0) * k
		@vx += dx / distance * springForce
		@vy += dy / distance * springForce
		return

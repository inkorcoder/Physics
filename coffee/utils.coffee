utils =
	norm: (value, min, max) ->
		(value - min) / (max - min)

	lerp: (norm, min, max) ->
		(max - min) * norm + min

	map: (value, sourceMin, sourceMax, destMin, destMax) ->
		utils.lerp(utils.norm(value, sourceMin, sourceMax), destMin, destMax)

	clamp: (value, min, max) ->
		Math.min(Math.max(value, Math.min(min, max)), Math.max(min, max))

	distance: (p0, p1) ->
		dx = p1.x - p0.x
		dy = p1.y - p0.y
		Math.sqrt(dx * dx + dy * dy)

	distanceXY: (x0, y0, x1, y1) ->
		dx = x1 - x0
		dy = y1 - y0
		Math.sqrt(dx * dx + dy * dy)

	circleCollision: (c0, c1) ->
		utils.distance(c0, c1) <= c0.radius + c1.radius

	circlePointCollision: (x, y, circle) ->
		utils.distanceXY(x, y, circle.x, circle.y) < circle.radius

	pointInRect: (x, y, rect) ->
		utils.inRange(x, rect.x, rect.x + rect.width) &&
		utils.inRange(y, rect.y, rect.y + rect.height)

	inRange: (value, min, max) ->
		value >= Math.min(min, max) && value <= Math.max(min, max)

	rangeIntersect: (min0, max0, min1, max1) ->
		Math.max(min0, max0) >= Math.min(min1, max1) && 
			   Math.min(min0, max0) <= Math.max(min1, max1)

	rectIntersect: (r0, r1) ->
		utils.rangeIntersect(r0.x, r0.x + r0.width, r1.x, r1.x + r1.width) &&
		utils.rangeIntersect(r0.y, r0.y + r0.height, r1.y, r1.y + r1.height)

	degreesToRads: (degrees)->
		degrees / 180 * Math.PI;

	radsToDegrees: (radians)->
		radians * 180 / Math.PI;

	randomRange: (min, max)->
		min + Math.random() * (max - min);

	randomInt: (min, max)->
		Math.floor(min + Math.random() * (max - min + 1));
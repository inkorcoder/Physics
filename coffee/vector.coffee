###
	vector constructor
###

vector =

	_x: 0
	_y: 0

	create: (x, y)->
		obj = Object.create this
		obj.setX x
		obj.setY y
		obj

	setX: (value)->
		this._x = value; return

	setY: (value)->
		this._y = value; return

	getX: (value)->
		this._x

	getY: (value)->
		this._y

	setAngle: (angle)->
		length = this.getLength()
		this._x = Math.cos(angle) * length
		this._y = Math.sin(angle) * length
		return

	getAngle: ->
		Math.atan2 this._y, this._x

	setLength: (length)->
		angle = this.getAngle()
		this._x = Math.cos(angle) * length
		this._y = Math.sin(angle) * length
		return

	getLength: ->
		Math.sqrt this._x * this._x + this._y * this._y

	add: (v2)->
		vector.create this._x + v2.getX(), this._y + v2.getY()

	substract: (v2)->
		vector.create this._x - v2.getX(), this._y - v2.getY()

	multiply: (val)->
		vector.create this._x * val, this._y * val

	divide: (val)->
		vector.create this._x / val, this._y / val

	addTo: (v2)->
		this._x += v2.getX()
		this._y += v2.getY()

	substractFrom: (v2)->
		this._x -= v2.getX()
		this._y -= v2.getY()

	multiplyBy: (val)->
		this._x *= val
		this._y *= val

	divideBy: (val)->
		this._x /= val
		this._y /= val
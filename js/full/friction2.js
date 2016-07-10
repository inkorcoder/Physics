window.onload = function() {
  var angle, canvas, ctx, height, ship, thrust, thrusting, turningLeft, turningRight, update, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
  ship = particle.create(width / 2, height / 2, 0, 0);
  ship.friction = 0.99;
  thrust = vector.create(0, 0);
  angle = 0;
  turningLeft = false;
  turningRight = false;
  thrusting = false;
  document.addEventListener('keydown', function(e) {
    switch (e.keyCode) {
      case 38:
        return thrusting = true;
      case 37:
        return turningLeft = true;
      case 39:
        return turningRight = true;
    }
  });
  document.addEventListener('keyup', function(e) {
    switch (e.keyCode) {
      case 38:
        return thrusting = false;
      case 37:
        return turningLeft = false;
      case 39:
        return turningRight = false;
    }
  });
  update = function() {
    ctx.clearRect(0, 0, width, height);
    if (turningLeft) {
      angle -= 0.05;
    }
    if (turningRight) {
      angle += 0.05;
    }
    thrust.setAngle(angle);
    thrust.setLength(thrusting ? 0.1 : 0);
    ship.accelerate(thrust);
    ship.update();
    ctx.save();
    ctx.translate(ship.position.getX(), ship.position.getY());
    ctx.rotate(angle);
    ctx.beginPath();
    ctx.moveTo(10, 0);
    ctx.lineTo(-10, -7);
    ctx.lineTo(-10, 7);
    ctx.lineTo(10, 0);
    if (thrusting) {
      ctx.moveTo(-10, 0);
      ctx.lineTo(-20, 0);
    }
    ctx.stroke();
    ctx.restore();
    if (ship.position.getX() > width) {
      ship.position.setX(0);
    }
    if (ship.position.getX() < 0) {
      ship.position.setX(width);
    }
    if (ship.position.getY() > height) {
      ship.position.setY(0);
    }
    if (ship.position.getY() < 0) {
      ship.position.setY(height);
    }
    requestAnimationFrame(update);
  };
  update();
};

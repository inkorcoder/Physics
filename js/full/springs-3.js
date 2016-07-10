window.onload = function() {
  var canvas, checkEdges, ctx, height, k, particleA, particleB, particleC, separation, spring, update, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
  particleA = particle.create(utils.randomRange(0, width), utils.randomRange(0, height), utils.randomRange(0, 50), utils.randomRange(0, Math.PI * 2), 0.2);
  particleB = particle.create(utils.randomRange(0, width), utils.randomRange(0, height), utils.randomRange(0, 50), utils.randomRange(0, Math.PI * 2), 0.2);
  particleC = particle.create(utils.randomRange(0, width), utils.randomRange(0, height), utils.randomRange(0, 50), utils.randomRange(0, Math.PI * 2), 0.2);
  k = 0.01;
  separation = 100;
  particleA.friction = 0.9;
  particleA.radius = 10;
  particleB.friction = 0.9;
  particleB.radius = 10;
  particleC.friction = 0.9;
  particleC.radius = 10;
  spring = function(p0, p1, separation) {
    var distance, springForce;
    distance = p0.position.substract(p1.position);
    distance.setLength(distance.getLength() - separation);
    springForce = distance.multiply(k);
    p1.velocity.addTo(springForce);
    return p0.velocity.substractFrom(springForce);
  };
  checkEdges = function(p) {
    if (p.position.getY() + p.radius > height) {
      p.position.setY(height - p.radius);
      return p.velocity.setY(p.velocity.getY() * -0.95);
    }
  };
  update = function() {
    ctx.clearRect(0, 0, width, height);
    spring(particleA, particleB, separation);
    spring(particleB, particleC, separation);
    spring(particleC, particleA, separation);
    checkEdges(particleA);
    checkEdges(particleB);
    checkEdges(particleC);
    particleA.update();
    particleB.update();
    particleC.update();
    ctx.beginPath();
    ctx.arc(particleA.position.getX(), particleA.position.getY(), particleA.radius, 0, Math.PI * 2, false);
    ctx.fill();
    ctx.beginPath();
    ctx.arc(particleB.position.getX(), particleB.position.getY(), particleB.radius, 0, Math.PI * 2, false);
    ctx.fill();
    ctx.beginPath();
    ctx.arc(particleC.position.getX(), particleC.position.getY(), particleC.radius, 0, Math.PI * 2, false);
    ctx.fill();
    ctx.beginPath();
    ctx.moveTo(particleA.position.getX(), particleA.position.getY());
    ctx.lineTo(particleB.position.getX(), particleB.position.getY());
    ctx.lineTo(particleC.position.getX(), particleC.position.getY());
    ctx.lineTo(particleA.position.getX(), particleA.position.getY());
    ctx.stroke();
    requestAnimationFrame(update);
  };
  update();
  setTimeout(function() {
    return location.reload();
  }, 10000);
};

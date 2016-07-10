window.onload = function() {
  var canvas, ctx, height, i, j, p, particles, update, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
  particles = [];
  for (i = j = 0; j < 100; i = ++j) {
    p = particle.create(width / 2, height, Math.random() * 8 + 5, -Math.PI / 2 + (Math.random() * .2 - .1), 0.1);
    p.radius = Math.random() * 10 + 2;
    particles.push(p);
  }
  update = function() {
    var k, len;
    ctx.clearRect(0, 0, width, height);
    for (k = 0, len = particles.length; k < len; k++) {
      p = particles[k];
      p.update();
      ctx.beginPath();
      ctx.fillStyle = "#0000ff";
      ctx.arc(p.position.getX(), p.position.getY(), p.radius, 0, Math.PI * 2, false);
      ctx.fill();
      if (p.position.getY() - p.radius > height) {
        p.position.setX(width / 2);
        p.position.setY(height);
        p.velocity.setLength(Math.random() * 8 + 5);
        p.velocity.setAngle(-Math.PI / 2 + (Math.random() * .2 - .1));
      }
    }
    requestAnimationFrame(update);
  };
  update();
};

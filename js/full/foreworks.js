window.onload = function() {
  var canvas, ctx, height, i, j, particles, update, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
  particles = [];
  for (i = j = 0; j < 100; i = ++j) {
    particles.push(particle.create(width / 2, height / 3, Math.random() * 5 + 2, Math.random() * Math.PI * 2, 0.1));
  }
  update = function() {
    var k, len, p;
    ctx.clearRect(0, 0, width, height);
    for (k = 0, len = particles.length; k < len; k++) {
      p = particles[k];
      p.update();
      ctx.beginPath();
      ctx.arc(p.position.getX(), p.position.getY(), 3, 0, Math.PI * 2, false);
      ctx.fill();
    }
    requestAnimationFrame(update);
  };
  update();
};

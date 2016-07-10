window.onload = function() {
  var canvas, ctx, height, p, update, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
  p = particle.create(width / 2, height / 2, 3, Math.random() * Math.PI * 2);
  p.radius = 20;
  update = function() {
    ctx.clearRect(0, 0, width, height);
    p.update();
    ctx.beginPath();
    ctx.fillStyle = "#0000ff";
    ctx.arc(p.position.getX(), p.position.getY(), p.radius, 0, Math.PI * 2, false);
    ctx.fill();
    if (p.position.getX() - p.radius > width) {
      p.position.setX(-p.radius);
    }
    if (p.position.getX() + p.radius < 0) {
      p.position.setX(width + p.radius);
    }
    if (p.position.getY() - p.radius > height) {
      p.position.setY(-p.radius);
    }
    if (p.position.getY() + p.radius < 0) {
      p.position.setY(height + p.radius);
    }
    requestAnimationFrame(update);
  };
  update();
};

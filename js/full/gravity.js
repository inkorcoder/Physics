window.onload = function() {
  var canvas, ctx, height, planet, sun, update, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
  sun = particle.create(width / 2, height / 2, 10, 0);
  sun.mass = 40000;
  planet = particle.create(width / 2 + 200, height / 2, 10, -Math.PI / 2);
  update = function() {
    ctx.clearRect(0, 0, width, height);
    planet.gravitateTo(sun);
    planet.update();
    ctx.beginPath();
    ctx.fillStyle = "#ffff00";
    ctx.arc(sun.position.getX(), sun.position.getY(), 20, 0, Math.PI * 2, false);
    ctx.fill();
    ctx.beginPath();
    ctx.fillStyle = "#0000ff";
    ctx.arc(planet.position.getX(), planet.position.getY(), 5, 0, Math.PI * 2, false);
    ctx.fill();
    requestAnimationFrame(update);
  };
  update();
};

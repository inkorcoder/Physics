window.onload = function() {
  var canvas, ctx, height, k, springLength, springPoint, update, weight, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
  springPoint = vector.create(width / 2, height / 2);
  weight = particle.create(Math.random() * width, Math.random() * height, 50, Math.random() * Math.PI * 2, 0.5);
  weight.radius = 20;
  weight.friction = 0.9;
  k = 0.1;
  springLength = 100;
  document.body.addEventListener("mousemove", function(event) {
    springPoint.setX(event.clientX);
    return springPoint.setY(event.clientY);
  });
  update = function() {
    var distance, springForce;
    ctx.clearRect(0, 0, width, height);
    distance = springPoint.substract(weight.position);
    distance.setLength(distance.getLength() - springLength);
    springForce = distance.multiply(k);
    weight.velocity.addTo(springForce);
    weight.update();
    ctx.beginPath();
    ctx.arc(weight.position.getX(), weight.position.getY(), weight.radius, 0, Math.PI * 2, false);
    ctx.fill();
    ctx.beginPath();
    ctx.arc(springPoint.getX(), springPoint.getY(), 4, 0, Math.PI * 2, false);
    ctx.fill();
    ctx.beginPath();
    ctx.moveTo(weight.position.getX(), weight.position.getY());
    ctx.lineTo(springPoint.getX(), springPoint.getY());
    ctx.stroke();
    requestAnimationFrame(update);
  };
  update();
};

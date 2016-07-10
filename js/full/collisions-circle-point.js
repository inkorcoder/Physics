window.onload = function() {
  var canvas, circle, ctx, height, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
  circle = {
    x: Math.random() * width,
    y: Math.random() * height,
    radius: 50 + Math.random() * 100
  };
  document.body.addEventListener("mousemove", function(event) {
    if (utils.circlePointCollision(event.clientX, event.clientY, circle)) {
      ctx.fillStyle = "#f66";
    } else {
      ctx.fillStyle = "#999";
    }
    ctx.clearRect(0, 0, width, height);
    ctx.beginPath();
    ctx.arc(circle.x, circle.y, circle.radius, 0, Math.PI * 2, false);
    ctx.fill();
  });
};

window.onload = function() {
  var canvas, ctx, height, rect0, rect1, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
  rect0 = {
    x: 300,
    y: 200,
    width: 200,
    height: 100
  };
  rect1 = {
    x: 0,
    y: 0,
    width: 100,
    height: 200
  };
  document.body.addEventListener("mousemove", function(event) {
    rect1.x = event.clientX - 50;
    rect1.y = event.clientY - 100;
    if (utils.rectIntersect(rect0, rect1)) {
      ctx.fillStyle = "#f66";
    } else {
      ctx.fillStyle = "#999";
    }
    ctx.clearRect(0, 0, width, height);
    ctx.beginPath();
    ctx.fillRect(rect0.x, rect0.y, rect0.width, rect0.height);
    ctx.fillRect(rect1.x, rect1.y, rect1.width, rect1.height);
    ctx.fill();
  });
};

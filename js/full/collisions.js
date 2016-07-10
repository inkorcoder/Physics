window.onload = function() {
  var canvas, ctx, height, update, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  width = canvas.width = window.innerWidth;
  height = canvas.height = window.innerHeight;
  update = function() {
    ctx.clearRect(0, 0, width, height);
    requestAnimationFrame(update);
  };
  update();
};

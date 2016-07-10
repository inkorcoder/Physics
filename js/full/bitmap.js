window.onload = function() {
  var canvas, ctx, height, p, resetParticle, targetCanvas, targetCtx, update, width;
  canvas = document.getElementById('canvas');
  ctx = canvas.getContext('2d');
  targetCanvas = document.getElementById('target');
  targetCtx = targetCanvas.getContext('2d');
  width = canvas.width = targetCanvas.width = window.innerWidth;
  height = canvas.height = targetCanvas.height = window.innerHeight;
  p = particle.create(0, height / 2, 20, 0);
  targetCtx.beginPath();
  targetCtx.arc(width / 2 - 100, height / 2, 250, 0, Math.PI * 2, false);
  targetCtx.fill();
  resetParticle = function() {
    p.x = 0;
    p.y = height / 2;
    return p.setHeading(utils.randomRange(-0.2, 0.2));
  };
  update = function() {
    var imageData;
    ctx.clearRect(0, 0, width, height);
    p.update();
    ctx.beginPath();
    ctx.arc(p.x, p.y, 4, 0, Math.PI * 2, false);
    ctx.fill();
    imageData = targetCtx.getImageData(p.x, p.y, 1, 1);
    if (imageData.data[3] > 0) {
      targetCtx.globalCompositeOperation = "destination-out";
      targetCtx.beginPath();
      targetCtx.arc(p.x, p.y, 40, Math.PI * 2, false);
      targetCtx.fill();
      resetParticle();
    } else if (p.x > width) {
      resetParticle();
    }
    requestAnimationFrame(update);
  };
  update();
};

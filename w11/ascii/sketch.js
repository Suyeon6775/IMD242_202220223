let gradientText = ' .:-=+*#%@';
let canvasSize = [640, 480];
let scale = [0.1];
let captureSize = [canvasSize[0] * scale, canvasSize[1] * scale];
let tileWidth = canvasSize[0] / canvasSize[0];

let capture;

function setup() {
  createCanvas(canvasSize[0], canvasSize[1]);
  capture = createCapture(VIDEO, { flipped: true });
  capture.size(captureSize[0], captureSize[1]);
  capture.hide(); //아래 작게 있던 비디오 사라지게함.
}

function draw() {
  background(0);
  fill(255);
  textSize(10);
  textAlign(CENTER, CENTER);
  // text(gradiantText.charAt(3), 20, 20);
  capture.loadPixels();
  //이거 해줘야 매 프레임마다 로드댐. 이걸 안 하면 구 픽셀 데이터만 남아있고 업데이트가 안됨.
  for (let idx = 0; idx < capture.pixels.length / 4; idx++) {
    let r = capture.pixels[4 * idx + 0];
    let g = capture.pixels[4 * idx + 1];
    let b = capture.pixels[4 * idx + 2];
    let a = capture.pixels[4 * idx + 3];
    let bright = brightness([r, g, b]);
    let gradientIdx = map(bright, 0, 255, 0, gradientText.length - 1);
    gradientIdx = floor(gradientIdx); //이렇게 하면 정수화 됨.
    let asciiText = gradientText.charAt(gradientIdx);
    let column = idx % captureSize[0];
    let row = floor(idx / captureSize[0]); //정수화
    let x = column * tileWidth + tileWidth * 0.5;
    let y = row * tileWidth + tileWidth * 0.5;
    text(asciiText, x, y);
  }
}

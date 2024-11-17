let capture;

function setup() {
  createCanvas(400, 400);
  capture = createCapture(VIDEO);
  //광역변수와 지역변수. 여기서 let으로 변수 만들면 draw에서 못씀.
  console.log(capture);
  capture.size(200, 200);
  capture.hide();
}

function draw() {
  background(220);
  image(capture, 0, 0, width, height);
}

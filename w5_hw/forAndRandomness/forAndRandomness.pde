int tileNum;
float noiseMult = 0.001;

void setup() {
  size(800, 800);

}

void draw() {
  background(0);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  noiseMult = pow(10, map(mouseY, 0, height, 1, -10));
  float tileSize = width / float(tileNum);
  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * .5;
      float centerY = rectY + tileSize * .5;
      float noiseVal = noise((col + row) * 0.1, mouseY * 0.01);

      noFill();
      stroke(255);
      circle(centerX, centerY, tileSize);
      pushMatrix();
      translate(centerX, centerY);
      stroke(255);
      rotate(radians(270 +(180 * noiseVal)));
      line(0, 0, tileSize * .8 *.5, 0);
      //
      float circleX = tileSize * .8 *.5;
      float circleY = 0;
      fill(255);
      noStroke();
      circle(circleX, circleY, tileSize * .2);
      popMatrix();
    }
  }
}

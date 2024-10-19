int randomSeed = int(random(100000000));
color[] wallColors = {#FF0000, #FFFF00, #0000FF};
color[] roofColors = {#000000, #FF0000};
color[] doorColors = {#000000, #FFFFFF};
color[] windowColors = {#FFFFFF, #0000FF};

void setup() {
  size(800, 800);
}

void mousePressed() {
  randomSeed = int(random(100000000));
  println(randomSeed);
}
void draw() {
  randomSeed(randomSeed);
  background(255);

  for (int n = 0; n < 5; n++) {
    float x = random(width * .1, width * .8);
    float homeW = random(100, 200);
    float homeH = random(100, 300);

    home(x, height - 50, homeW, homeH);
    drawGround();
  }
}

void drawGround() {
  fill(150);
  rect(0, height - 50, width, 50);
}

void home(float x, float y, float w, float h) {
  fill(wallColors[int(random(3))]);
  rect(x, y - h, w, h);

  fill(roofColors[int(random(2))]);
  triangle(x, y - h, x + w / 2, y - h - random(30, 50), x + w, y - h);

  float doorW = w / random(4, 6);
  float doorH = h / random(3, 4);
  fill(doorColors[int(random(2))]);
  rect(x + w / 2 - doorW / 2, y - doorH, doorW, doorH);

  int windowCount = int(random(1, 3));
  for (int n = 0; n < windowCount; n++) {
    float winW = w / random(5, 7);
    float winH = h / random(6, 7);
    float winX = random(x + winW, x + w - winW);
    float winY = random(y - h + winH * 2, y - h + h / 2);
    fill(windowColors[int(random(2))]);
    rect(winX, winY, winW, winH);
  }
}

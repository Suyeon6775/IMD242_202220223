color startColor, endColor;
float colorTransition;

void setup() {
  size(640, 640);
  rectMode(CENTER);
  noStroke();
  
  startColor = color(255, 0, 0);
  endColor = color(0, 0, 255);
  colorTransition = 0;
}

void draw() {
  background(0);

  colorTransition += 0.01;
  if (colorTransition > 1) {
    colorTransition = 0;
    
    startColor = endColor;
    endColor = color(random(255), random(255), random(255));
  }

  color currentColor = lerpColor(startColor, endColor, colorTransition);
  fill(currentColor);

  float cellWidth = width / 2.0;
  float cellHeight = height / 2.0;

  if (mouseX < cellWidth && mouseY < cellHeight) {
    square(cellWidth / 2, cellHeight / 2, 100);
  } else {
    circle(cellWidth / 2, cellHeight / 2, 100);
  }


  if (mouseX >= cellWidth && mouseY < cellHeight) {
    triangle(cellWidth * 1.5 - 50, cellHeight / 2 + 50, cellWidth * 1.5, cellHeight / 2 - 50, cellWidth * 1.5 + 50, cellHeight / 2 + 50);
  } else {
    square(cellWidth * 1.5, cellHeight / 2, 100);
  }


  if (mouseX < cellWidth && mouseY >= cellHeight) {
    line(cellWidth / 2 - 50, cellHeight * 1.5 - 50, cellWidth / 2 + 50, cellHeight * 1.5 + 50);
  } else {
    triangle(cellWidth / 2 - 50, cellHeight * 1.5 + 50, cellWidth / 2, cellHeight * 1.5 - 50, cellWidth / 2 + 50, cellHeight * 1.5 + 50);
  }

  
  if (mouseX >= cellWidth && mouseY >= cellHeight) {
    circle(cellWidth * 1.5, cellHeight * 1.5, 100); 
  } else {
    line(cellWidth * 1.5 - 50, cellHeight * 1.5 - 50, cellWidth * 1.5 + 50, cellHeight * 1.5 + 50);
  }


  stroke(127);
  strokeWeight(4);
  line(cellWidth, 0, cellWidth, height);
  line(0, cellHeight, width, cellHeight);
}

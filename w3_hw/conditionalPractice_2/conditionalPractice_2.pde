void setup() {
  size(620, 360);
}

void draw() {
  background(0);
  stroke(255);
  fill(#FF4400);
  rectMode(CENTER);

  if (mouseY < 90 ) {
    line(250, 10, 350, 80);
  } else if (mouseY < 180) {
    square(300, 135, 70);
  } else if (mouseY < 270) {
    rect(300, 225, 150, 35, 5);
  } else {
    circle(300, 315, 70);
  }

  stroke(127);
  strokeWeight(3);
 
  line(0,90,width,90);
  line(0,180,width,180);
  line(0,270,width,270);
   line(0,360,width,360);
}

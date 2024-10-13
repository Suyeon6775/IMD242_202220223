float secondR;
float minutesR;
float hoursR;
float radius;

void setup() {
  size(800, 800);
  background(0);

  radius = min(width, height) / 12;
  secondR = radius * 2.2;
  minutesR = radius * 2.5;
  hoursR = radius * 1.8;
}

void draw() {
  background(0);
  noFill();
  
  //맨바깥
  stroke(255, 255, 0);
  strokeWeight(5);
  ellipse(width / 2, height / 2, 480, 680);
  //중간원
  stroke(255);
  strokeWeight(4);
  ellipse(width / 2, height / 2, 400, 600);

  //안쪽원
  stroke(255, 255, 0);
  strokeWeight(1.8);
  ellipse(width / 2, height / 2, 380, 580);
  //
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12 + norm(minute(), 0, 60), 0, 12, 0, TWO_PI) - HALF_PI;

  //초
  stroke(255, 0, 0);
  strokeWeight(2);
  line(width / 2, height / 2, width / 2 + cos(s) * secondR, height / 2 + sin(s) * secondR);

  //분
  stroke(255);
  strokeWeight(3);
  line(width / 2, height / 2, width / 2 + cos(m) * minutesR, height / 2 + sin(m) * minutesR);

  //시
  stroke(255);
  strokeWeight(4.5);
  line(width / 2, height / 2, width / 2 + cos(h) * hoursR, height / 2 + sin(h) * hoursR);
  
  //가운데원
  noStroke();
  fill(255, 255, 0);
  ellipse(width / 2, height / 2, 20, 30);
  
  stroke(255);
  strokeWeight(2);

  float a = 200;
  float b = 300;

  for (int i = 0; i < 60; i++) {
    float angle = TWO_PI * i / 60;

    float oX = width / 2 + cos(angle) * a;
    float oY = height / 2 + sin(angle) * b;

    float iX, iY;
    if (i % 5 == 0) {

      iX = width / 2 + cos(angle) * (a - 40);
      iY = height / 2 + sin(angle) * (b - 40);
      strokeWeight(4);
    } else {

      iX = width / 2 + cos(angle) * (a - 15);
      iY = height / 2 + sin(angle) * (b - 15);
      strokeWeight(2);
    }

    line(iX, iY, oX, oY);
  }
}

ㅋboolean brushing = false;

void setup() {
  size(600, 400);
  noStroke();
}

void draw() {
  background(#FFEE0A);

  fill(#479F6F);
  ellipse(300, 200, 200, 200);

  // 눈
  fill(255);
  ellipse(250, 155, 40, 50);  
  ellipse(350, 155, 40, 50);

  fill(0);
  ellipse(250, 155, 20, 20);
  ellipse(350, 155, 20, 20); 

  // 눈썹
  fill(255);
  rect(235, 145, 30, 5); 
  rect(335, 145, 30, 5);
  
  //볼
  fill(#FF0000, 100);
  ellipse(230, 200, 40, 10);
  ellipse(370, 200, 40, 10);
  
  // 입
  fill(#E23B95);
  if (brushing) {
    arc(300, 233, 100, 66, 0, PI, CHORD);
  } else {
    arc(300, 233, 100, 33, 0, PI, CHORD); 
  }
  
  //이
  fill(255);
  rect(290, 233, 10, 10); 
  rect(300, 233, 10, 10);

  // 개구리 손
  drawFrogHand(mouseX, mouseY); 

  // 칫솔
  drawToothbrush(mouseX, mouseY);
}

void drawFrogHand(int x, int y) {
  fill(#479F6F);
  
  // 손바닥
  ellipse(x + 40, y + 10, 40, 30);

  // 손가락
  ellipse(x + 15, y - 5, 15, 15);
  ellipse(x + 35, y - 10, 15, 15);
  ellipse(x + 55, y - 5, 15, 15);

  fill(255);
  ellipse(x + 15, y - 5, 5, 5);
  ellipse(x + 35, y - 10, 5, 5);
  ellipse(x + 55, y - 5, 5, 5);
}

void drawToothbrush(int x, int y) {
  fill(#0011FF);
  rect(x - 30, y-5, 70, 10, 5); 

  fill(255);
  rect(x - 25, y - 15, 20, 10, 3); 
}

void mousePressed() {
  brushing = true; 
}

void mouseReleased() {
  brushing = false; 
}

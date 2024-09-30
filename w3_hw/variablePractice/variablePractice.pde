ArrayList<Spiral> spirals = new ArrayList<Spiral>();

void setup() {
  size(850, 600);
  background(0);
}

void draw() {
  background(0);
  for (Spiral spiral : spirals) {
    spiral.update();
    spiral.display();
  }
}

void mousePressed() {
  spirals.add(new Spiral(mouseX, mouseY));
}

class Spiral {
  float x;
  float y;
  float angle = 0;
  float radius = 0;
  color c = color(random(255), random(255), random(255), 150);

  Spiral(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    angle += 0.05;
    radius += 1;
    
    //만약에 벽 닿으면
    if (x + radius > width || x - radius < 0 || y + radius > height || y - radius < 0) {

      
      c = color((red(c) + 2) % 256, (green(c) + 2) % 256, (blue(c) + 2) % 256, 150);

      x = constrain(x, radius, width - radius);
      y = constrain(y, radius, height - radius);
    }
  }

  void display() {
    noFill();
    stroke(c);
    strokeWeight(2);
    beginShape();
    for (int i = 0; i < 100; i++) {
      float theta = angle + i * 0.06;
      float xOffset = cos(theta) * radius;
      float yOffset = sin(theta) * radius;
      vertex(x + xOffset, y + yOffset);
    }

    endShape();
  }
}

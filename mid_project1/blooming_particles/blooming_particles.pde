ArrayList<Particle> particles;
float centerX, centerY; 
float spreadRate = 0.1;

void setup() {
  fullScreen(); 
  particles = new ArrayList<Particle>();

  centerX = width / 2;
  centerY = height / 2;

  for (int i = 0; i < 300; i++) {
    particles.add(new Particle(random(TWO_PI), random(1, 5), random(100, 400))); 
  }
}

void draw() {
  background(0);
  translate(centerX, centerY);

  for (Particle p : particles) {
    p.update();
    p.display();
  }


  if (particles.size() > 2000) {
    for (int i = 0; i < 100; i++) {
      particles.remove(0);
    }
  }


  resetMatrix(); 
  ParticleCount();
}

void mousePressed() {
  for (int i = 0; i < 50; i++) {
    particles.add(new Particle(random(TWO_PI), random(1, 5), random(100, 400)));
  }
}

void mouseDragged() {
  for (int i = 0; i < 10; i++) { 
    particles.add(new Particle(random(TWO_PI), random(1, 5), random(100, 400)));
  }
}

class Particle {
  float angle; 
  float speed; 
  float maxRadius; 
  float radius; 
  color col; 
  float thickness;   

  Particle(float angle, float speed, float maxRadius) {
    this.angle = angle;
    this.speed = speed;
    this.maxRadius = maxRadius;
    this.radius = random(10);

    float yellowBase = random(150, 255);
    this.col = color(yellowBase, yellowBase, random(0, 100), 200);

    this.thickness = random(1, 3);
  }
  
  void update() {
    if (radius < maxRadius) {
      radius += speed * spreadRate;
    }

    // 이 부분은 ChatGPT의 도움을 받아 작성되었습니다.
    // 질문 의도: 입자가 단순히 확산하는 것 외에도 자연스러운 움직임을 추가하고 싶었음.
    // 목적: 각 입자의 회전이 부드럽게 변화하며, 움직임이 동적이고 유기적으로 보이도록 구현.
    angle += 0.002 * sin(frameCount * 0.01);
  }

  void display() {
    
    // 이 부분은 ChatGPT의 도움을 받아 작성되었습니다.
    // 질문 의도: 입자가 화면 중심을 기준으로 회전하며, 각 입자의 각도에 따라 동적으로 움직이도록 구현하려면 어떻게 해야 하는지 알고 싶었음.
    // 목적: 입자별 회전을 표현하기 위해 각도를 기준으로 회전 변환을 적용하고, 선 길이를 기준으로 궤적을 표현.
    //AI 도움의 이유: 회전과 선의 좌표 계산을 조합하여 자연스럽게 표현하는 구현 방식을 찾기 위해.

    pushMatrix();
    rotate(angle);
    stroke(col);
    strokeWeight(thickness);
    line(radius, 0, radius + 10, 0);
    popMatrix();
  }
}


void ParticleCount() {
  fill(255);               
  textSize(20);        
  textAlign(LEFT, TOP);
  text("Particles: " + particles.size(), 100, 100); 
}

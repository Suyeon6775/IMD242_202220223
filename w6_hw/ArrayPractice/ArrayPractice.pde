int[] fruitAmts;
String[] fruitNames = {"mango", "strawberry", "kiwi", "plum", "blueberry"};
color[] colorSt;

void setup() {
  size(960, 720);
  fruitAmts = new int[fruitNames.length];
  colorSt = new color[]{color(5, 79, 240), color(249, 248, 243), color(0, 251, 255), color(225, 210, 243), color(220, 252, 115)
  };

  for (int n = 0; n < fruitAmts.length; n++) {
    fruitAmts[n] = int(random(50, 100));
  }
}

float barWidth = 100;

void draw() {
  background(0);
  strokeWeight(barWidth);

  float totalfruit = 0;
  float barGap = width / (fruitNames.length + 1);
  float x = barGap;

  for (int n = 0; n < fruitNames.length; n++) {
    stroke(colorSt[n]);
    strokeCap(SQUARE);
    textAlign(CENTER);
    textSize(30);
    fill(colorSt[n]);
    line(x + barGap * n, height * 0.5, x + barGap * n, height * 0.5 - 2 * fruitAmts[n]);
    text(fruitNames[n], x + barGap * n, height * 0.5 + 50);
    text(fruitAmts[n], x + barGap * n, height * 0.5 - 2 * fruitAmts[n] - 20);
    totalfruit += fruitAmts[n];
    //
  }

  float average = totalfruit / fruitAmts.length;

  fill(255);
  textSize(20);
  text("Average = " + average, width * .5, height/2 + 190);
  textSize(40);
  stroke(20);
  text("TOTAL " + totalfruit, width * .5, height * .6 + 170 );
}

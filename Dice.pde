class Die {
  int x, y, value;

  Die(int x, int y) {
    this.x = x;
    this.y = y;
    this.value = (int) (Math.random() * 6) + 1;
  }

  void roll() {
    this.value = (int) (Math.random() * 6) + 1;
  }

  void one() {
    point(this.x, this.y);
  }

  void two() {
    point(this.x - 20, this.y - 20);
    point(this.x + 20, this.y + 20);
  }

  void three() {
    this.one();
    this.two();
  }

  void four() {
    this.two();
    point(this.x - 20, this.y + 20);
    point(this.x + 20, this.y -20);
  }

  void five() {
    this.one();
    this.four();
  }

  void six() {
    this.four();
    point(this.x + 20, this.y);
    point(this.x - 20, this.y);
  }

  void show() {
    fill(255);
    noStroke();
    rect(this.x, this.y, 75, 75, 10);
    stroke(0);
    switch(this.value) {
    case 1:
      this.one();
      break;
    case 2:
      this.two();
      break;
    case 3:
      this.three();
      break;
    case 4:
      this.four();
      break;
    case 5:
      this.five();
      break;
    case 6:
      this.six();
      break;
    }
  }
}

void setup() {
  rectMode(CENTER);
  strokeWeight(10);
  size(800, 800);
  frameRate(2);
}

Die die = new Die(400, 400);

void draw() {
  die.show();
  die.roll();
}

void mousePressed() {
  die.roll();
}

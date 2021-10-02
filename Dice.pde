class Value {

  void one() {
    ellipse(0, 0, 15, 15);
  }

  void two() {
    ellipse(25, 25, 15, 15);
    ellipse(-25, -25, 15, 15);
  }

  void three() {
    this.one();
    this.two();
  }

  void four() {
    this.two();
    ellipse(-25, 25, 15, 15);
    ellipse(25, -25, 15, 15);
  }

  void five() {
    this.one();
    this.four();
  }

  void six() {
    this.four();
    ellipse(25, 0, 15, 15);
    ellipse(-25, 0, 15, 15);
  }
}

class Die {
  int x, y, z;
  float rotX = 0, rotY = 0, rotZ = 0;

  Die(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void front() {
    pushMatrix();
    translate(0, 0, 51);
    value.one();
    popMatrix();
  }

  void back() {
    pushMatrix();
    translate(0, 0, -51);
    value.three();
    popMatrix();
  }

  void left() {
    pushMatrix();
    translate(-51, 0, 0);
    rotateY(-PI/2);
    value.two();
    popMatrix();
  }

  void right() {
    pushMatrix();
    translate(51, 0, 0);
    rotateY(PI/2);
    value.four();
    popMatrix();
  }

  void top() {
    pushMatrix();
    translate(0, -51, 0);
    rotateX(PI/2);
    value.six();
    popMatrix();
  }

  void bottom() {
    pushMatrix();
    translate(0, 51, 0);
    rotateX(PI/2);
    value.five();
    popMatrix();
  }

  void render() {
    fill(255);
    box(this.x, this.y, this.z);
    fill(0);
    front();
    back();
    left();
    right();
    top();
    bottom();
  }

  void rotate() {
    rotX += 0.05f * PI;
    rotY += 0.012 * PI;
    rotZ += 0.05f * PI;
    rotateY(this.rotY);
    rotateX(this.rotX);
    rotateZ(this.rotZ);
  }
}

Value value = new Value();
Die[][] dice = new Die[3][3];

void setup() {
  size(800, 800, P3D);
  background(50);
  noStroke();
  frameRate(20);
  strokeWeight(20);
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      dice[i][j] = new Die(100, 100, 100);
    }
  }
}

void draw() {
  lights();
  background(50);
  for (int i = 0; i < 3; i++) {
    translate(0, 100, 0);
    for (int j = 0; j < 3; j++) {
      pushMatrix();
      translate(200 + i * 200, 0, 0);
      dice[i][j].rotate();
      dice[i][j].render();
      popMatrix();
    }
  }
  translate(-300, 0, 0);
}

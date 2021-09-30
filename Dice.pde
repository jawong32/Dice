void setup() {
  size(800, 800, P3D);
  background(255, 0, 0);
  noStroke();
  frameRate(20);
  strokeWeight(20);
}

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
  }

  void five() {
  }

  void six() {
  }
}

Value value = new Value();

class Die {
  int x, y, z;
  float rotation = 0;

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
    value.two();
    popMatrix();
  }

  void top() {
  }

  void bottom() {
  }

  void render() {
    fill(255);
    box(this.x, this.y, this.z);
    fill(0);
    front();
    right();
    left();
    back();
  }

  void rotate() {
    rotation += 0.05f;
    rotateY(this.rotation);
    rotateX(this.rotation);
    rotateZ(this.rotation);
  }
}

Die die = new Die(100, 100, 100);

void draw() {
  lights();
  background(255, 0, 0);
  translate(400, 400, 0);
  die.rotate();
  die.render();
}

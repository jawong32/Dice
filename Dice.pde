import java.util.*;

class Value {
  int[] sides = {1, 2, 3, 4, 5, 6};

  Value() {
    for (int i = 0; i < 6; i++) {
      int temp = this.sides[i];
      int index = (int) (Math.random() * 6);
      this.sides[i] = this.sides[index];
      this.sides[index] = temp;
    }
  }

  void random(int index) {
    switch (this.sides[index]) {
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
    default:
      this.six();
    }
  }

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
  int x, y, z, fr, ba, le, ri, to, bo;
  float rotX = 0, rotY = 0, rotZ = 0;
  double incX, incY, incZ;
  Value value = new Value();

  Die(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;

    this.incX = Math.random() * 0.075;
    this.incY = Math.random() * 0.075;
    this.incZ = Math.random() * 0.05;

    this.fr = this.value.sides[0];
    this.ba = this.value.sides[1];
    this.le = this.value.sides[2];
    this.ri = this.value.sides[3];
    this.to = this.value.sides[4];
    this.bo = this.value.sides[5];
  }

  void front() {
    pushMatrix();
    translate(0, 0, 51);
    value.random(0);
    popMatrix();
  }

  void back() {
    pushMatrix();
    translate(0, 0, -51);
    value.random(1);
    popMatrix();
  }

  void left() {
    pushMatrix();
    translate(-51, 0, 0);
    rotateY(-PI/2);
    value.random(2);
    popMatrix();
  }

  void right() {
    pushMatrix();
    translate(51, 0, 0);
    rotateY(PI/2);
    value.random(3);
    popMatrix();
  }

  void top() {
    pushMatrix();
    translate(0, -51, 0);
    rotateX(PI/2);
    value.random(4);
    popMatrix();
  }

  void bottom() {
    pushMatrix();
    translate(0, 51, 0);
    rotateX(PI/2);
    value.random(5);
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
    rotX += this.incX * PI;
    rotY += this.incY * PI;
    rotZ += this.incZ * PI;
    rotateY(this.rotY);
    rotateX(this.rotX);
    rotateZ(this.rotZ);
  }
}

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

void render() {
  for (int i = 0; i < 3; i++) {
    translate(0, 200, 0);
    for (int j = 0; j < 3; j++) {
      pushMatrix();
      translate(200 + j * 200, 0, 0);
      dice[i][j].rotate();
      dice[i][j].render();
      popMatrix();
    }
  }
}

void draw() {
  lights();
  background(0);
  render();
}

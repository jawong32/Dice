import java.util.*;

class Value {
  Integer[] sides = new Integer[] {1, 2, 3, 4, 5, 6};

  Value() {
    //Collections.shuffle(Arrays.asList(this.sides));
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
  int x, y, z;
  float rotX = 0, rotY = 0, rotZ = 0;
  Value value = new Value();

  Die(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
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
    rotX += 0.05f * PI;
    rotY += 0.012 * PI;
    rotZ += 0.05f * PI;
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
  background(50);
  render();
}

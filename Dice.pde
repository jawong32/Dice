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
  int x, y, z;
  int fr, ba, le, ri, to, bo;
  float rotX = 0, rotY = 0;
  double incX, incY;
  Value value = new Value();

  Die(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;

    this.incX = Math.random() * 0.075;
    this.incY = Math.random() * 0.075;

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

  void calculateSide() {
    int[][] sides = {
      {this.fr, this.le, this.ba, this.ri},
      {this.bo, this.bo, this.bo, this.bo},
      {this.ba, this.ri, this.fr, this.le},
      {this.to, this.to, this.to, this.to}

    };
    int i = 0, j = 0;
    double totalRotX = this.rotX % (2 * PI);
    double totalRotY = this.rotY % (2 * PI);
    
    if (totalRotX < 0.25 * PI || totalRotX > 1.75 * PI) i = 0;
    else if (totalRotX < 0.75 * PI) i = 1;
    else if (totalRotX < 1.25 * PI) i = 2;
    else if (totalRotX < 1.75 * PI) i = 3;
    
    if (totalRotY < 0.25 * PI || totalRotY > 1.75 * PI) j = 0;
    else if (totalRotY < 0.75 * PI) j = 1;
    else if (totalRotY < 1.25 * PI) j = 2;
    else if (totalRotY < 1.75 * PI) j = 3;
    
    counter += sides[i][j];
  }

  void render() {
    fill(255);
    box(this.x, this.y, this.z);
    fill(0);
    this.front();
    this.back();
    this.left();
    this.right();
    this.top();
    this.bottom();
    this.calculateSide();
  }

  void rotate() {
    this.rotX += this.incX * PI;
    this.rotY += this.incY * PI;

    rotateX(this.rotX);
    rotateY(this.rotY);
  }
}

Die[][] dice = new Die[3][3];
int counter = 0;

void setup() {
  size(800, 800, P3D);
  background(50);
  noStroke();
  textAlign(CENTER);
  textSize(30);
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
  fill(255);
  //text(String.format("Current Value: %d", counter), 400, 150);
  text("Current Value: ".concat((String) counter), 400, 150);
  counter = 0;
}

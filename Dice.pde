void setup() {
  size(800, 800, P3D);
  background(0);
  noStroke();
  frameRate(20);
  strokeWeight(20);
}

class Die {
  int x, y, z;
  float rotation = 0;

  Die(int x, int y, int z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
 
  void one() {
    pushMatrix();
    translate(0, 0, 51);
    circle(0, 0, 20);
    popMatrix();
  }
  
  void two() {
    pushMatrix();
    rotateY(0.5);
    translate(51, 0, 0);
    fill(255, 0, 0);
    circle(0, 0, 20);
    popMatrix();
  }

  void render() {
    fill(255);
    box(this.x, this.y, this.z);
    fill(0);
    one();
    two();
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
  background(0);
  translate(400, 400, 0);
  die.rotate();
  //rotateY(-1.25);
  die.render();
}

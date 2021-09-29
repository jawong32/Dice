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

  void render() {
    noStroke();
    box(this.x, this.y, this.z);
    stroke(255, 0, 100); 
    point(0, 0, 100);
  }

  void rotate() {
    rotation += 0.05f;
  }
}

Die die = new Die(100, 100, 100);

void draw() {
  lights();
  background(0);
  stroke(255, 0, 0);
  translate(400, 400, 0);
  die.rotate();
  rotateY(0.5);
  rotateY(die.rotation);
  rotateX(die.rotation);
  rotateZ(die.rotation);
  die.render();
}

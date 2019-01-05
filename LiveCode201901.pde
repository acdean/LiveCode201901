Square square;

void setup() {
  size(1000, 1000, P3D);
}

void draw() {
  background(0);
  square.draw();
}

class Square {
  float x, y, z;
  color c;
  
  Square() {
    x = random(100);
    y = random(100);
  }
  
  void draw() {
    pushMatrix();
    beginShape();
    vertex(-10, -10);
    vertex(-10, 10);
    vertex(10, 10);
    vertex(10, -10);
    endShape();
    popMatrix();
  }
}
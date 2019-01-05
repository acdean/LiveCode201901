import peasy.*;

Square square;
PeasyCam cam;

void setup() {
  size(1000, 1000, P3D);
  square = new Square();
  cam = new PeasyCam(this, 100);
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
    c = color((int)random(192, 256), (int)random(192, 256), (int)random(192, 256));
  }
  
  void draw() {
    pushMatrix();
    fill(c);
    beginShape();
    vertex(-10, -10);
    vertex(-10, 10);
    vertex(10, 10);
    vertex(10, -10);
    endShape();
    popMatrix();
  }
}
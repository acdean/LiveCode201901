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

static float MAX_SPEED = .02;
class Square {
  float x, y, z;
  color c;
  float rx, ry, rz;
  
  Square() {
    x = random(100);
    y = random(100);
    c = color((int)random(192, 256), (int)random(192, 256), (int)random(192, 256));
    rx = random(TWO_PI);
    ry = random(TWO_PI);
    rz = random(TWO_PI);
    dx = random(-MAX_SPEED, MAX_SPEED);
    dy = random(-MAX_SPEED, MAX_SPEED);
    dz = random(-MAX_SPEED, MAX_SPEED);
  }
  
  void draw() {
    pushMatrix();
    fill(c);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    beginShape();
    vertex(-10, -10);
    vertex(-10, 10);
    vertex(10, 10);
    vertex(10, -10);
    endShape();
    popMatrix();
  }
}
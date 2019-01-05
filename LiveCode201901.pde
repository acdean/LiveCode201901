import peasy.*;

int COUNT = 20;
ArrayList<Square> squares = new ArrayList<Square>();
PeasyCam cam;

void setup() {
  size(1000, 1000, P3D);
  for (int i = 0 ; i < COUNT ; i++) {
    squares.add(new Square());
  }
  cam = new PeasyCam(this, 100);
}

void draw() {
  background(0);
  for (Square square : squares) {
    square.draw();
  }
}

static float MAX_SPEED = .02;
static float SIZE = 20;

class Square {
  float x, y, z;
  color c;
  float rx, ry, rz;
  float dx, dy, dz;
  
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
    rx += dx;
    ry += dy;
    rz += dz;
    pushMatrix();
    noStroke();
    fill(c);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    beginShape();
    vertex(-SIZE, -SIZE);
    vertex(-SIZE, SIZE);
    vertex(SIZE, SIZE);
    vertex(SIZE, -SIZE);
    endShape();
    popMatrix();
  }
}
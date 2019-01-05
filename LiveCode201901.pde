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
  float rot = 0;
  
  Square() {
    rot = random(TWO_PI);
    z = -400 + random(300);;
    c = color((int)random(64, 256), (int)random(64, 256), (int)random(64, 256));
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
    rot += .02;
    x = 100 * cos(rot);
    y = 100 * sin(rot);

    pushMatrix();
    noStroke();
    fill(c);
    translate(x, y, z);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    beginShape();
    vertex(-SIZE, -SIZE, 0);
    vertex(-SIZE, SIZE, 0);
    vertex(SIZE, SIZE, 0);
    vertex(SIZE, -SIZE, 0);
    endShape();
    popMatrix();
    z++;
    println(z);
    if (z > 100) {
      z = -400 + random(300);;
    }
  }
}
import peasy.*;
import processing.opengl.*;
import com.jogamp.opengl.*;  // new jogl - 3.0b7

int COUNT = 20;
int SYM = 12;
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
  
  // PJOGL 2.2.1, 30b7
  GL gl = ((PJOGL)beginPGL()).gl.getGL();

  // additive blending
  gl.glEnable(GL.GL_BLEND);
  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);
  gl.glDisable(GL.GL_DEPTH_TEST);
  
  background(0);
  pushMatrix();
  for (Square square : squares) {
    square.move();
  }
  for (float r = 0 ; r < SYM ; r++) {
    for (Square square : squares) {
      square.draw();
    }
    rotateZ(TWO_PI / SYM);
  }
  popMatrix();
}

static float MAX_SPEED = .02;
static float SIZE = 20;

class Square {
  float x, y, z, zd;
  color c;
  float rx, ry, rz;
  float dx, dy, dz;
  float rot = 0, rotd;
  float s;
  
  Square() {
    init();
  }
  
  void init() {
    rot = random(TWO_PI);
    rotd = random(-.03, .03);
    z = -600 + random(300);;
    c = color((int)random(64, 256), (int)random(64, 256), (int)random(64, 256));
    rx = random(TWO_PI);
    ry = random(TWO_PI);
    rz = random(TWO_PI);
    dx = random(-MAX_SPEED, MAX_SPEED);
    dy = random(-MAX_SPEED, MAX_SPEED);
    dz = random(-MAX_SPEED, MAX_SPEED);
    s = random(SIZE / 4, SIZE);
    zd = random(2, 5);
  }
  
  void move() {
    rx += dx;
    ry += dy;
    rz += dz;
    rot += rotd;
    x = 50 * cos(rot);
    y = 50 * sin(rot);
    z += zd;
    //println(z);
    if (z > 100) {
      init();
    }
  }
  
  void draw() {

    pushMatrix();
    noStroke();
    fill(c);
    translate(x, y, z);
    rotateX(rx);
    rotateY(ry);
    rotateZ(rz);
    beginShape();
    vertex(-s, -s, 0);
    vertex(-s, s, 0);
    vertex(s, s, 0);
    vertex(s, -s, 0);
    endShape();
    popMatrix();
  }
}

void keyPressed() {
  saveFrame("frame_####.png");
}

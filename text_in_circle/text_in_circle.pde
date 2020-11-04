final static int ROT13 = 13;
final String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_.!?";
final float r = 300; // radius
final float cw = 30; // circle stroke width 
final float bo = -1; // baseline offset
final float cf = PI*2*r; // circumference
final float sl = cf/characters.length(); // segment length
int posOffset = 0;

PFont cFont;
PFont iFont;
char pressedKey;

void setup() {
  frameRate(12);
  size(800, 800);
  cFont = createFont("Courier", 30, true);
  iFont = createFont("Courier", 16, true);
  textAlign(CENTER);
  smooth();
}

void draw() {
  background(255);
  drawCircleBase();

  float arc = getAPos();
  for (int i = 0; i < characters.length(); i ++ ) {
    char currentChar = characters.charAt(i);
    arc += sl;
    drawChar(currentChar, arc);
    drawPos(i, arc);
  }
}

void keyPressed() {
  
}

void drawCircleBase() {
  translate(width/2, height/2);
  fill(210);
  strokeWeight(cw);

  ellipse(0, 0, r*2 + cw/2, r*2 + cw/2);
}

void drawChar(char currentChar, float arc) {
  textFont(cFont);
  float theta = getTheta(arc);
  pushMatrix();

  translate((r+bo)*cos(theta), (r+bo)*sin(theta)); 
  rotate(theta + PI/2); 

  fill(255);
  text(currentChar, 0, 0);

  popMatrix();
}

void drawPos(int currentPos, float arc) {
  textFont(iFont);
  float theta = getTheta(arc);
  pushMatrix();

  translate((r-cw)*cos(theta), (r-cw)*sin(theta)); 
  rotate(theta + PI/2); 

  fill(128);
  // draws the one-based character position plus an offset for rotation - e.g. ROT13 
  text(((currentPos + posOffset) % characters.length()) + 1, 0, 0);
 
  popMatrix();
}

float getAPos() {
  return cf/4 - sl;
}

float getTheta(float arc) {
  return PI + arc / r;
}

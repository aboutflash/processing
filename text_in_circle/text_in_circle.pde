String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789";
PFont font;
float r = 300; // radius
float cw = 30; // circle stroke width 
float bo = -1; // baseline offset
float cf = PI*2*r; // circumference
float sl = cf/characters.length(); // segment length


void setup() {
  size(800, 800);
  font = createFont("Courier", 30, true);
  textFont(font);
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
  }
}

void drawCircleBase() {
  translate(width/2, height/2);
  fill(210);
  strokeWeight(cw);

  ellipse(0, 0, r*2 + cw/2, r*2 + cw/2);
}

void drawChar(char currentChar, float arc) {
    float theta = getTheta(arc);

    pushMatrix();

    translate((r+bo)*cos(theta), (r+bo)*sin(theta)); 
    rotate(theta + PI/2); 

    fill(255);
    text(currentChar, 0, 0);

    popMatrix();
}

float getAPos() {
  return cf/4 - sl;
}

float getTheta(float arc) {
  return PI + arc / r;
}

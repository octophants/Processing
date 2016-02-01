//Samyukta Madhu
//Creative Computing
//8th April, 2013
//Spiral Universe
 
 
int numberObjects = 360;
float degrees = 360/numberObjects;
float offset = 0;
float distance = 10;
float rotation = 0;
void setup() {
  size(displayWidth, displayHeight);
  noStroke();
}
void draw () {
  background(0);
  smooth();
   
  distance = 10;
  fill(255,100);
if(mousePressed==true){
      fill(random(0,255),random(0,255),random(0,255));
 
    }
 
  for ( int i = 0; i<numberObjects; i++) {
    float xOff = cos(radians(degrees*i+offset))*distance;
    float yOff = sin(radians(degrees*i+offset))*distance;
    pushMatrix();
 
  translate(mouseX, mouseY);//defines new 'zero' coordinate
  rotate(radians(rotation));
  stroke(255);
  line( mouseX, mouseY, random(xOff,yOff), random(xOff,yOff));
  rotation += 1;
  popMatrix();
    distance+= 10;
  }
  offset += .05;
}

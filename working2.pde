//float x;
//float y;
int number = 50;
void setup() {
  size(displayWidth, displayHeight);

  smooth();
}
 
void draw() {
//   background(random(50),random(50),random(50));
 background(0);
   for(int i = 0; i < number; i++){

   float x = random(0,width);
   float y = random(0,height);
   strokeWeight(1);
   stroke(random(255),random(255),random(255),150);
 line (mouseX, mouseY, x, 0);
  line (mouseX, mouseY, 0, y);
  line (mouseX, mouseY, width, y);
 line (mouseX, mouseY, x, height);

   }
  
 
}

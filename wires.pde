//Images

//Pink tentacles
PImage pinktentacle;
int maxPink = 3;
int pinkOne = 0;

//Blue tentacles
PImage bluetentacle;
int maxBlue = 3;
int blueOne = 0;

//Green tentacles
PImage greententacle;
int maxGreen = 3;
int greenOne = 0;

//Yellow tentacles
PImage yellowtentacle;
int maxYellow = 3;
int yellowOne = 0;

//Arrays
PImage[] pinkimages = new PImage[maxPink];
PImage[] blueimages = new PImage[maxBlue];
PImage[] greenimages = new PImage[maxGreen];
PImage[] yellowimages = new PImage[maxYellow];

void setup(){
size(600, 1000);
background(0);
smooth();

//pink for loop
for (int i = 0; i <pinkimages.length; i++){
 pinkimages[i] = loadImage( "images/wire" + i + ".png" ); 
}

//blue for loop
for (int i = 0; i <blueimages.length; i++){
 blueimages[i] = loadImage( "images/bluetentacle" + i + ".png" ); 
}

//green for loop
for (int i = 0; i <greenimages.length; i++){
 greenimages[i] = loadImage( "images/greententacle" + i + ".png" ); 
}

//yellow for loop
for (int i = 0; i <yellowimages.length; i++){
 yellowimages[i] = loadImage( "images/yellowtentacle" + i + ".png" ); 
}


//load images
pinktentacle = loadImage("images/wire.png");
//bluetentacle = loadImage("images/wire2.png");
//greententacle = loadImage("images/greententacle.png");
//yellowtentacle = loadImage("images/yellowtentacle.png");
}

void draw(){
  
 //draw pink tentacles at mouse point
 if(keyPressed) {

    if (key == '1') {
 image (pinktentacle, mouseX, mouseY); 



    }
}

//draw random pink tentacles

 if(keyPressed) {

    if (key == 'a' || key == 'A') {
        rotate(random(-10,10));
 image (pinktentacle, random(0,width), random(0,height)); 

    }
}

//draw blue tentacles at mouse point

if(keyPressed) {

    if (key == '2') {

        fill (0,0,255);
 image (blueimages[blueOne], mouseX, mouseY); 
blueOne = int(random(blueimages.length)); 

    }
}

//draw random blue tentacles

if(keyPressed) {

    if (key == 'b' || key == 'B') {

        rotate(random(-10,10));
 image (bluetentacle, random(0,width), random(0,height));  

    }
}

//draw green tentacles at mouse point

if(keyPressed) {

    if (key == '3') {

 image (greenimages[greenOne], mouseX, mouseY); 
greenOne = int(random(greenimages.length));

    }
}

//draw random green tentacles
if(keyPressed) {

    if (key == 'c' || key == 'C') {
rotate(random(-10,10));
 image (greententacle, random(0,width), random(0,height));   

    }
}

//draw yellow tentacles at mouse point

if(keyPressed) {

    if (key == '4') {

 image (yellowimages[yellowOne], mouseX, mouseY); 
yellowOne = int(random(yellowimages.length));

    }
}

//draw random yellow tentacles

if(keyPressed) {

    if (key == 'd' || key == 'D') {
rotate(random(-10,10));
 image (yellowtentacle, random(0,width), random(0,height));   
    }
}

if(keyPressed) {

    if (key == 's' || key == 'S') {

saveFrame("output-####.png");

    }
}

if(keyPressed) {

    if (key == ' ') {
fill(0);
rect(0,0,width,height);
    }
}



}

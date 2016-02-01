//images

PImage monster;
PImage cannonball;
PImage bg;
PImage gold;
PImage GameState1;
PImage logo;
PImage pressspace1;
PImage chara;
PImage message1;
PImage readytoplay;
PImage defeatedkraken;

//bouncing
int LogoYpos = 0;
int LogoYposSpeed;

int charYpos = 0;
int charYposSpeed;
//Gamestates
int GamePlay= 1;
int Tentaclecount = 10; //controls number of targets on screen
int cannoncount = 10; //controls number of lives
Tentacle []myTentacle;
cannon[]mycannon;

int score, scoreLevel1, mode1, targetWeight, usedcannon;
color targetColor; //color of target shooter aka red
boolean Win, nocannon;
int CurrentFrameCount;
 
void setup() {
  size(1000, 700);
  smooth();
  background(255);
  targetColor = #FF0818;
  targetWeight=2;
  myTentacle = new Tentacle[Tentaclecount];
  for (int i =0; i < Tentaclecount;i++) {
    myTentacle[i] = new Tentacle(random(20, width-20), random(20, height-20), random(1, 3), random(1, 3));
  }
  monster = loadImage("images/aligntentacle.png");
  cannonball = loadImage("images/cannon.png");
  bg = loadImage("images/gamebg.jpg");
  gold = loadImage("images/treasurechest.png");
  GameState1 = loadImage("images/aligngameintrobg.jpg");
  logo = loadImage("images/aligngame_logo.png");
  pressspace1 = loadImage("images/align_pressspace1.png");
  chara = loadImage("images/aligngame_char.png");
  message1 = loadImage("images/aligngame_message1.png");
  readytoplay = loadImage("images/alignreadytoplay.jpg");
  defeatedkraken = loadImage("images/defeatedkraken.png");
}
 
void draw() {
  //Opening
  
  if (GamePlay == 1) {
  image(GameState1,0,0,width,height);
  image(logo, 280, LogoYpos);
  LogoYpos = LogoYpos + LogoYposSpeed;
  if (LogoYpos > 150){
    LogoYposSpeed = -2;
  }
  
  if(LogoYpos < 1){
    LogoYposSpeed = 2;
  }
  
  image(pressspace1,150,580);
}

//Intro

else if(GamePlay == 2){
  image(GameState1,0,0,width,height);
  fill(255,100);
  rect(0,0,width,height);
  image(chara, 0,charYpos);
  charYpos = charYpos + charYposSpeed;
  if (charYpos > 150){
    charYposSpeed = -2;
  }
  
  if(charYpos < 1){
    charYposSpeed = 2;
  }
  
  image(message1,400,50);
  image(pressspace1,150,580);
}

//Instructions
else if(GamePlay == 3){
 image(readytoplay,0,0); 
}
//GamePlay
else if (GamePlay == 4){
  background(bg);
  fill(255,150);
  image(gold, 0, height-140);
  rect(width-50,0,width,height);
  winScore();
  target();
  Win=true;
  mycannon = new cannon[cannoncount- usedcannon];
  for (int i =0; i < cannoncount-usedcannon;i++) {
    mycannon[i] = new cannon(width-50, i*65+0);
  }
  for (int i =0; i < Tentaclecount;i++) {
    if ( !myTentacle[i].hit) {
      myTentacle[i].move();
      myTentacle[i].display();
      Win= false;
    }
  }
  for (int i =0; i < cannoncount- usedcannon;i++) {
    mycannon[i].display();
  }
  if (Win) {
    textAlign(CENTER, CENTER);
    fill(0);
    rect(0, 0, width, height);
    image(defeatedkraken,200,50);
    image(gold,400,400, 200,200);
    fill(#ffffff);
    textSize(30);
    text("YOU DEFEATED THE KRAKEN!", width/2, height/2-50);
    fill(#F5D925);
    text("Your gold is "+score, width/2, height/2);
    
  }
 
}
}

// Press space to change Game States

void keyPressed() {
  if (key == ' '){
 GamePlay++;
  if (GamePlay > 4) {
    GamePlay = 4;
  }
  }
}

void mousePressed() {
  targetColor = #FFD603;
  targetWeight=3;
  for (int i =0; i < Tentaclecount;i++) {
    if (dist(mouseX, mouseY, myTentacle[i].x, myTentacle[i].y)<150 && dist(mouseX, mouseY, myTentacle[i].x, myTentacle[i].y)>100 &&  mouseButton==LEFT && usedcannon>=0 && usedcannon<10 ) {
      scoreLevel1=1;
      mode1++;
//   
  }
}
  if (mouseButton==LEFT && usedcannon>9 ) {
    nocannon=true;
    CurrentFrameCount=frameCount;
  }
  checkHit();
  if (mouseButton == LEFT ) {
    usedcannon++;
    if ( usedcannon>10) {
      cannoncount=usedcannon;
    }
  }
  if (mouseButton == RIGHT && usedcannon>=10) {
    cannoncount=10;
    usedcannon=0;
  }
}
 
 
 
void winScore() {
  score= scoreLevel1*mode1;
  textAlign(LEFT, CENTER);
  textSize(30);
  fill(#F5D925);
  text("Your gold is : "+score, 160, height-30);
  textSize(25);
  fill(255);
  if (frameCount<160) {
    fill(#ffffff);
    text("Press left mouse button to fire. Press right mouse button to reload.", 15, 15);
  }
  if (usedcannon>9) {
    if (frameCount-CurrentFrameCount<160) {
      text("Press right mouse button to reload.", 15, 15);
    }
  }
}
 
void checkHit() {
  for (int i =0; i < Tentaclecount;i++) {
    if (dist(mouseX, mouseY, myTentacle[i].x, myTentacle[i].y)<100 && mouseButton==LEFT && usedcannon>=0 && usedcannon<10 ) {
      myTentacle[i].hit=true;
    }
  }
}
 
void target() {
  pushStyle();
  noCursor();
  noFill();
  strokeWeight(targetWeight);
  stroke(targetColor);
  ellipse(mouseX, mouseY, 30, 30);
  ellipse(mouseX, mouseY, 45, 45);
  ellipse(mouseX, mouseY, 60, 60);
  line(mouseX-60, mouseY, mouseX+60, mouseY);
  line(mouseX, mouseY-60, mouseX, mouseY+60);
  popStyle();
}
 
void mouseReleased() {
  targetColor = #FF0818;
  targetWeight=2;
}
 
class Tentacle {
  float x, y;
  float vX, vY;
  boolean hit;
 
  Tentacle(float temp_x, float temp_y, float temp_vX, float temp_vY) {
    x =temp_x;
    y =temp_y;
    vX=temp_vX;
    vY=temp_vY;
    noStroke();
  }
 
  void move() {
    x+=vX;
    y+=vY;
    if (x>width-20 ) {
      vX*=-1;
      x=width-20;
    } else if (x<20) {
      vX*=-1;
      x=20;
    }
    if (y>height-20 ) {
      vY*=-1;
      y=height-20;
    } else if (y<20) {
      vY*=-1;
      y=20;
    }
  }
 
  void display() {
    
      image(monster, x, y);
  }
}
 
class cannon {
  int x, y;
 
  cannon(int posx, int posy) {
    x = posx;
    y = posy;
  }
 
  void checkShooting() {
  }
 
  void display() {
    fill(#D6D6D6);
    image(cannonball, x, y);
  }
}

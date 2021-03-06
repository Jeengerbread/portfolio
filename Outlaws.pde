/* @pjs preload="saloon.png,outlaw1.png,outlaw2.png,outlaw3.png,horsie.png,gameover.jpg"; */

PImage background, outlaw1, outlaw2, outlaw3, horsie, gameover;

boolean outlaw1Draw = false;
boolean outlaw2Draw = false;
boolean outlaw3Draw = false;
boolean horsieDraw  = false;
boolean gameOver = false;

int score = 0;


void setup() {
  size (1000, 800);
  strokeWeight(0);
  noCursor();
  background = requestImage("saloon.png");
  outlaw1 = requestImage("outlaw1.png");
  outlaw2 = requestImage("outlaw2.png");
  outlaw3 = requestImage("outlaw3.png");
  horsie = requestImage("horsie.png");
  gameover = requestImage("gameover.jpg");
  
}

void draw() {
  background(255);
  image(background, 0, 0, 1000, 800);
  if (timedBoolean1() == false) {
    image(outlaw1, 235, 475, 60, 98.5);
    redraw();
  }
  if (timedBoolean2() == false) {
    image(outlaw2, 700, 495, 88, 98);
    redraw();
  }
  if (timedBoolean3() == false) {
    image(outlaw3, 240, 280, 66, 98);
    redraw();
  }
  if (timedBoolean4() == false) {
    image(horsie, 60, 460, 164, 300);
    redraw();
  }
  
  if (gameOver) {
    image(gameover, 0, 0, 1000, 800);
    redraw();
  }
  fill(255, 0, 0);
  ellipse(mouseX, mouseY, 10, 10);
  
  
  textSize(48);
  fill(214,0,1);
  text("Score:", 750, 50);
  text(score, 920, 50);
  
}

void mousePressed() {
   
   if (mouseX > 235 && mouseX < 295 && mouseY > 475 && mouseY < 573.5 ) {
    //outlaw1 killed
    outlaw1Draw = false;
    score++;
    redraw();
  } 
  if (mouseX > 700 && mouseX < 788 && mouseY > 495 && mouseY < 593 ) {
    //outlaw2 killed
    outlaw2Draw = false;
    score++;
    redraw();
  }
  if (mouseX > 240 && mouseX < 306 && mouseY > 280 && mouseY < 378 ) {
    //outlaw3 killed
    outlaw3Draw = false;
    score++;
    redraw();
  } 
  if (mouseX > 60 && mouseX < 180 && mouseY > 460 && mouseY < 760 ) {
    //horsie killed :(
    horsieDraw = false;
    gameOver = true;
    score = 0;
    redraw();
  }
  if (gameOver) {
    if (mouseX > 380 && mouseX < 620 && mouseY > 430 && mouseY < 500 ){
      gameOver = false;
      redraw();
    }
  }
}

private long lastTrueTimeOutlaw1;
private boolean timedBoolean1() {
        long now= System.currentTimeMillis();
        if(!outlaw1Draw){ 
            lastTrueTimeOutlaw1=now;
            outlaw1Draw = true;
            return true;
        }

        if (lastTrueTimeOutlaw1+3700<now)
            return false;
        
        return true;
}

private long lastTrueTimeOutlaw2;
private boolean timedBoolean2() {
        long now= System.currentTimeMillis();
        if(!outlaw2Draw){ 
            lastTrueTimeOutlaw2=now;
            outlaw2Draw = true;
            return true;
        }

        if (lastTrueTimeOutlaw2+3000<now)
            return false;
        
        return true;
}

private long lastTrueTimeOutlaw3;
private boolean timedBoolean3() {
        long now= System.currentTimeMillis();
        if(!outlaw3Draw){ 
            lastTrueTimeOutlaw3=now;
            outlaw3Draw = true;
            return true;
        }

        if (lastTrueTimeOutlaw3+5400<now)
            return false;
        
        return true;
}

private long lastTrueTimeHorsie;
private boolean timedBoolean4() {
        long now= System.currentTimeMillis();
        if(!horsieDraw){ 
            lastTrueTimeHorsie=now;
            horsieDraw = true;
            return true;
        }

        if (lastTrueTimeHorsie+6400<now)
            return false;
        
        return true;
}

color backgroundColor = color(0);
// properties of the static background 
int numStatic = 1000;
int staticSizeMin = 1;
int staticSizeMax = 3;
color staticColor = color(200);
// properties of the paddle
int paddleX;
int paddleY;
int paddleVX;
int paddleSpeed = 10;
int paddleWidth = 128;
int paddleHeight = 16;
color paddleColor = color(255);
//properties of the ball
int ballX;
int ballY;
int ballVX;
int ballVY;
int ballSpeed = 5;
int ballSize = 16;
color ballColor = color(100,50,200);

void setup() {
  size(640, 480);
  
  setupPaddle();
  setupBall();
}
// location of the paddle at the start. middle bottom edge of window, not moving
void setupPaddle() {
  paddleX = width/2;
  paddleY = height - paddleHeight;
  paddleVX = 0;
}
//initial location and speed on the ball
void setupBall() {
  ballX = width/2;
  ballY = height/2;
  ballVX = ballSpeed;
  ballVY = ballSpeed;
}
// background static animation
void draw() {
  background(backgroundColor);

  drawStatic();

  updatePaddle();
  updateBall();

  drawPaddle();
  drawBall();
}
// calling for random positioned rectangles on screen to create static, sqaures smaller than 2
void drawStatic() {
  for (int i = 0; i < numStatic; i++) {
   float x = random(0,width);
   float y = random(0,height);
   float staticSize = random(staticSizeMin,staticSizeMax);
   fill(staticColor);
   rect(x,y,staticSize,staticSize);
  }
}
// determines the velocity of the paddle in the x direction, with a constraint to be stopped on the left and right margines of the window
void updatePaddle() {
  paddleX += paddleVX;  
  paddleX = constrain(paddleX,0+paddleWidth/2,width-paddleWidth/2);
}
// determines the velocity of the ball in the x and y directions
void updateBall() {
  ballX += ballVX;
  ballY += ballVY;
  // pre sets the functions for whne the ball hits the paddle, walls and bottom of screen
  handleBallHitPaddle();
  handleBallHitWall();
  handleBallOffBottom();
}
// defines the style of the paddle
void drawPaddle() {
  rectMode(CENTER);
  noStroke();
  fill(paddleColor);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
}
// defines the style of the ball
void drawBall() {
  rectMode(CENTER);
  noStroke();
  fill(ballColor);
  rect(ballX, ballY, ballSize, ballSize);
}
// deifnes what happens when ball hits paddle...if the ball hits the paddle then the directon of the ball in the y direction will be reversed
void handleBallHitPaddle() {
  if (ballOverlapsPaddle()) {
    ballY = paddleY - paddleHeight/2 - ballSize/2;
    ballVY = -ballVY;
  }
}
// 
boolean ballOverlapsPaddle() {
  if (ballX - ballSize/2 > paddleX - paddleWidth/2 && ballX + ballSize/2 < paddleX + paddleWidth/2) {
    if (ballY > paddleY - paddleHeight/2) {
      return true;
    }
  }
  return false;
}
// if the ball passes the bottom then it reapears at mid height and mid width
void handleBallOffBottom() {
  if (ballOffBottom()) {
//CHANGED
    ballX = width/1;
    ballY = height/2;
    ballColor = color(100,33,57);
  }
}
//
boolean ballOffBottom() {
  return (ballY - ballSize/2 > height);
}
// determines the limitations fo the ball when it hist the side walls and top, by reversing its direction
void handleBallHitWall() {
  if (ballX - ballSize/2 < 0) {
    ballX = 0 + ballSize/2;
    ballVX = -ballVX;
  } else if (ballX + ballSize/2 > width) {
    ballX = width - ballSize/2;
    ballVX = -ballVX;
  }
  
  if (ballY - ballSize/2 < 0) {
    ballY = 0 + ballSize/2;
    ballVY = -ballVY;
  }
}
// when tehe ley is pressed the velocity of the paddle is in the left and right direction
void keyPressed() {
  if (keyCode == LEFT) {
    paddleVX = -paddleSpeed;
  } else if (keyCode == RIGHT) {
    paddleVX = paddleSpeed;
  }
}
// when the key is not pressed the paddle stops
void keyReleased() {
  if (keyCode == LEFT && paddleVX < 0) {
    paddleVX = 0;
  } else if (keyCode == RIGHT && paddleVX > 0) {
    paddleVX = 0;
  }
}
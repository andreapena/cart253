final int CIRCLE_SPEED = 4;
// CHANGED slowed the ball down_was giving me a bit of a head ache
// the distance in the x and y direction at which the cirtcle will more. giving the impression of velocity
final color NO_CLICK_FILL_COLOR = color(208, 255, 5);
// CHANGED the ball colour to neon yellow
// dark pink colour of ball 
final color CLICK_FILL_COLOR = color(100, 100, 250);
//blue colour
final color BACKGROUND_COLOR = color(250, 100, 150);
//CHANGED the colour background to fuscia
// soft pink
final color STROKE_COLOR = color(250, 150, 150);
//outline of circle same as background so no outline visible
final int CIRCLE_SIZE = 50;

int circleX;
int circleY;
int circleVX;
int circleVY;

void setup() {
  size(640, 480);
  // size of the screen
  circleX = width/2;
  // the size of the cirle is half of the width
  circleY = height/2;
   // the heigh of the circle is half the width
  circleVX = CIRCLE_SPEED;
  //speed of the cicle in the x axis
  circleVY = CIRCLE_SPEED;
  //speed of the circle in the y axis
  stroke(STROKE_COLOR);
  // asserts that the colour of the background is the colour of the stroke of circle
  fill(NO_CLICK_FILL_COLOR);
  // asserts the continous darker pink fill of the circle
   background(BACKGROUND_COLOR);
  // asserts the soft pink fbackgound colour
}

void draw() {
    if (dist(mouseX, mouseY, circleX, circleY) < CIRCLE_SIZE/2) {
    fill(CLICK_FILL_COLOR);
    //is the location of the mouse is within the circumferenace of the circle, the circle goes blue
  }
  else {
    fill(NO_CLICK_FILL_COLOR);
    // if its not within the circumferance of the circle then nothing happens
  }
  ellipse(circleX, circleY, CIRCLE_SIZE, CIRCLE_SIZE);
  // ths creates an elipse with a ceratin width and height each time at the x and y positions
  circleX += circleVX;
  circleY += circleVY;
  //this allows for a trail of the circle in its travelling diagonal diretions (x+y combined) which is at a spead or distance of 7 pixels
  if (circleX + CIRCLE_SIZE/2 > width || circleX - CIRCLE_SIZE/2 < 0) {
    circleVX = -circleVX;
    //if the position of the circle in the x axis including half of its radius is greater than the width ||= and/or.... 
    //if if the position of the circle in the x axis not including half of its radius is less than the width then..
    // the direction of the travelling circle in its x veolicty will be inversed .. ie go in the opposite direction
  }
  if (circleY + CIRCLE_SIZE/2 > height || circleY - CIRCLE_SIZE/2 < 0) {
    circleVY = -circleVY;
    //if the position of the circle in the y axis including half of its radius is greater than the height ||= and/or.... 
    //if if the position of the circle in the y axis not including half of its radius is less than the height then..
    // the direction of the travelling circle in its y veolicty will be inversed .. ie go in the opposite direction
  }
}

void mousePressed() {
  background(BACKGROUND_COLOR);
  // when the mouse is pressed the backgound colour fills the screen
}
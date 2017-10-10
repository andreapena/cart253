// calls for the pre definied variables through simpler functions
color backgroundColor = color(200,150,150);
Bouncer bouncer;
Bouncer bouncer2;

// calls for the function of bouncer defining the properties of B1 and B2 based on the previously definied variables 
void setup() {
  // size of bouncers
  size(640,480);
  background(backgroundColor);
  // defines the x,y,colour 1 and colour 2 of B1 and B2
  bouncer = new Bouncer(width/2,height/2,2,2,50,color(150,0,0,50),color(255,0,0,50));
  bouncer2 = new Bouncer(width/2,height/2,-2,2,50,color(0,0,150,50),color(0,0,255,50));
}
//re_draws B1 and B2 each frame and calls the function by draw
void draw() {
  bouncer.update();
  bouncer2.update();
  bouncer.draw();
  bouncer2.draw();
}
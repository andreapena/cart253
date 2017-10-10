// defines all the variables of the bouncers
class Bouncer {
  // properties of the class
 int x;
 int y;
 int vx;
 int vy;
 int size;
 color fillColor;
 color defaultColor;
 color hoverColor;
 
 // defines the veolcity, colour, shape, fill, while indicating temp allows for two different objcest to swap between variables 
 Bouncer(int tempX, int tempY, int tempVX, int tempVY, int tempSize, color tempDefaultColor, color tempHoverColor) {
   x = tempX;
   y = tempY;
   vx = tempVX;
   vy = tempVY;
   size = tempSize;
   defaultColor = tempDefaultColor;
   hoverColor = tempHoverColor;
   fillColor = defaultColor;
 }
 // movement of the ball in x and y axis
 // 
 void update() {
   x += vx;
   y += vy;
   // constructor for handlebounce/handlemouse
   handleBounce();
   handleMouse();
 }
 // defines handlebounce as to reverse the velocity of x when the bouncer hits the width (side to side)
 // CHANGED
 void handleBounce() {
   if (x < 0) {
     x += width;
   } else if (x > width) {
    x -= width;
   }
 // CHANGED
 // defines handlebounce as to reverse the velocity of y when the bouncer hits the height (top and bottom)
   if (y < 0){
     y += height;
   } else if (y > height)
     y -= height;
   }
   //x = constrain(x,size/2,width-size/2);
   //y = constrain(y,size/2,height-size/2);
 //}
//  when that mouse is inside the dimension of the bouncer it calls to fill color for the hover colour
 void handleMouse() {
   if (dist(mouseX,mouseY,x,y) < size/2) {
    fillColor = hoverColor; 
   }
   // if not then the colour stays as default
   else {
     fillColor = defaultColor;
   }
 }

 // draws the function properties
 void draw() {
   noStroke();
   fill(fillColor);
   ellipse(x,y,size,size);
 }
}
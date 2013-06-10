// Replace the mouse pointer with a minimal one pixel cursor

void initCursor() {
  PImage pointImg = loadImage("cur.png");
  cursor(pointImg, 8, 8);  
}

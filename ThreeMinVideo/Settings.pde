// General program settings

int halfHeight;
int halfWidth;

void initSettings() {
  size(900, 400);
  halfWidth = width / 2;
  halfHeight = height / 2;
  colorMode(HSB, 100);
  noSmooth();
  background(0);
  noStroke();
  textAlign(CENTER, CENTER);
}

void draw() {
  // read updated fft values
  fft.forward(player.mix);

  // read Arduino
  readSerial();

  // maybe useful variable
  // time = 0 .. 1
  // starts at 0, ends at 1 when 3 minutes have passed
  float time = millis() / 180000.0;
  if(time > 1) {
    // stop when we reach max allowed time
    noLoop();
  }
 
  // colors get reversed during the song
  // we start with white on black, end with black on white
  float back = 100 * time;
  color cback = color(back);
  color cfront = color(100 - back);
  
  // FADE 1: pixelated fading. Draw many random pixels using the back color
  loadPixels();
  int totalPixels = width * height;
  for(int t=0; t < totalPixels / 20; t++) {
    pixels[int(random(totalPixels))] = cback;
  }
  updatePixels();

  // FADE 2: smooth fading.  
  // cover screen with translucid box 
  //fill(back, 10);
  //rect(0,0,width,height);
  
  // Use front fill color
  fill(cfront);
  noStroke();
  
  // Draw particles previously added to the stage using the tablet
  drawThings();

  // If pressing an arduino button, draw circles.
  // The size depends on the light sensor
  if(arduinoBut1) {
    float sz = fft.getBand(150) * 50;
    ellipse(arduinoLight * width, halfHeight, sz, sz); 
  }
  
  // Draw some frequency bands using rectangles
  // Set sensibility using cc97
  for(int i=0; i<16; i++) {
    if(fft.getBand(i * 500/20) > 5 * (1-midicc[97])) {
      rect((frameCount + i * width/16) % width, 0, midicc[98] * width/16, height);
    }
  }
 
  // Center
  translate(width/2, height/2);
  // Rotate with low frequencies and cc8
  rotate(midicc[8] * fft.getBand(50) / 5);
  // Set front stroke color
  stroke(cfront);
  // Set stroke width using arduino light sensor
  //strokeWeight(abs(10 - arduinoLight/10));
  // Set stroke width with cc5
  strokeWeight(midicc[5] * 10);
  //if(arduinoBut1) {
  //if cc65
  if(midicc[65] > 0.5) {
    // draw line, x position depends on freq band 300 and scale range on cc6
    float x = halfWidth * fft.getBand(frq(300)) * midicc[6];
    line(x, -halfWidth, x, halfWidth);
  }
  //if(arduinoBut2) {
  //if cc66
  if(midicc[66] > 0.5) {
    // draw line, x position depends on freq band 200 and scale range on cc7
    float x = -halfWidth * fft.getBand(frq(200)) * midicc[7];
    line(x, -halfWidth, x, halfWidth);
  }    
}
int frq(int band) {
  return (frameCount + band) % 500;
}

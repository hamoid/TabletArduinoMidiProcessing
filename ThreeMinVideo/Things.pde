// Particles
// Drawn using the graphic tablet
// Each particle has properties that can be used
// Each particle has a complete copy of the midi control change values
// so it remembers the midi values when the particle was born
// Why? Because I don't want midi knobs to always affect existing
// particles. I want particles to have personality and not be influenced
// by me after they are born.

int MAX_THINGS = 1000;
Thing[] thing = new Thing[MAX_THINGS]; 
int nextThingID = 0;

void initThings() {
  for (int i=0; i<MAX_THINGS; i++) {
    thing[i] = new Thing();
  }
}
void drawThings() {
  for (int i=0; i<MAX_THINGS; i++) {
    thing[i].draw();
  }
}


void initThing() {
  thing[nextThingID].init();  
  nextThingID = (nextThingID + 1) % MAX_THINGS;
}

class Thing {
  float born, x, y, pressure, heading, mag;
  float cc[] = new float[127];

  Thing() {
  }
  void init() {
    this.born = frameCount;
    this.x = mouseX;
    this.y = mouseY;
    this.pressure = myTablet.getPressure();
    PVector tilt = new PVector(myTablet.getTiltX(), myTablet.getTiltY()); 
    this.heading = tilt.heading(); 
    this.mag = tilt.mag();
    this.cc = midicc.clone();
  }
  void evolve() {
    float rnd = this.cc[1] * 5;
    this.x += random(-rnd, rnd);
    this.y += random(-rnd, rnd);
    
    float dir = this.cc[4] * 10;
    this.x += dir * cos(this.heading);
    this.y += dir * sin(this.heading);
  }
  void draw() {
    if (frameCount - this.born < 200) {
      this.evolve();
      float sz = this.pressure * 20;
      int howmany = 1 + int(this.cc[2]*10);
      for (int i=0; i<howmany; i++) {
        float o = this.cc[3] * 20;
        ellipse(this.x+random(-o, o), this.y+random(-o, o), sz, sz);
      }
    }
  }
}


// We store all incoming controller-change messages in an array,
// so we can find out what was the last received value for any knob or button. 

// Drawing something ONLY when receiving a message would be similar to
// playing a music ONLY when moving the volume slide, and being silent at all
// other times. We want to remember what was the last volume, and keep playing
// at that volume.

// The controller we used is a Behringer BCR2000. It provides 32 knobs,
// 20 buttons, and many more in "virtual mode" (using pages), and it's not
// that expensive.

// The way I use this is:
// 1. I uncomment the print instruction below
// 2. I run the program and turn a knob to find out its number. Suppose I get cc[89] = 33.
// 3. 89 is the number of the controller. Now I can use midicc[89] anywhere in my program
//    to adjust a behaviour.
// 4. Let's say I want to adjust the strokeWidth with that knob. I can type
//    strokeWidth(midicc[89] * 20) somewhere in the draw() loop 
//    to get widths between 0 and 20 by turning that knob.

import themidibus.*;

MidiBus myBus;

float midicc[] = new float[127];

void initMidi() {
  MidiBus.list();
  myBus = new MidiBus(this, 0, 1);  
}

void controllerChange(int channel, int number, int value) {
  // println("cc[" + number + "] = "+value);
  
  // Control Change numbers in my BCR2000:
  //  1 -  8 knob           First row of knobs
  // 65 - 72 toggle button
  // 73 - 80 toggle button
  // 81 - 88 knob           Second row of knobs
  // 89 - 96 knob           Third row of knobs
  // 97 - 104 knob          Fourth row of knobs
  
  midicc[number] = map(value, 0, 127, 0, 1);
}

/* 
 Reminder for myself about what each knob does:
 1 randomness
 2 points per point
 3 randomness of new points
 4 heading speed
 5 Analyzer line width
 6 Left line analyzer scale
 7 Right line analyzer scale
 8 Analyzer rotation sensibility to audio
 
 But1 activate left analyzer
 But2 activate right analyzer
 
 97 Vertical band audio sensibility
 98 Vertical band width
*/

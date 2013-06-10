/*
 This program was developed during a Processing Code Jam
 by Tom Lopez and Abe Pazos. 
 Sunday 9.6.2013, Berlin
 
 The purpose of this program is to be able to perform live visuals for a 3 minute song,
 using a MIDI controller, a graphics tablet and an Arduino.
 
 It's unlikely that many people will have all 3 input devices, but the code can serve
 as an example for other projects.
 
 Running the program by itself will just play the included music and display no graphics.
 To see something, one must use one or more input devices.
 
 A video of this tool in action is coming.
 This is an unfinished prototype. 
*/

void setup() {
  initSettings();  
  initSerial();
  initSound();
  initMidi();
  initTablet();
  initCursor();
  initThings();
}


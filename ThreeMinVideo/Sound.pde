// Sound player
// Plays a Creative Commons song
// and prepares the FFT analysis
// for reading signal strengths at different
// requencies, and modifying the graphics
// depending on the music

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer player;
FFT fft;

// Song used:
// http://freemusicarchive.org/music/jonas_the_plugexpert/Dertien/Jonas_The_Plugexpert_-_Dertien_-_08_Tjipdeuntje

// Tjipdeuntje by jonas the plugexpert is licensed 
// under a Attribution-NonCommercial-ShareAlike License. 

void initSound() {
  // Play music
  minim = new Minim(this);
  player = minim.loadFile("JonasThePlugexpert-Tjipdeuntje.mp3", 1024);
  player.play();
  
  // This is used to analyze sound
  fft = new FFT(player.bufferSize(), player.sampleRate());
}

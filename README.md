TabletArduinoMidiProcessing
===========================

Processing program to perform visuals for a 3 minute song

This program was developed during a Processing Code Jam
by Tom Lopez and Abe Pazos.
Sunday 9.6.2013, Berlin

The purpose of this program is to be able to perform live visuals for a 3 minute song,
using a MIDI controller, a graphics tablet and an Arduino.

It's unlikely that many people will have all 3 input devices, but the code can serve
as an example for other projects.

Running the program by itself will just play the included music and display no graphics.
To see something, one must use one or more input devices.

Right after starting the program you have 5 seconds to calibrate the light sensor.
During this time the LED in the arduino board will glow, and you should cover the
light sensor with your hand, then uncover it, at least once. What this does is
finding out the minimum and maximum amount of light received by the light sensor.
The output value sent to Processing is later limited to the range 0 .. 255 by
the Arduino code.

A video of what it looks like is coming.
This is an unfinished prototype.

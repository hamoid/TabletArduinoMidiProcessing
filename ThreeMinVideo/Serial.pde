// Code to listen to Arduino
import processing.serial.*;
Serial myPort;

boolean arduinoBut1 = false;
boolean arduinoBut2 = false;
float arduinoLight = 0;

void initSerial() {
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[0], 9600);
}
void readSerial() {
  if (myPort.available() > 0) {
    // Arduino sends strings like NUM|NUM|NUM;
    // Read until ";"
    String msg = myPort.readStringUntil(';');
    if ( msg != null) {
      // Now split using "|" and ";" characters
      String[] parts = splitTokens(msg, "|;");
      // If we found three parts...
      if (parts.length == 3) {
        // Store each part in a variable
        arduinoBut1 = parts[0].equals("1");
        arduinoBut2 = parts[1].equals("1");
        arduinoLight = float(parts[2]) / 255.0;
      }
    }
  }
}


// Read two button states and one light resistor
// Print in this format B1|B2|LIGHT
// B1 and B2 can be 0 or 1
// LIGHT can be a number between 0 and 255

const int sensorPin = A0;
const int but1 = 6;
const int but2 = 7;

// variables:
int sensorValue = 0;         // the sensor value
int sensorMin = 1023;        // minimum sensor value
int sensorMax = 0;           // maximum sensor value

void setup() {
  Serial.begin(9600);
  pinMode(but1, INPUT);
  pinMode(but2, INPUT);
  
  // turn on LED to signal the start of the calibration period:
  pinMode(13, OUTPUT);
  digitalWrite(13, HIGH);
  
  // calibrate during the first five seconds 
  while (millis() < 5000) {
    sensorValue = analogRead(sensorPin);

    // record the maximum sensor value
    if (sensorValue > sensorMax) {
      sensorMax = sensorValue;
    }

    // record the minimum sensor value
    if (sensorValue < sensorMin) {
      sensorMin = sensorValue;
    }
  }

  // signal the end of the calibration period
  digitalWrite(13, LOW);  
}

void loop() {
  // read the sensor:
  sensorValue = analogRead(sensorPin);

  // apply the calibration to the sensor reading
  sensorValue = map(sensorValue, sensorMin, sensorMax, 0, 255);

  // in case the sensor value is outside the range seen during calibration
  sensorValue = constrain(sensorValue, 0, 255);
  
  Serial.print(digitalRead(but1));
  Serial.print("|");
  Serial.print(digitalRead(but2));
  Serial.print("|");
  Serial.print(sensorValue);
  Serial.print(";");
  delay(30);
}

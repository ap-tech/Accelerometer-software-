/*
 APtech
 ADXL335 Accelerometer board software
 
 */

float Xout = 0;

float Yout = 0;

float Zout = 0;


void setup() {
 
  
  Serial.begin(9600);
  
  
}


void loop() {
 
  
  
  Xout = analogRead(A0);
 
  Serial.print(Xout);
  Serial.print(",");
  



  Yout = analogRead(A1);
 
  Serial.print(Yout);
  Serial.print(",");
 


  Zout = analogRead(A2);
 
  Serial.println(Zout);
 
  delay(10); 


 
}

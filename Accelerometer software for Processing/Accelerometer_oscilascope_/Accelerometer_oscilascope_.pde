//  This example code is in the public domain.

 import processing.serial.*;
 
 float Xout = 0;       
 float Yout = 0;      
 float Zout = 0;     
 float i = 0;
 float B = 0;
 
 
 Serial myPort;
 
 void setup() {
 size(650, 300);
 
 // List all the available serial ports
 // if using Processing 2.1 or later, use Serial.printArray()
 println(Serial.list());
 
 // I know that the first port in the serial list on my mac
 // is always my  Arduino, so I open Serial.list()[0].
 // Open whatever port is the one you're using.
 myPort = new Serial(this,"/dev/tty.usbmodem641",9600);
 // don't generate a serialEvent() unless you get a newline character:
 myPort.bufferUntil('\n');
 }

 void draw() {
 // set the background color with the color values:
 background(0, 0, 0);
 
  fill(0,0,255);            //Text
  text("Xout",22,270);
  
  
  fill(0,255,0);            //Text
  text("Yout",87,270);
  
  
  fill(255,0,0);            //Text
  text("Zout",152,270);
  

  for(i = 0; i < 650; i ++){

  
//*****************************************Xout 
  stroke(0,0,255);          //Bar
  fill(0,0,255);
  ellipse(i, Xout, 1,1);
  
//*****************************************Yout  
  stroke(0,255,0);          //Bar
  fill(0,255,0);
  ellipse(i, Yout, 1, 1);
  
//*****************************************Zout
  stroke(255,0,0);          //Bar
  fill(255,0,0);
  ellipse(i, Zout, 1, 1);
 
   
  
 }
   

 }
  
 
  
 void serialEvent(Serial myPort) { 
 // get the ASCII string:
 String inString = myPort.readStringUntil('\n');
 
 if (inString != null) {
 // trim off any whitespace:
 inString = trim(inString);
 // split the string on the commas and convert the 
 // resulting substrings into an integer array:
 float[] colors = float(split(inString, ","));
 // if the array has at least three elements, you know
 // you got the whole thing.  Put the numbers in the
 // color variables:
 if (colors.length >=3) {
 // map them to the range 0-255:
 Xout = map(colors[0], 0, 1023, 0, 355);
 Yout = map(colors[1], 0, 1023, 0, 355);
 Zout = map(colors[2], 0, 1023, 0, 355);
 }
 }
 }



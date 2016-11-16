


/* 

 This library enables you to update your ThinkSpeak Channel from Processing
 either using the library from Rasperry PI or seriel communication from an Arduino
 Board. 
 
 Dont't forget to import the network class processing.net.* in your main program 
 
 (c) f41_ardu 2016-11-16 / Version 1.1 
 The library is free. Use at your own risk. 
 
 */


import processing.net.*;

// class Thinkspeak

Thinkspeak test;

String server = "api.thingspeak.com";
// replace your key by usr thinkspeak channel key 
String apiKey = "your api key";


void setup()
{
  test = new Thinkspeak(7);
  test.set(0,3);
  test.set(0,10);
}

void draw() {
   for (int i = 0 ; i < 8; i++) {
     test.set(i,random(10));
   }
   Client myClient = new Client(this, server, 80); // Connect to server on port 80
   test.update(myClient, apiKey);
   delay(20000); 
}
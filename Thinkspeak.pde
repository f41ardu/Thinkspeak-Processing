/* 

 This library enables you to update your ThinkSpeak Channel from Processing
 either using the library from Rasperry PI or seriel communication from an Arduino
 Board. 
 
 Dont't forget to import the network class processing.net.* in your main program 
 
 (c) f41_ardu 2016-11-16 / Version 1.1 
 The library is free. Use at your own risk. 
 Just add a new tab name it Thinkspeak and copy this cod into it. 
 
 */

// class Thinkspeak


class Thinkspeak {

  FloatList inventory;
  int _Length;

  Thinkspeak (int size)
  {
    _Length = size;

    inventory = new FloatList();
    for (int i = 0; i < _Length; i=i+1) {
      inventory.append(0);
    }
  }
  void set(int index, float data) {
    inventory.set(index, data);
  }

  void update(Client server, String apikey) {  

    String uri = "POST /update?key=";
    int field = 0;
    uri += apikey;
    for (int index = 0; index < inventory.size(); index = index +1 ) {
      field = index + 1;
      uri += "&field"+field+"=";
      uri +=  inventory.get(index);
    }
    uri += " HTTP/1.1\n"; 

    if (server.active() == true) { // If there's incoming data from the client...
      server.write(uri);  
      server.write("Host: blablbablba.bla\n\n"); // Be polite and say who we are
    } 

    server.stop();
  }
}

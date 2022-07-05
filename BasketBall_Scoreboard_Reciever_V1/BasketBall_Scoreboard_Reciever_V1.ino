//Basketball Scoreboard Reciever by: Kenny Neutron
//07-05-2022
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

RF24 radio(8, 10); // CE, CSN
const byte address[6] = "00001";



void setup() {
  Serial.begin(115200);
  Serial.println("START");
  radio.begin();
  radio.openReadingPipe(0, address);
  radio.setPALevel(RF24_PA_MAX);
  radio.startListening();
}



void loop() {
  if (radio.available()) {
    char text[7] = "";
    radio.read(&text, sizeof(text));
    Serial.print(String(text));

//    byte data;
//    for (byte a = 0; a <= 14; a++) {
//      data = text[a];
//      Serial.println(a + ":" + String(data));
//    }
//    delay(50);


  }



}

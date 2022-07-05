//Kenny Neutron
//PC ScoreBoard App V1.0
//July 5, 2022


import processing.serial.*;

Serial myPort;  // Create object from Serial class

int TimeMin=0;
int TimeSec=0;
int TimeMil=0;
int game_time_cursorY=80;

int SC_sec=0;
int SC_mil=0;
int shotclock_cursorY=100;

int HomeFoul=0;
int GuestFoul=0;
int foul_cursorY=190;

int HomeScore=0;
int GuestScore=0;
int score_cursorY=320;

int BallPos=0;
int period=0;
boolean buzzer=false;

int[] s_val=new int[7];

void setup() {
  size(640, 360);
  // Create the font       
  textFont(createFont("Arial-Black-48.vlw", 48));

  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 115200);
}

void draw() {
  background(1);
  textSize(10);
  fill(255, 255, 255);
  text("Programmed by: Kenny Neutron", 2, 10);

  display_GameTime();
  display_ShotClock();
  display_Foul();
  display_Score();
  display_Period();
  display_BallPos();

  if ( myPort.available() > 0) {  // If data is available,
    s_val[0] = myPort.read();         // read it and store it in val
    println(s_val[0]);
  }


  DecryptData();

  myPort.clear();
}


void DecryptData() {
  int count=1;
  if (s_val[0]=='A') {
    println("HEADER 0 detected");
    while (count<=6) {
      //while (myPort.available()==0) {
      //}
      s_val[count] = myPort.read();
      count++;
    }

    if (s_val[6]=='B') {
      println("FOOTER 0 detected");
    }
    if (s_val[6]=='B') {
      if (s_val[1]==250) {
        TimeMin=0;
      } else {
        TimeMin=s_val[1];
      }

      if (s_val[2]==250) {
        TimeSec=0;
      } else {
        TimeSec=s_val[2];
      }

      if (s_val[3]==250) {
        TimeMil=0;
      } else {
        TimeMil=s_val[3];
      }

      if (s_val[4]==250) {
        SC_sec=0;
      } else {
        SC_sec=s_val[4];
      }

      if (s_val[5]==250) {
        SC_mil=0;
      } else {
        SC_mil=s_val[5];
      }
    }

    for (int a=0; a<=6; a++) {
      print(a);
      print(":");
      println(s_val[a]);
    }
  } else if (s_val[0]=='C') {
    println("HEADER 1 detected");

    while (count<=6) {
      //while (myPort.available()==0) {
      //}
      s_val[count] = myPort.read();
      count++;
    }

    if (s_val[6]=='D') {
      println("FOOTER 1 detected");

      int BPZ=s_val[1];

      BallPos=BPZ/100;
      if (BPZ>=100) {
        period= (BPZ%100)/10;
      } else {
        period=BPZ/10;
      }

      if (s_val[2]==250) {
        HomeFoul=0;
      } else {
        HomeFoul=s_val[2];
      }

      if (s_val[3]==250) {
        GuestFoul=0;
      } else {
        GuestFoul=s_val[3];
      }

      if (s_val[4]==250) {
        HomeScore=0;
      } else {
        HomeScore=s_val[4];
      }

      if (s_val[5]==250) {
        GuestScore=0;
      } else {
        GuestScore=s_val[5];
      }
    }

    for (int a=0; a<=6; a++) {
      print(a);
      print(":");
      println(s_val[a]);
    }
  }
}

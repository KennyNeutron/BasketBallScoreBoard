//Start/Stop Button is Pressed
void con_StartStop() {
  if (StartStop_IsPressed == true && !flag_SSToggle) {
    if (SC_sec != 0) {
      flag_start = !flag_start;
    } else if (SC_sec == 0) {
      if (SC_mil != 0) {
        flag_start = !flag_start;
      }
    }
    flag_SSToggle = true;
  } else if (StartStop_IsPressed == true && flag_SSToggle == true) {
    if (status_StartStop()) {
      StartStop_IsPressed = false;
      flag_SSToggle = false;
      delay(50);
    }
  }
}



//ShotClock Button is Pressed
void con_ShotClock() {
  if (ShotClock_IsPressed == true && !flag_SCToggle) {
    if (!status_shift()) {
      SC_sec = 14;
      SC_mil = 0;
    } else {
      SC_sec = 24;
      SC_mil = 0;
    }
    flag_SCToggle = true;
  } else if (ShotClock_IsPressed == true && flag_SCToggle == true) {
    if (status_ShotClock()) {
      ShotClock_IsPressed = false;
      flag_SCToggle = false;
      delay(50);
    }
  }
}



//Buzzer Button is Pressed
void con_Buzzer() {
  if (buzzer_IsPressed == true && !flag_start) {
    tone(buzzer, 1000);
    if (status_buzzer()) {
      buzzer_IsPressed = false;
      noTone(buzzer);
    }
  }
}


//HomeFoul Button is Pressed
void con_HomeFoul() {
  if (HFoul_IsPressed == true && !flag_HFoulToggle) {
    if (!status_shift()) {
      HomeFoul--;
    } else {
      HomeFoul++;
    }

    flag_HFoulToggle = true;

    if (HomeFoul >= 10 && HomeFoul != 255) {
      HomeFoul = 9;
    } else if (HomeFoul == 255) {
      HomeFoul = 0;
    }
  }
}


//GuestFoul Button is Pressed
void con_GuestFoul() {
  if (GFoul_IsPressed == true && !flag_GFoulToggle) {
    if (!status_shift()) {
      GuestFoul--;
    } else {
      GuestFoul++;
    }

    flag_GFoulToggle = true;

    if (GuestFoul >= 10 && GuestFoul != 255) {
      GuestFoul = 9;
    } else if (GuestFoul == 255) {
      GuestFoul = 0;
    }
  }
}



//HomeScore Button is Pressed
void con_HScore() {
  if (HScore_IsPressed == true && !flag_HScoreToggle) {
    if (!status_shift()) {
      HomeScore--;
    } else {
      HomeScore++;
    }

    flag_HScoreToggle=true;
    if(HomeScore>=200 && HomeScore!=255){
      HomeScore=199;    
    }else if(HomeScore==255){
      HomeScore=0;
    }
  }
}


//GuestScore Button is Pressed
void con_GScore(){
  if(GScore_IsPressed==true && !flag_GScoreToggle){
    if(!status_shift()){
      GuestScore--;
    }else{
      GuestScore++;
    }

    flag_GScoreToggle=true;

    if(GuestScore>=200&&GuestScore!=255){
      GuestScore=199;
    }else if(GuestScore==255){
      GuestScore=0;
    }
  }
}



//BallPos Button is Pressed
void con_BallPos(){
  if(BallPos_IsPressed==true && !flag_BallPosToggle){
    if(!status_shift()){
      BallPos=0;
    }else{
      if(BallPos==1){
        BallPos=2;
      }else if(BallPos==0 || BallPos==2){
        BallPos=1;
      }
    }
    flag_BallPosToggle=true;
  }
}

void display_SB() {
  char ch_GameTime[8] = "";
  char ch_ShotClock[5] = "";
  char ch_Period[2] = "";
  char ch_HFoul[2] = "";
  char ch_GFoul[2] = "";
  char ch_HScore[4] = "";
  char ch_GScore[4] = "";

  if (TimeMin >= 10 && TimeSec >= 10) {
    sprintf(ch_GameTime, "%d:%d.%d", TimeMin, TimeSec, TimeMil);
  } else if (TimeMin < 10 && TimeSec >= 10) {
    sprintf(ch_GameTime, "0%d:%d.%d", TimeMin, TimeSec, TimeMil);
  } else if (TimeMin >= 10 && TimeSec < 10) {
    sprintf(ch_GameTime, "%d:0%d.%d", TimeMin, TimeSec, TimeMil);
  } else if (TimeMin < 10 && TimeSec < 10) {
    sprintf(ch_GameTime, "0%d:0%d.%d", TimeMin, TimeSec, TimeMil);
  }

  if (SC_sec < 10) {
    sprintf(ch_ShotClock, "0%d.%d", SC_sec, SC_mil);
  } else {
    sprintf(ch_ShotClock, "%d.%d", SC_sec, SC_mil);
  }

  sprintf(ch_Period, "%d", period);

  sprintf(ch_HFoul, "%d", HomeFoul);
  sprintf(ch_GFoul, "%d", GuestFoul);

  sprintf(ch_HScore, "%d", HomeScore);
  sprintf(ch_GScore, "%d", GuestScore);

  u8g.setFont(u8g_font_gdb14r);
  u8g.drawStr(0, 14, ch_GameTime);    //GameTime
  u8g.drawStr(86, 14, ch_ShotClock);  //Shotclock

  u8g.drawStr(0, 39, ch_HFoul);     //HomeFoul
  u8g.drawStr(117, 39, ch_GFoul);   //GuestFoul

  u8g.drawStr(0, 64, ch_HScore);    //HomeScore

  if (String(GuestScore).length() == 1) {
    u8g.drawStr(117, 64, ch_GScore);   //GuestScore
  } else if (String(GuestScore).length() == 2) {
    u8g.drawStr(105, 64, ch_GScore);   //GuestScore
  } else {
    u8g.drawStr(93, 64, ch_GScore);   //GuestScore
  }

  if (period == 5) {
    u8g.drawStr(51, 39, "OT");      //Period
  } else {
    u8g.drawStr(59, 39, ch_Period); //Period
  }

  if (BallPos == 1) {
    u8g.drawTriangle(50, 50, 50, 64, 40, 57); //HomeArrow
  } else if (BallPos == 2) {
    u8g.drawTriangle(78, 50, 78, 64, 88, 57); //GuestArrow
  }


  if (SC_mil == 0 && SC_sec == 0) {
    flag_SCDisplayed = true;
  }

}

void display_guidelines() {
  u8g.drawLine(0, 32, 128, 32);
  u8g.drawLine(64, 0, 64, 64);
}

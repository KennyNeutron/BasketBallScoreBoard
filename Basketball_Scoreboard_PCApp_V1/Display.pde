void display_GameTime() {
  textSize(36);
  fill(255, 255, 0);
  text("TIME", 250, 30);

  textSize(64);
  fill(255, 255, 255);
  if (TimeMin<10) {
    text("0", 200, game_time_cursorY);
    text(TimeMin, 240, game_time_cursorY);
  } else {
    text(TimeMin, 200, game_time_cursorY);
  }

  text(":", 277, game_time_cursorY);


  if (TimeSec<10) {
    text("0", 300, game_time_cursorY);
    text(TimeSec, 340, game_time_cursorY);
  } else {
    text(TimeSec, 300, game_time_cursorY);
  }
  textSize(36);
  text(TimeMil, 380, game_time_cursorY-20);
}

void display_ShotClock() {
  textSize(100);
  if (SC_sec<10) {
    if (SC_sec<6) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
    text(SC_sec, 510, shotclock_cursorY);
  } else {
    fill(0, 255, 0);
    text(SC_sec, 450, shotclock_cursorY);
  }
  textSize(60);
  if (SC_mil==10) {
    text("0", 570, shotclock_cursorY-30);
  } else {
    text(SC_mil, 570, shotclock_cursorY-30);
  }
}
void display_Foul() {
  textSize(30);
  fill(255, 255, 0);
  text("Foul", 40, 140);
  text("Foul", 470, 140);
  fill(255, 255, 255);

  textSize(60);
  text(HomeFoul, 54, foul_cursorY);
  text(GuestFoul, 484, foul_cursorY);
}

void display_Score() {
  textSize(36);
  fill(255, 255, 0);
  text("HOME", 30, 240);
  text("GUEST", 460, 240);
  fill(255, 255, 255);

  //HomeScore
  textSize(100);
  if (HomeScore<10) {
    text(HomeScore, 100, score_cursorY);
  } else if (HomeScore<100&&HomeScore>9) {
    text(HomeScore, 40, score_cursorY);
  } else {
    text(HomeScore, 10, score_cursorY);
  }

  //GuestScore
  textSize(100); 
  text(GuestScore, 450, score_cursorY);
}

void display_Period() {
  textSize(24);
  fill(255, 255, 0);
  text("PERIOD", 250, 150);
  fill(255, 255, 255);

  textSize(60);
  if (period>4) {
    text("OT", 255, 200);
  } else {
    text(period, 275, 200);
  }
}

void display_BallPos() {
  textSize(24);
  fill(255, 255, 0);
  text("BALL POS.", 240, 240);

  if (BallPos==1) {
    //arrow home
    fill(0, 255, 0);
    triangle(300, 250, 300, 330, 250, 290);
  } else if (BallPos==2) {
    //arrow guest
    fill(0, 255, 0);
    triangle(300, 250, 300, 330, 350, 290);
  }
}

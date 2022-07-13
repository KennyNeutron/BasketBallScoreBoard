//Kenny Neutron
//Part of my first practice program
//May 13-15,2021
//Basketball Scoreboard V1.0


byte startstop_flag=0;

int game_time_min=10;
int game_time_sec=0;
int game_time_millis=0;
int game_time_cursorY=80;

int shotclock=24;
int shotclock_millis=0;
int shotclock_cursorY=100;

int home_score=0;
int guest_score=0;

int score_cursorY=320;

byte home_foul=0;
byte guest_foul=0;
int  foul_cursorY=190;

byte home_to=0;
byte guest_to=0;

byte period=1;

byte end_game=0;
byte shotclock_end=0;
byte gametime_end=0;


byte ball_pos=0;
byte ballpos_flag=0;

byte finish_flag=0;
byte winner_blink=0;

byte settime_flag=0;
byte settime_count=0;
byte settime_blink=0;
byte settime_finish=0;

int set_gt_min_tens=255;
int set_gt_min_ones=255;
int set_gt_sec_tens=255;
int set_gt_sec_ones=255;
int set_gt_millis=255;

int set_sc_tens=255;
int set_sc_ones=255;
int set_sc_millis=255;

char key_input;


void setup() {
  size(640, 360);
  // Create the font       
  textFont(createFont("Arial-Black-48.vlw", 48));
}


void draw() {

  if (startstop_flag==1&&shotclock==0&&shotclock_millis==0) {
    startstop_flag=0;
  }

  if (startstop_flag==1&&game_time_min==0&&game_time_sec==0&&game_time_millis==0) {
    startstop_flag=0;
  }

  
  
  
  if (startstop_flag==1) {
    game_time_millis--;
    shotclock_millis--;
    if (game_time_millis<0) {
      game_time_sec--;
      game_time_millis=9;
    }

    if (shotclock_millis<0) {
      shotclock--;
      shotclock_millis=9;
    }
  }

  if(game_time_min==0&&game_time_sec<shotclock&&end_game==0) {
    shotclock=game_time_sec;
    shotclock_millis=game_time_millis;
    end_game=1;
  }
  
  if(shotclock!=game_time_sec&&shotclock_millis!=game_time_millis){
    end_game=0;
  }
  
  
  
  
  background(1);
  textSize(10);
  fill(255,255,255);
  text("Programmed by: Kenny Neutron",2,10);
  
  if(settime_flag==0){
    textSize(36);
    fill(255,255,0);
    text("TIME", 250, 30);
    show_gametime();
  }else if(settime_flag==1&&settime_count<8){
    settime_blink++;
    if(settime_blink%2==0){
        textSize(36);
        fill(255,0,0);
        text("Set TIME",190,30);
    }
    show_setuptime();
  }

  //############ DEBUGGING MONITOR #############
  textSize(12);
  fill(255,255,255);
  text("Key:",0,30);
  if(key_input==','){
      text("<",30,30);
  }else if(key_input=='.'){
      text(">",30,30);
  }else{
      text(key_input,30,30);
  }
  
  //text(gametime_end,10,30);
  //text(finish_flag,10,45);
  //text("Q",10,60);
  //text(period,25,60);
  //text(winner_blink,10,75);
  
  //text(settime_count,10,50);  

  
  
  //############################################


  
  //=================== Score ===============
  textSize(36);
  fill(255,255,0);
  text("HOME", 30, 240);
  text("GUEST", 460, 240);
  fill(255,255,255);
  
  
  if (home_score<0) {
    home_score=0;
  } else if (home_score>999) {
    home_score=999;
  }

  if (guest_score<0) {
    guest_score=0;
  } else if (home_score>999) {
    guest_score=999;
  }
  
  
  if(finish_flag==0){
      show_homescore();
      show_guestscore();
  }else if(finish_flag==1){
      show_winner();
  }


  //============= FOUL =================

  if (home_foul<0) {
    home_foul=0;
  } else if (home_foul>9) {
    home_foul=9;
  }

  if (guest_foul<0) {
    guest_foul=0;
  } else if (guest_foul>9) {
    guest_foul=9;
  }


  textSize(30);
  fill(255,255,0);
  text("Foul", 40, 140);
  text("Foul", 470, 140);
  fill(255,255,255);

  textSize(60);
  text(home_foul, 54, foul_cursorY);
  text(guest_foul, 484, foul_cursorY);

  //=========== PERIOD =============

  textSize(24);
  fill(255,255,0);
  text("PERIOD", 250, 150);
  fill(255,255,255);
  textSize(60); 
  if(period>4){
    text("OT", 255,200);
  }else{
    text(period, 275, 200);
  }
  
  //======== BALL POSITION =======
  textSize(24);
  fill(255,255,0);
  text("BALL POS.", 240,240);
  show_ballpos();
  
  
  //Start of a new Quarter
  if(game_time_min==0&&game_time_sec==0&&game_time_millis==0){
      gametime_end++;
      if(gametime_end==30){
          //delay(3000);
          period++;
          if(period==5&&home_score==guest_score){
            shotclock=24;
            shotclock_millis=0;
            game_time_min=5;
            game_time_sec=0;
            game_time_millis=0;
            startstop_flag=0;
            end_game=0;
            shotclock_end=0;
            gametime_end=0;
            home_foul=0;
            guest_foul=0;
          }else if(period>4&&home_score!=guest_score){
            finish_flag=1;
            period--;
          }else if(period==6&&home_score==guest_score){
            period=5;
            shotclock=24;
            shotclock_millis=0;
            game_time_min=5;
            game_time_sec=0;
            game_time_millis=0;
            startstop_flag=0;
            end_game=0;
            shotclock_end=0;
            gametime_end=0;
            home_foul=0;
            guest_foul=0;
          }else if(period<5){
            shotclock=24;
            shotclock_millis=0;
            game_time_min=10;
            game_time_sec=0;
            game_time_millis=0;
            startstop_flag=0;
            end_game=0;
            shotclock_end=0;
            gametime_end=0;
            home_foul=0;
            guest_foul=0;
          }
      }
  }

  
  
  
  
  if (startstop_flag==1&&shotclock==0&&shotclock_millis==0) {
    startstop_flag=0;
  }
  
  
  if (startstop_flag==0&&shotclock==0&&shotclock_millis==0&&gametime_end==0) {
    shotclock_end++;
    if(shotclock_end==30){
      //delay(3000);
      shotclock=24;
      shotclock_millis=0;
      shotclock_end=0;
    }
    
  }
  
  
  delay(100);
  if(gametime_end!=0&&gametime_end%2==0&&finish_flag==1){
      winner_blink++;
  }
  
  
}


void show_setuptime(){
  textSize(64);
  fill(255,255,255);
  text(":", 277, game_time_cursorY);
  if(key_input>='0'&&key_input<='9'){
      switch(settime_count){
          case 0:
                set_gt_min_tens=key_input-'0';
                settime_count++;
                key_input=255;
                break;
          case 1:
                set_gt_min_ones=key_input-'0';
                settime_count++;
                key_input=255;
                break;
          case 2:
                set_gt_sec_tens=key_input-'0';
                settime_count++;
                key_input=255;
                break;
          case 3:
                set_gt_sec_ones=key_input-'0';
                settime_count++;
                key_input=255;
                break;
          case 4:
                set_gt_millis=key_input-'0';
                settime_count++;
                key_input=255;
                break;
          case 5:
                set_sc_tens=key_input-'0';
                settime_count++;
                key_input=255;
                break;
          case 6:
                set_sc_ones=key_input-'0';
                settime_count++;
                key_input=255;
                break;
          case 7:
                if(settime_finish==0){
                  set_sc_millis=key_input-'0';
                  key_input=255;
                  settime_finish=1;
                }
                break;
                
      }
  }
  
  fill(255,255,255);
  if(set_gt_min_tens!=255){
      textSize(64);
      text(set_gt_min_tens,200,game_time_cursorY);
  }
  if(set_gt_min_ones!=255){
      textSize(64);
      text(set_gt_min_ones,240,game_time_cursorY);
  }
  if(set_gt_sec_tens!=255){
      textSize(64);
      text(set_gt_sec_tens,300,game_time_cursorY);
  }
  if(set_gt_sec_ones!=255){
      textSize(64);
      text(set_gt_sec_ones,340,game_time_cursorY);
  }
  if(set_gt_millis!=255){
      textSize(36);
      text(set_gt_millis, 380, game_time_cursorY-20);
  }
  if(set_sc_tens!=255){
      textSize(100);
      fill(0,255,0);
      text(set_sc_tens, 450, shotclock_cursorY);
  }
  if(set_sc_ones!=255){
      textSize(100);
      fill(0,255,0);
      text(set_sc_ones, 510, shotclock_cursorY);
  }
  if(set_sc_millis!=255){
      textSize(60);
      text(set_sc_millis, 570, shotclock_cursorY-30);
  }
  
  
}


void load_settime(){
  game_time_min=(set_gt_min_tens*10)+set_gt_min_ones;
  game_time_sec=(set_gt_sec_tens*10)+set_gt_sec_ones;
  game_time_millis=set_gt_millis;
  
  shotclock=(set_sc_tens*10)+set_sc_ones;
  shotclock_millis=set_sc_millis;
  
  set_gt_min_tens=255;
  set_gt_min_ones=255;
  set_gt_sec_tens=255;
  set_gt_sec_ones=255;
  set_gt_millis=255;
  set_sc_tens=255;
  set_sc_ones=255;
  set_sc_millis=255;
  
  settime_count=0;
  key_input=255;
  settime_blink=0;
  settime_flag=0;
  settime_finish=0;
}

void show_gametime(){

  if(end_game==0){
    show_shotclock();
  }
  
  textSize(64);
  fill(255,255,255);
  if (game_time_min<10) {
    text("0", 200, game_time_cursorY);
    text(game_time_min, 240, game_time_cursorY);
  } else {
    text(game_time_min, 200, game_time_cursorY);
  }

  text(":", 277, game_time_cursorY);

  if (game_time_sec<0) {
    game_time_sec=59;
    game_time_min--;
  }
  if (game_time_sec<10) {
    text("0", 300, game_time_cursorY);
    text(game_time_sec, 340, game_time_cursorY);
  } else {
    text(game_time_sec, 300, game_time_cursorY);
  }
  textSize(36);
  text(game_time_millis, 380, game_time_cursorY-20);


}


void show_winner(){
  textSize(100);
  byte winner=0;
  
  if(home_score>guest_score){
      winner=1;
  }else if(guest_score>home_score){
      winner=2;
  }
  
  show_homescore();
  show_guestscore();
  
  if(winner==1&&winner_blink%2==0){
     //Home Winner
     fill(255,255,0);
     rect(43,325,115,30,3);
     textSize(24);
     fill(0);
     text("WINNER!", 50, 350);
  }else if(winner==2&&winner_blink%2==0){
     //Guest Winner
     fill(255,255,0);
     rect(482,325,115,30,3);
     textSize(24);
     fill(0);
     text("WINNER!", 487, 350);
  }
  
}

void show_homescore(){
  textSize(100);
  if (home_score<10) {
    text(home_score, 100, score_cursorY);
  } else if (home_score<100&&home_score>9) {
    text(home_score, 40, score_cursorY);
  } else {
    text(home_score, 10, score_cursorY);
  }
}

void show_guestscore(){
  textSize(100); 
  text(guest_score, 450, score_cursorY);
}


void show_ballpos(){
  if(ball_pos==1){
    //arrow home
    fill(0,255,0);
    triangle(300,250,300,330,250,290);
  }else if(ball_pos==2){
    //arrow guest
    fill(0,255,0);
    triangle(300,250,300,330,350,290);
  }
}


void show_shotclock() {
  //================= SHOTCLOCK =============
  textSize(100);
  if (shotclock<10) {
    if(shotclock<6){
      fill(255,0,0);
    }else{
      fill(0,255,0);
    }
    text(shotclock, 510, shotclock_cursorY);
  } else {
    fill(0,255,0);
    text(shotclock, 450, shotclock_cursorY);
  }
  textSize(60);
  if (shotclock_millis==10) {
    text("0", 570, shotclock_cursorY-30);
  } else {
    text(shotclock_millis, 570, shotclock_cursorY-30);
  }
  
}


void new_game(){
   game_time_min=10;
   game_time_sec=0;
   game_time_millis=0;
   shotclock=24;
   shotclock_millis=0;
   home_score=0;
   guest_score=0;
   home_foul=0;
   guest_foul=0;
   period=1;
   startstop_flag=0;
   finish_flag=0;
   end_game=0;
}


void keyPressed() {
  key_input=key;
  if (key=='s'&&startstop_flag==0) {
    startstop_flag=1;
  } else if (key=='s'&&startstop_flag==1) {
    startstop_flag=0;
  }
  
  if(key=='S'){
    if(settime_flag==0){
        settime_flag=1;
    }else if(settime_flag==1&&settime_count==7){
        settime_flag=0;
        load_settime();
    }
  }

  if (key=='r') {
    shotclock=24;
    shotclock_millis=0;
    end_game=0;
  }
  if (key=='R') {
    shotclock=14;
    shotclock_millis=0;
    end_game=0;
  }

  if (key=='z') {
    home_score++;
  }
  if (key=='Z') {
    home_score--;
  }

  if (key=='x') {
    guest_score++;
  }

  if (key=='X') {
    guest_score--;
  }

  if (key=='q'&&startstop_flag==0) {
    home_foul++;
  }

  if (key=='Q'&&startstop_flag==0) {
    home_foul--;
  }

  if (key=='w'&&startstop_flag==0) {
    guest_foul++;
  }

  if (key=='W'&&startstop_flag==0) {
    guest_foul--;
  }
  
  if(key==','){
    if(ball_pos==1){
        ball_pos=0;
    }else{
      ball_pos=1;
    }  
  }
  
  if(key=='.'){
    if(ball_pos==2){
        ball_pos=0;
    }else{
        ball_pos=2; 
    }
  }
  
  if(key=='p'){
    period++;
    if(period>5){
      period=1;
    }
  }
  
  if(key=='N'&&finish_flag==1){
     new_game();
  }
}

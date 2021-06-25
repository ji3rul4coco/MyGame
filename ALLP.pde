import org.jbox2d.particle.ParticleType;



int ScreenSet = 0;
int MyMouseX,Mywidth;
int StopChange;
//ScreenChange Random Set
int [] ChanceTypeSelect = new int[2];
boolean ChangeRun = false;
int [] CahangeRect = new int[2];
boolean ChangeBegin = false;
boolean MousePressedOff = true;

//ScreenMove
boolean ScreenMoveOn = false;
int ShakeTime,ShakeRate,ShakeX;

//StartPage Random Set
PImage StartPageBG;
PImage [][] StartPageIcon = new PImage [6][2];
int [] StartPageIconWH = new int[2];
int [] StartPageIconY = new int [6];
int StartPageIconX;
boolean [] CheckStartPageIcon = new boolean [6];
boolean CheckExitOn = false;
PImage ExitCheckTable;
PImage [][] ExitCheck = new PImage [2][2];
boolean [] ExitCheckIcon = new boolean[2];

//MainGamePage Random Set
PImage [] ScriptTable = new PImage[2]; //Table = 1201*334 Name = 281*89
int []ScriptTableWH = new int[2] ;
String [] ScriptText,ScriptPeoPleName,ScriptOn,ChangeScenesOn;
PFont ScriptTextType;
int CheckToNext = 0;
String [] SpecialObject;
String []BGData;
PImage []BG = new PImage[7];
int BGNext = 0;

//PeoPle Random Set
int PeoPleMove , PeoPleTransparency; //PeoPleTransparency = 0; PeoPleMove = 0; on NextScript
boolean SiteStartSet = false; // SiteStartSet = true; on NextScript
int PeoPleCeilingDistance = 0;
PImage [][] PeoPlePicture = new PImage [7][11];
String [] PeoPle1Type; 
String [] PeoPle1Face;
String [] PeoPle2Type; 
String [] PeoPle2Face;
String [] PeoPleMoveType;
String [] PeoPleSite;

//BackStartPage
boolean BackHomePage = false;

//Special Things

  //AutoRead
  int AutoReadRate = 30;
  int AutoReadGo = 0;
  boolean AutoReadOn = false;
  
  //SkipRead
  int SkipReadRate = 5;
  int SkipReadGo = 0;
  boolean SkipReadOn = false;  
  
  //Q.Save & Q.Load
  int [] QSaveData = new int[2];
  boolean QLoad = false;
    
  //ScriptIcon
  PImage [] ScriptIcon = new PImage[6];
  boolean [] CheckScriptIcon = new boolean[6];
  
  //LPIcon
  PImage [] LPIcon = new PImage[5];
  float [] LPIconY = new float[4];
  float [] LPIconRate = new float[4];
  float LPIconOnDownTime = 20;
  int LPIconInter = 0;
  boolean LPIconOn = false;
  boolean [] LPIconCheck = new boolean[5];




//Little Game Page Random Set
PImage [][] PeoPleLogo = new PImage[4][2];
int [] PeoPleLogoWH =new int[2];
boolean [] GameSelect = new boolean[4];
int LogoInterval = 50;
int HendTail;
boolean SelectLittleGameScreen = false;
PImage CloseIcon;
PImage ReadyIcon,GoIcon,TimesUpIcon;
float ReadyGoRate = 0;
float TimeIsUPRate = 0;
boolean ReadyGoOn = false;
boolean TimeIsUPOn = false;
PImage [] LRIcon = new PImage [2];
int [][]LRIconWH = new int [2][2];
boolean RunLeft,RunRight;
int GameType = 0;

  //Little Game_1
  PImage [] Player_G1 = new PImage[5];
  PImage [] Money_G1 = new PImage [4];
  PImage Background_G1;
  PImage TextTable;
  float ChangePlayer_G1 = 0;
  int PlayerSiteX_G1,PlayerSiteY_G1,PlayerRate_G1;
  int PlayerPoint_G1;
  int PlayTime_G1;
  boolean [] MoneyOn_G1 = new boolean[10];
  int [] MoneySite_G1 = new int[10];
  int [] MoneyPoint_G1 = new int[10];
  int [] MoneyDown_G1 = new int[10];
  int [] MoneyDownRate_G1 = new int[10];
  int [] MoneyType_G1 = new int[10];
  int PlayerWHChange = 25;
  int BombTime_G1;
  boolean BombLog_G1;
  float CatchCoef = 0.1;
  
  //Little Game_2
  PImage Player_G2;
  PImage [] MoodBubble_G2 = new PImage[5];
  int MoodBubbleOn_G2;
  int MoodNo_G2;
  int PlayTime_G2;
  int PlayerPoint_G2;
  int FalseTime_G2 = 0,TrueTime_G2 = 0;
  PImage CardBackGround_G2,BackGround_G2;
  PImage [] GameCard_G2 = new PImage[19];
  boolean [] GameCardCheck_G2 = new boolean[24];
  boolean [][] GameCardOn_G2 = new boolean[24][3];
  boolean SpinFirst_G2 = true;
  float SpinCardFirst_G2;
  float SpinCardRateFirst_G2 = 5;
  int SpinCardTimeFirst_G2;
  float []SpinCard_G2 = new float[24];
  float []SpinCardRate_G2 = new float[24];
  int []SpinCardTime_G2 = new int[24];
  int SpinCardAllTime_G2 = 0;
  int CardWidth_G2,CardHeight_G2;
  int [] CheckSelect_G2 = new int[4];
  int [] CardNumber_G2 = new int[24];
  int [] SetNumber_G2(int Quantity,int MaxNumber){
    int [] BeginArray = new int[Quantity];
    int [] RepeatArray = new int[Quantity];
    int [] FinalArray = new int[Quantity];
    int printNum;
    printNum = int(random(MaxNumber));
    for (int i = 0 ; i < Quantity ; i ++){
      if(i < Quantity/2){
        while (isExist_G2(printNum,BeginArray,i)) printNum = int(random(MaxNumber));
        BeginArray[i] = printNum;
      }else{
        BeginArray[i] = BeginArray[i-Quantity/2]; 
      }
    }
    printNum = int(random(Quantity));
    for (int i = 0 ; i < Quantity ; i ++){
      while (isExist_G2(printNum,RepeatArray,i)) printNum = int(random(Quantity));
      RepeatArray[i] = printNum;
    } 
    for (int i = 0 ; i < Quantity ; i ++){
      FinalArray[RepeatArray[i]] = BeginArray[i];
    }
    return FinalArray;
  }

  boolean isExist_G2(int printNum,int [] AB , int i){
    for (int k = 0 ; k < i+1 ; k ++){
          if (k != i && printNum == AB[k])  return true;
      }
    return false;
  }


 
void setup(){
  size(900,675,P2D);
  Mywidth = 900;
  ScriptTextType = createFont("Type.ttf", 32);
  textFont(ScriptTextType);
  CahangeRect[0] = 0;
  CahangeRect[1] = 1;
  rectMode(CORNER);
  ChanceTypeSelect[0] = 0;
  ChanceTypeSelect[1] = 5;
  
  //StartPage Data Load
  ScreenSet = 0;
  for (int i = 0 ; i < 6 ; i ++) CheckStartPageIcon[i] = false;
  StartPageBG = requestImage("Picture/TitlePage.jpg");
  for (int i = 0 ; i < 6 ; i ++) StartPageIcon[i][0] = requestImage("Picture/StartPageIcon" + i + "_0.png");
  for (int i = 0 ; i < 6 ; i ++) StartPageIcon[i][1] = requestImage("Picture/StartPageIcon" + i + "_1.png");
  StartPageIconX = 730;
  for (int i = 0 ; i < 6 ; i ++) StartPageIconY[i] = 310+i*57;
  StartPageIconWH[0] = 140;
  StartPageIconWH[1] = 44;
  ExitCheckTable = requestImage("Picture/Exit_Table.png");
  for (int i = 0 ; i < 2 ; i ++) ExitCheck[i][0] = requestImage("Picture/Exit" + i + "_0.png");
  for (int i = 0 ; i < 2 ; i ++) ExitCheck[i][1] = requestImage("Picture/Exit" + i + "_1.png");
  
  //GamePage Data Load
  ScriptText = loadStrings("Text/Script_Text.txt"); //No.23 need to change color on Number_15
  ScriptOn = loadStrings("Text/Script_On.txt");
  ScriptPeoPleName = loadStrings("Text/Script_PeoPleName.txt");
  ChangeScenesOn = loadStrings("Text/ChangeScenes_On.txt");
  PeoPle1Type = loadStrings("Text/Character_No1.txt");
  PeoPle1Face = loadStrings("Text/Character_No1_Face.txt");
  PeoPle2Type = loadStrings("Text/Character_No2.txt");
  PeoPle2Face = loadStrings("Text/Character_No2_Face.txt");
  PeoPleMoveType = loadStrings("Text/Character_MoveType.txt");
  PeoPleSite = loadStrings("Text/Character_Site.txt");
  SpecialObject = loadStrings("Text/SpecialObject.txt");
  BGData = loadStrings("Text/BackGround_Change.txt");
  for (int i = 0 ; i < PeoPleSite.length ; i++){ if(int(PeoPleSite[i]) == 0) PeoPleSite[i] = "Left"; if(int(PeoPleSite[i]) == 1) PeoPleSite[i] = "Mid"; if(int(PeoPleSite[i]) == 2) PeoPleSite[i] = "Right"; }
  ScriptTable[0] =requestImage("Picture/Script_Table.png");
  ScriptTable[1] =requestImage("Picture/Script_Name.png");
  for (int i = 0 ; i < 7 ; i ++){
    BG[i] = requestImage("Picture/BackGround_"+ i +".jpg");
    for (int k = 0 ; k < 11 ; k ++){
      PeoPlePicture[i][k] = requestImage("Picture/0.png");
    }
  }
  PeoPlePicture[0][0] = requestImage("Picture/0_0.png");
  PeoPlePicture[0][1] = requestImage("Picture/0_1.png");
  PeoPlePicture[0][5] = requestImage("Picture/0_5.png");
  PeoPlePicture[0][7] = requestImage("Picture/0_7.png");
  PeoPlePicture[0][8] = requestImage("Picture/0_8.png");
  PeoPlePicture[1][0] = requestImage("Picture/1_0.png");
  PeoPlePicture[1][2] = requestImage("Picture/1_2.png");
  PeoPlePicture[1][3] = requestImage("Picture/1_3.png");
  PeoPlePicture[1][5] = requestImage("Picture/1_5.png");
  PeoPlePicture[1][10] = requestImage("Picture/1_10.png");
  PeoPlePicture[2][0] = requestImage("Picture/2_0.png");
  PeoPlePicture[2][5] = requestImage("Picture/2_5.png");
  PeoPlePicture[3][0] = requestImage("Picture/3_0.png");
  PeoPlePicture[3][1] = requestImage("Picture/3_1.png");
  PeoPlePicture[3][2] = requestImage("Picture/3_2.png");
  PeoPlePicture[3][3] = requestImage("Picture/3_3.png");
  PeoPlePicture[3][5] = requestImage("Picture/3_5.png");
  PeoPlePicture[3][7] = requestImage("Picture/3_7.png");
  PeoPlePicture[3][8] = requestImage("Picture/3_8.png");
  PeoPlePicture[3][9] = requestImage("Picture/3_9.png");
  PeoPlePicture[5][0] = requestImage("Picture/5_0.png");
  PeoPlePicture[6][0] = requestImage("Picture/6_0.png");
  
  ScriptTableWH[0] = 862;
  ScriptTableWH[1] = 178;
  ScriptText[13] = ScriptText[13].substring(0,20) + "\n" + ScriptText[13].substring(20,ScriptText[13].length());
  ScriptText[14] = ScriptText[14].substring(0,25) + "\n" + ScriptText[14].substring(25,ScriptText[14].length());
  ScriptText[15] = ScriptText[15].substring(0,33) + "\n" + ScriptText[15].substring(33,ScriptText[15].length());
  
  //Special Things Update Data
  for (int i = 0 ; i < 6 ; i ++) ScriptIcon[i] = requestImage("Picture/GameIcon_"+ (i+1) +".png");
  QSaveData[0] = -1;
  QSaveData[1] = -1;
  
  //LP Icon Random Set
  LPIcon[0] = requestImage("Picture/LP4000.png");
  for(int i = 1 ; i < 5 ; i ++) LPIcon[i] = requestImage("Picture/LPIcon_" + (i-1) + ".png");
  for (int i = 0; i < 4 ; i ++) {
    LPIconRate[i] = (80/2 + 39*i + LPIconInter*(i+1))/LPIconOnDownTime;
  }
  
  
  
  
  //LittleGame Page Data Load
  for(int i = 0 ; i < 4 ; i++){
    for(int k = 0 ; k < 2 ; k ++){
      PeoPleLogo[i][k] = requestImage("Picture/GTable_" + i + "_" + k + ".png");
    }
  }
  PeoPleLogoWH[0] = 160;
  PeoPleLogoWH[1] = 528;
  CloseIcon = requestImage("Picture/GTable_Exit.png");
  HendTail = (Mywidth - (PeoPleLogoWH[0]*4) - (LogoInterval*3))/2;
  ReadyIcon = requestImage("Picture/GTable_Ready.png");
  GoIcon = requestImage("Picture/GTable_Go.png");
  TimesUpIcon = requestImage("Picture/GTable_TimesUp.png");
  LRIcon[0] = requestImage("Picture/GTable_Left.png");
  LRIcon[1] = requestImage("Picture/GTable_Right.png");
  LRIconWH[0][0] = 15;
  LRIconWH[0][1] = 680;
  LRIconWH[1][0] = Mywidth-15-101;
  LRIconWH[1][1] = 680;
  TextTable = requestImage("Picture/GTable_TextTable.png");
  //Game1 Data Update
  for(int i = 0 ; i < 5 ; i++) Player_G1[i] = requestImage("Picture/G1_Character_" + i + ".png");
  for(int i = 0 ; i < 4 ; i++) Money_G1[i] = requestImage("Picture/G1_Money_" + i + ".png");
  Background_G1 = requestImage("Picture/G1_Background.jpg");
  PlayerSiteX_G1 = Mywidth/2 - Player_G1[2].width/2;
  PlayerSiteY_G1 = 480;
  //Game2 Data Update
  Player_G2 = requestImage("Picture/G2_Character_0.png");
  for(int i = 0 ; i < 5 ; i++) MoodBubble_G2[i] = requestImage("Picture/G2_PlayerMood_" + i + ".png");
  for(int i = 0 ; i < 19 ; i++) GameCard_G2[i] = requestImage("Picture/G2_Card_" + i + ".png");
  CardBackGround_G2 = requestImage("Picture/G2_CardBackground.png");
  BackGround_G2 = requestImage("Picture/G2_Background.jpg");
  for(int i = 0 ; i < 24 ; i++){ SpinCard_G2[i] = 0; SpinCardRate_G2[i] = 5; SpinCardTime_G2[i] = 0;}
  CheckSelect_G2[0]=99;
  CheckSelect_G2[1]=99;
  
  
}


void draw(){
  background(0);
  MyMouseX = mouseX; // - 43;
  //translate(43,0);
  
  switch (ScreenSet){
    
    case 0:
      StartPage();  
    break;
    case 1:
      MainGamePage();
    break;
    case 2:
      LittleGame_1();
    break;
    case 3:
      LittleGame_2();
    break;
    case 4:
      LittleGame_3();
    break;
    case 5:
      LittleGame_4();
    break;
    
  }
  
  if (ChangeBegin == true){
    if (ScreenSet == 0 && SelectLittleGameScreen == false) ChanceTypeSelect[0] = 0;
    if (ScreenSet == 1 && BackHomePage == false && QLoad == false) ChanceTypeSelect[0] = 1;
    if (BackHomePage == true && QLoad == false) ChanceTypeSelect[0] = 2;
    if (ScreenSet == 1 && QLoad == true && QSaveData[0] != -1){
      ChanceTypeSelect[0] = 3;
      CheckScriptIcon[1] = false;
    }
    for(int i = 0 ; i < 4 ; i ++) if (ScreenSet == 0 && SelectLittleGameScreen == true && GameSelect[i] == true){
      ChanceTypeSelect[0] = 4+i;
    }
    ChangeRun = true;
  }
  
  if (ChangeRun){
    ScreenChange(ChanceTypeSelect[0],ChanceTypeSelect[1]);
  }

  StopChange = max(0,StopChange -= 1);

}

void StartPage(){
  fill(0);
  tint(255, 255);
  image(StartPageBG,0,0);
  GameType = 0;
  BackHomePage = false;
  CheckToNext = 0;
    for (int i = 0 ; i < 6 ; i ++){
        if ((StartPageIconX < MyMouseX && MyMouseX < (StartPageIconX + StartPageIconWH[0]) && StartPageIconY[i] < mouseY && mouseY < (StartPageIconY[i]+StartPageIconWH[1]))) {
          if (SelectLittleGameScreen == false && CheckExitOn == false){
          image(StartPageIcon[i][1],StartPageIconX,StartPageIconY[i]);
          CheckStartPageIcon[i] = true;
          
          }else{
          image(StartPageIcon[i][0],StartPageIconX,StartPageIconY[i]);
          }
        }else{
          image(StartPageIcon[i][0],StartPageIconX,StartPageIconY[i]);
          CheckStartPageIcon[i] = false;
        }
      }  

  
  if(CheckExitOn) {
    fill(0,150);
     rect(0,0,Mywidth,height);
     image(ExitCheckTable,Mywidth/2-ExitCheckTable.width/2,height/2-ExitCheckTable.height/2);
     for(int i = 0 ; i < 2 ; i ++){
       if(MyMouseX > Mywidth/2-(ExitCheck[i][0].width+30)+(ExitCheck[i][0].width+60)*i && MyMouseX < Mywidth/2-30+(ExitCheck[i][0].width+60)*i && mouseY > height/2 && mouseY < height/2+ExitCheck[i][0].height){
        image(ExitCheck[i][1],Mywidth/2-(ExitCheck[i][0].width+30)+(ExitCheck[i][0].width+60)*i,height/2);
        ExitCheckIcon[i] = true;
       }else{
        image(ExitCheck[i][0],Mywidth/2-(ExitCheck[i][0].width+30)+(ExitCheck[i][0].width+60)*i,height/2);
        ExitCheckIcon[i] = false;
       }
       
     }
  }
  
  if(SelectLittleGameScreen) LittleGameBeginPage();
  
}



void MainGamePage(){
  
  if (CheckToNext <= ScriptText.length-1 && int(SpecialObject[CheckToNext]) == 1) CheckToNext += 1;
  if (CheckToNext <= ScriptText.length-1 && int(SpecialObject[CheckToNext]) >= 2){
    if (ScreenMoveOn == false){
      ShakeTime = 60+1;
      if (int(SpecialObject[CheckToNext])== 2) ShakeRate = 5;
      if (int(SpecialObject[CheckToNext])== 2) ShakeRate = 15;
      ScreenMoveOn = true;
    }
    if (ScreenMoveOn == true){
    ShakeTime = max(0,ShakeTime -=1);
    ShakeX = int(ShakeTime/ShakeRate);
    if (ShakeTime % 2 == 0) { ShakeX *= 1; }else{ ShakeX *= -1; }
    translate(ShakeX,0);
    if (ShakeTime == 0) {
        ScreenMoveOn = false;
        CheckToNext += 1;
      }
    }
    
  }
  //Background
  //People & Script
  if (CheckToNext < ScriptText.length-1){
    tint(255, 255); 
    image(BG[int(BGData[BGNext])],0,0);
    BackHomePage = false;
    if(PeoPleMoveType[CheckToNext].length() > 0) CharaCterAnimateSelect(int(PeoPleMoveType[CheckToNext]),PeoPlePicture[int(PeoPle1Type[CheckToNext])][int(PeoPle1Face[CheckToNext])],PeoPlePicture[int(PeoPle2Type[CheckToNext])][int(PeoPle2Face[CheckToNext])],PeoPleSite[CheckToNext],10,15);
    if(int(ChangeScenesOn[CheckToNext]) == 1) ChangeBegin = true;  
    if(int(ScriptOn[CheckToNext]) == 1) {
      if(CheckToNext == 24) ScriptLoad(CheckToNext,25,true,15);
      if(CheckToNext == 39 || CheckToNext == 57 || CheckToNext == 118) ScriptLoad(CheckToNext,48,true,15);
      if(CheckToNext != 24 && CheckToNext != 39 && CheckToNext != 57 && CheckToNext != 118) ScriptLoad(CheckToNext,25,false,0); 
    }
  }else if ( CheckToNext == ScriptText.length-1 ){
    ScriptLoad(ScriptText.length-1,25,false,0);
  }else{
    BackHomePage = true;
    ChangeBegin = true;
  }

  //ScriptIcon
  if(AutoReadOn == true && MousePressedOff == true) AutoScriptRead();
  if(SkipReadOn == true && MousePressedOff == true) SkipScriptRead();
  //LPIcon
  LPIconOnOff(60,60);
 
}




void LittleGameBeginPage(){

     fill(0,255*0.5);
     rect(0,0,Mywidth,height);
     if(ChangeRun == false){
       for (int i = 0 ; i < 2 ; i ++){
        if (MyMouseX > HendTail+(PeoPleLogoWH[0]+LogoInterval)*i && MyMouseX < HendTail+(PeoPleLogoWH[0]+LogoInterval)*i+PeoPleLogoWH[0] && mouseY > height/2-PeoPleLogoWH[1]/2 && mouseY < height/2+PeoPleLogoWH[1]/2){
          GameSelect[i] = true;
        }else{
          GameSelect[i] = false;
        }
       }
     }
     for (int i = 0 ; i < 4 ; i ++){
       if (GameSelect[i] == true) image(PeoPleLogo[i][0],HendTail+(PeoPleLogoWH[0]+LogoInterval)*i,height/2-PeoPleLogoWH[1]/2);
       if (GameSelect[i] == false) image(PeoPleLogo[i][1],HendTail+(PeoPleLogoWH[0]+LogoInterval)*i,height/2-PeoPleLogoWH[1]/2);
     }
    image(CloseIcon,Mywidth-CloseIcon.width-20,20);

}


void mouseClicked(){
  if(MousePressedOff == true){
  //StartPage Key
    if(ScreenSet == 0){
      if(CheckStartPageIcon[0]) ChangeBegin = true; 
      if(CheckStartPageIcon[2]) SelectLittleGameScreen = true;
      if(CheckStartPageIcon[5]) CheckExitOn = true;
      if(ExitCheckIcon[0] == true && CheckExitOn == true) ;//exit();
      if(ExitCheckIcon[1] == true && CheckExitOn == true) {CheckExitOn = false; ExitCheckIcon[1]=false;}
      if(SelectLittleGameScreen == true && MyMouseX > Mywidth-CloseIcon.width-20 && MyMouseX < Mywidth-20 && mouseY > 20 && mouseY < 20+CloseIcon.height) SelectLittleGameScreen = false;
      if(SelectLittleGameScreen){
         for (int i = 0 ; i < 4 ; i ++){
           if(GameSelect[i]) ChangeBegin = true;
           if(GameSelect[i] == true && i == 1) CardNumber_G2 = SetNumber_G2(24,18); //SetNumber(int Quantity,int MaxNumber) the Quantity size can't bigger then MaxNumber*2
         }
      }
    }
    //GamePage Key
    if(ScreenSet == 1){
      if(CheckScriptIcon[0] == false && CheckScriptIcon[1] == false && CheckScriptIcon[2] == false && CheckScriptIcon[3] == false && CheckScriptIcon[4] == false && CheckScriptIcon[5] == false && LPIconCheck[0] == false && LPIconCheck[1] == false && LPIconCheck[2] == false && LPIconCheck[3] == false && LPIconCheck[4] == false){ 
          if(StopChange == 0) {
          CheckToNext += 1;
          StopChange += 10;
            }
          BGNext = CheckToNext;
          SiteStartSet = true;
          PeoPleTransparency = 0;
          PeoPleMove = 0;
          AutoReadOn = false;
          SkipReadOn = false;
      }
      //GameIcon
      if (CheckScriptIcon[2]) {
        AutoReadOn =! AutoReadOn; 
        CheckScriptIcon[2] = false;
        SkipReadOn = false;
      }
      if (CheckScriptIcon[3]) {
        SkipReadOn =! SkipReadOn;
        CheckScriptIcon[3] = false;
        AutoReadOn = false;
      }
      if (CheckScriptIcon[0] == true && QLoad == false) {
        QSaveData[0] = CheckToNext;
        QSaveData[1] = BGNext;
        CheckScriptIcon[0] = false;
      }
      if (CheckScriptIcon[1] == true && QSaveData[0]>0){
        QLoad = true;
        ChangeBegin = true;
        CheckScriptIcon[1] = false;
      }
      if(LPIconCheck[0]){ LPIconOn =! LPIconOn; }
      if(LPIconOn == true && LPIconCheck[0] == false && LPIconCheck[1] == false && LPIconCheck[2] == false && LPIconCheck[3] == false && LPIconCheck[4] == false) LPIconOn = false;
    }
    
    //Game_2 Set
    if(ScreenSet == 3){
      for (int i = 0 ; i < 24 ; i ++){
        if(GameCardCheck_G2[i]){
          if(GameCardOn_G2[i][1] == false){
            GameCardOn_G2[i][0] = true;
            GameCardOn_G2[i][2] = true;
          }
        }else{
          GameCardOn_G2[i][0] = false;
        }
      }
    }
  } 
}


void mousePressed(){
 //Game_1
  if (MousePressedOff == true && ScreenSet == 2 && ReadyGoOn == false){
    if (MyMouseX > LRIconWH[0][0] && MyMouseX < (LRIconWH[0][0]+LRIcon[0].width) && mouseY > LRIconWH[0][1] && mouseY < (LRIconWH[0][1]+LRIcon[0].height) && RunRight == false){
      RunLeft = true;
    }
    if (MyMouseX > LRIconWH[1][0] && MyMouseX < (LRIconWH[1][0]+LRIcon[1].width) && mouseY > LRIconWH[1][1] && mouseY < (LRIconWH[1][1]+LRIcon[1].height) && RunLeft == false){
      RunRight = true;
    }
  } 
  
}

void mouseReleased(){
  RunLeft = false;
  RunRight = false;
  
}



void ScreenChange(int ChangeType,int Rate){
 MousePressedOff = false;
 AutoReadOn = false;
 SkipReadOn = false;
 fill(0,0,0,max(0,min(255,CahangeRect[0] += CahangeRect[1]*Rate))); 
 rect(0,0,Mywidth,height);
 if (CahangeRect[0] >= 255){
  CahangeRect[0] = 255;
  CahangeRect[1] *= -1;
  ScreenChangeType_Before(ChangeType);
 }
 if (CahangeRect[0] <= 0){
  CahangeRect[0] = 0;
  CahangeRect[1] *= -1;
  ChangeBegin = false;
  MousePressedOff = true;
  QLoad = false;
  ChangeRun = false;
  ScreenChangeType_After(ChangeType);
 }
 
}

    void ScreenChangeType_Before(int ChangeType){ //0~7
      if (ChangeType == 0) ScreenSet = 1; 
      if (ChangeType == 1) BGNext += 1;
      if (ChangeType == 2) ScreenSet = 0;
      if (ChangeType == 3) { 
        CheckToNext = QSaveData[0]; 
        BGNext = QSaveData[1]; 
      }
      for (int k = 0 ; k < 4 ; k ++){
        if (ChangeType == k+4) ScreenSet = k+2;
        GameSelect[k] = false;
        SelectLittleGameScreen = false;
      } 
      if (ChangeType == 8) GameType = 2;
    }
    
    void ScreenChangeType_After(int ChangeType){
      if (ChangeType == 4) ReadyGoOn = true;
      if (ChangeType == 5) ReadyGoOn = true;
      if (ChangeType == 0) CheckToNext = 1;
      if (ChangeType == 1) CheckToNext += 1;
    
    }






void ScriptLoad(int ScriptTextNumber,int ScriptTextSize,boolean DiffColor,int DiffColorBeginNumber){
  tint(255, 255*0.8);
  image(ScriptTable[0],Mywidth/2-ScriptTableWH[0]/2,height-ScriptTableWH[1]-30,ScriptTable[0].width,ScriptTable[0].height);
  if(ScriptPeoPleName[ScriptTextNumber].length() > 0) image(ScriptTable[1],30,400,ScriptTable[1].width,ScriptTable[1].height);
  textSize(28);
  if(ScriptPeoPleName[ScriptTextNumber].length() > 0) text(ScriptPeoPleName[ScriptTextNumber],30+(ScriptTable[1].width/2)-(textWidth(ScriptPeoPleName[ScriptTextNumber])/2),442);
  textLeading(0); 
  textSize(ScriptTextSize);
  if (DiffColor && ScriptText[ScriptTextNumber].length() > DiffColorBeginNumber) {
    fill(200,0,0);
    text(ScriptText[ScriptTextNumber],Mywidth/2-ScriptTableWH[0]/2+50,height-ScriptTableWH[1]-30+40,ScriptTableWH[0]-100,ScriptTableWH[1]-80);
      fill(0);
    text(ScriptText[ScriptTextNumber].substring(0,DiffColorBeginNumber-1),Mywidth/2-ScriptTableWH[0]/2+50,height-ScriptTableWH[1]-30+40,ScriptTableWH[0]-100,ScriptTableWH[1]-80);
  }else{
    if (CheckToNext > 6 && CheckToNext < 13){
      fill(70);
    }else{
      fill(0);
    }
    text(ScriptText[ScriptTextNumber],int(Mywidth/2-ScriptTableWH[0]/2+50),height-ScriptTableWH[1]-30+40,ScriptTableWH[0]-100,ScriptTableWH[1]-80);
  }
  tint(255, 255);
  //SprintIcon
  ScriptIconUpdate();
}

void CharaCterAnimateSelect(int SelectType,PImage PeoPleNumber1Select,PImage PeoPleNumber2Select,String SiteSet,int MRateSet,int TRateSet){
  switch (SelectType){
    
    case 0:
    OnePeoPle(PeoPleNumber1Select,SiteSet,true,TRateSet);
    break;
    case 1:
    OnePeoPle(PeoPleNumber1Select,SiteSet,false,TRateSet);
    break;
    case 2:
    TwoPeoPle(PeoPleNumber1Select,PeoPleNumber2Select,true,TRateSet);
    break;
    case 3:
    TwoPeoPle(PeoPleNumber1Select,PeoPleNumber2Select,false,TRateSet);
    break;
    case 6:
    OneToTwoPeoPle(PeoPleNumber1Select,PeoPleNumber2Select,SiteSet,MRateSet,false,TRateSet);
    break;
    case 10:
    OnePeoPleOff(PeoPleNumber1Select,SiteSet,TRateSet);
    break;
    case 11:
    TwoPeoPleOff(PeoPleNumber1Select,PeoPleNumber2Select,TRateSet);
    break;
    
  }
  
}



void OnePeoPle(PImage PeoPleNumber,String Site,boolean TransparencyOpen,int TransparencyRate){
  if (TransparencyOpen) {tint(255, min(255,(PeoPleTransparency += TransparencyRate))); } else { tint(255, 255); }
  if (Site == "Left") image(PeoPleNumber,0,PeoPleCeilingDistance);
  if (Site == "Mid") image(PeoPleNumber,Mywidth/2-PeoPleNumber.width/2,PeoPleCeilingDistance);
  if (Site == "Right") image(PeoPleNumber,Mywidth-PeoPleNumber.width,PeoPleCeilingDistance);

}

void TwoPeoPle(PImage PeoPleNumber1,PImage PeoPleNumber2,boolean TransparencyOpen,int TransparencyRate){
  if (TransparencyOpen) {tint(255, min(255,(PeoPleTransparency += TransparencyRate))); } else { tint(255, 255); }
  image(PeoPleNumber1,0,PeoPleCeilingDistance);
  image(PeoPleNumber2,Mywidth-PeoPleNumber2.width,PeoPleCeilingDistance); 
}

void ThreePeoPle(PImage PeoPleNumber1,PImage PeoPleNumber2,PImage PeoPleNumber3,boolean TransparencyOpen,int TransparencyRate){
  if (TransparencyOpen) {tint(255, min(255,(PeoPleTransparency += TransparencyRate))); } else { tint(255, 255); }
  image(PeoPleNumber1,0,PeoPleCeilingDistance);
  image(PeoPleNumber2,Mywidth/2-PeoPleNumber2.width/2,PeoPleCeilingDistance);
  image(PeoPleNumber3,Mywidth-PeoPleNumber3.width,PeoPleCeilingDistance); 
}

void OneToTwoPeoPle(PImage PeoPleNumber1,PImage PeoPleNumber2,String Site,int Rate,boolean TransparencyOpen,int TransparencyRate){
  tint(255, 255);
  if (SiteStartSet){ 
    if (Site == "Left"){ PeoPleMove = 0; }else if (Site == "Mid"){ PeoPleMove = Mywidth/2-PeoPleNumber1.width/2; } 
    SiteStartSet = false; 
  }
  image(PeoPleNumber1,min(PeoPleMove,Mywidth-PeoPleNumber1.width),PeoPleCeilingDistance);
  PeoPleMove = min(Mywidth*2,PeoPleMove += Rate);
  if (PeoPleMove >= Mywidth-PeoPleNumber1.width){
    if (TransparencyOpen) {tint(255, min(255,(PeoPleTransparency += TransparencyRate))); } else { tint(255, 255); }
    image(PeoPleNumber2,0,PeoPleCeilingDistance);
    if (TransparencyOpen) { if(PeoPleTransparency >= 255){ MousePressedOff = true; }else{ MousePressedOff = false; } }else{ MousePressedOff = true; }
  }else{
    MousePressedOff = false;
  }
}

void OneToThreePeoPle(PImage PeoPleNumber1,PImage PeoPleNumber2,PImage PeoPleNumber3,String Site,int Rate,boolean TransparencyOpen,int TransparencyRate){
  tint(255, 255);
  if (SiteStartSet){ 
    if (Site == "Left"){ PeoPleMove = 0; }else if (Site == "Mid"){ PeoPleMove = Mywidth/2-PeoPleNumber1.width/2; } 
    SiteStartSet = false; 
  }
  image(PeoPleNumber1,min(PeoPleMove,Mywidth-PeoPleNumber1.width),PeoPleCeilingDistance);
  PeoPleMove = min(Mywidth*2,PeoPleMove += Rate);
  if (PeoPleMove >= Mywidth-PeoPleNumber1.width){
    if (TransparencyOpen) {tint(255, min(255,(PeoPleTransparency += TransparencyRate))); } else { tint(255, 255); }
    image(PeoPleNumber2,0,PeoPleCeilingDistance);
    image(PeoPleNumber3,Mywidth/2-PeoPleNumber3.width/2,PeoPleCeilingDistance);
    if (TransparencyOpen) { if(PeoPleTransparency >= 255){ MousePressedOff = true; }else{ MousePressedOff = false; } }else{ MousePressedOff = true; }
  }else{
    MousePressedOff = false;
  }
}


void OnePeoPleOff(PImage PeoPleNumber,String Site,int TransparencyRate){
  tint(255, min(255,255-(PeoPleTransparency += TransparencyRate)));
  if (Site == "Left") image(PeoPleNumber,0,PeoPleCeilingDistance);
  if (Site == "Mid") image(PeoPleNumber,Mywidth/2-PeoPleNumber.width/2,PeoPleCeilingDistance);
  if (Site == "Right") image(PeoPleNumber,Mywidth-PeoPleNumber.width,PeoPleCeilingDistance);
  if (255-(PeoPleTransparency += TransparencyRate) <= 0){
    MousePressedOff = true;
  }else{
    MousePressedOff = false;
  }
}
void TwoPeoPleOff(PImage PeoPleNumber1,PImage PeoPleNumber2,int TransparencyRate){
  tint(255, min(255,255-(PeoPleTransparency += TransparencyRate)));
  image(PeoPleNumber1,0,PeoPleCeilingDistance);
  image(PeoPleNumber2,Mywidth-PeoPleNumber2.width,PeoPleCeilingDistance); 
  if (255-(PeoPleTransparency += TransparencyRate) <= 0){
    MousePressedOff = true;
  }else{
    MousePressedOff = false;
  }
}
void ThreePeoPleOff(PImage PeoPleNumber1,PImage PeoPleNumber2,PImage PeoPleNumber3,int TransparencyRate){
  tint(255, min(255,255-(PeoPleTransparency += TransparencyRate)));
  image(PeoPleNumber1,0,PeoPleCeilingDistance);
  image(PeoPleNumber2,Mywidth/2-PeoPleNumber2.width/2,PeoPleCeilingDistance);
  image(PeoPleNumber3,Mywidth-PeoPleNumber3.width,PeoPleCeilingDistance); 
  if (255-(PeoPleTransparency += TransparencyRate) <= 0){
    MousePressedOff = true;
  }else{
    MousePressedOff = false;
  }
}


void AutoScriptRead(){
    AutoReadGo += 1;
    if (AutoReadGo % AutoReadRate == 0) {CheckToNext = min(ScriptText.length-1,CheckToNext += 1); BGNext = CheckToNext;}
}

void SkipScriptRead(){
    SkipReadGo += 1;
    if (SkipReadGo % SkipReadRate == 0) {CheckToNext = min(ScriptText.length-1,CheckToNext += 1); BGNext = CheckToNext;}
}

void ScriptIconUpdate(){
 for (int i = 0 ; i < 6 ; i ++) {
   if(MousePressedOff){
     if (MyMouseX > Mywidth/2+ScriptTableWH[0]/2-(ScriptIcon[i].width*(6-i))-0*(5-i)-20 && MyMouseX < Mywidth/2+ScriptTableWH[0]/2-(ScriptIcon[i].width*(5-i))-0*(5-i)-30 && mouseY > height-ScriptTableWH[1]-ScriptIcon[i].height-40 && mouseY < height-ScriptTableWH[1]-30){
       CheckScriptIcon[i] = true; 
       tint(255,255);
     }else{
       CheckScriptIcon[i]=false;
       tint(255,255*0.7);
       }
   }
   image(ScriptIcon[i],Mywidth/2+ScriptTableWH[0]/2-(ScriptIcon[i].width*(6-i))-0*(5-i)-20,height-ScriptTableWH[1]-ScriptIcon[i].height-30);
   tint(255,255);
 }
}

void LPIconOnOff(int X,int Y){
  if (MyMouseX > X && MyMouseX < (X+LPIcon[0].width) && mouseY > Y && mouseY < (Y+LPIcon[0].height)){
    LPIconCheck[0] = true;
  }else{
    LPIconCheck[0] = false;
  }
  if (LPIconOn){
    
    for (int i = 0; i < 4 ; i ++){
      LPIconY[i] = min((Y+LPIcon[0].height + LPIcon[1].height*i + LPIconInter*(i+1)),LPIconY[i] += LPIconRate[i]);
      image(LPIcon[i+1],(X+LPIcon[0].width/2-LPIcon[1].width/2),LPIconY[i] );
      if(MyMouseX > (X+LPIcon[0].width/2-LPIcon[1].width/2) && MyMouseX < (X+LPIcon[0].width/2+LPIcon[1].width/2) && mouseY > LPIconY[i] && mouseY < LPIconY[i]+LPIcon[1].height){
        LPIconCheck[i+1] = true;
      }else{
        LPIconCheck[i+1] = false;
      }
    }
  }else{
    
    for (int i = 0; i < 4 ; i ++) {
      LPIconY[i] = max((Y+LPIcon[0].height/2-LPIcon[1].height/2),LPIconY[i] -= LPIconRate[i]);
      image(LPIcon[i+1],(X+LPIcon[0].width/2-LPIcon[1].width/2),LPIconY[i] );
    }
  }
  
  image(LPIcon[0],X,Y);
}


void LittleGame_1(){
  
  switch (GameType){
  
  case 0:
  PlayTime_G1 = 1800;
  GameType =1;
  PlayerPoint_G1 = 0;
  for(int i = 0 ; i < 7 ; i ++){
    MoneyType_G1[i] = 0;
    MoneyPoint_G1[i] = 0; 
    MoneyDown_G1[i] = 0;
    MoneyDownRate_G1[i] = 0;
    MoneyOn_G1[i] = false;
    }
  break;
  case 1:
    image(Background_G1,0,0);
    fill(255);
    image(TextTable,0,0);
    image(TextTable,Mywidth-TextTable.width,0);
    text("Score:" + PlayerPoint_G1,TextTable.width/2-textWidth("Score:" + PlayerPoint_G1)/2,TextTable.height/2+16);
    text("Time:" + int(PlayTime_G1/60),Mywidth-160,TextTable.height/2+16);
    fill(0);
    Game_ReadyGoMove(50);
    Game_TimeIsUpMove(50);
    if (ReadyGoOn == false && MousePressedOff == true){
      PlayTime_G1 = max(0,PlayTime_G1 -= 1);
      //Money Site
      for(int i = 0 ; i < 7 ; i ++){
        if (MoneyOn_G1[i] == false){
          if (int(random(20)) == 4){
            MoneyOn_G1[i] = true;
            MoneyType_G1[i] = int(random(100));
            if (MoneyType_G1[i] > 30) {
              MoneyType_G1[i] = 0;
              MoneyPoint_G1[i] = 100; 
              MoneyDown_G1[i] = 0-Money_G1[0].height;
              MoneyDownRate_G1[i] = 5;
            }else if (MoneyType_G1[i] > 15) { 
              MoneyType_G1[i] = 1;
              MoneyPoint_G1[i] = 600; 
              MoneyDown_G1[i] = 0-Money_G1[1].height;
              MoneyDownRate_G1[i] = 10;
            }else if (MoneyType_G1[i] > 5){
              MoneyType_G1[i] = 2;
              MoneyPoint_G1[i] = -300; 
              MoneyDown_G1[i] = 0-Money_G1[2].height;
              MoneyDownRate_G1[i] = 5;
            }else{
              MoneyType_G1[i] = 3;
              MoneyPoint_G1[i] = -99999; 
              MoneyDown_G1[i] = 0-Money_G1[3].height;
              MoneyDownRate_G1[i] = 5;
            }
            MoneySite_G1[i] = int(random((Mywidth-Money_G1[0].width)));
          }
        }
      }
      for (int i = 0 ; i < 5 ; i ++){
        if(MoneyOn_G1[i]){
          MoneyDown_G1[i] += MoneyDownRate_G1[i];
          image(Money_G1[MoneyType_G1[i]],MoneySite_G1[i],MoneyDown_G1[i]);
          if(((MoneySite_G1[i]+Money_G1[0].width*CatchCoef > PlayerSiteX_G1+PlayerWHChange && MoneySite_G1[i]+Money_G1[int(MoneyType_G1[i])].width*CatchCoef < PlayerSiteX_G1+Player_G1[0].width-PlayerWHChange) || (MoneySite_G1[i]+Money_G1[int(MoneyType_G1[i])].width*(1-CatchCoef) > PlayerSiteX_G1+PlayerWHChange && MoneySite_G1[i]+Money_G1[int(MoneyType_G1[i])].width*(1-CatchCoef) < PlayerSiteX_G1+Player_G1[0].width-PlayerWHChange)) && (MoneyDown_G1[i] > PlayerSiteY_G1+PlayerWHChange && MoneyDown_G1[i] < PlayerSiteY_G1+Player_G1[int(MoneyType_G1[i])].height-PlayerWHChange) && BombLog_G1 == false){
            PlayerPoint_G1 = max(0,PlayerPoint_G1 += MoneyPoint_G1[i]);
            if(MoneyType_G1[i] >= 2) BombTime_G1 += 90;
            MoneyOn_G1[i] = false;
          }
          if(MoneyDown_G1[i] > height){
            MoneyOn_G1[i] = false;
          }
        }
      }
      
      
      //PlayerSite
      BombTime_G1 = max(0,BombTime_G1-=1);
      if (BombTime_G1 > 0){
        BombLog_G1 = true;
        PlayerRate_G1 = 4;
        tint(255,255*(BombTime_G1%2));
      }else{
        BombLog_G1 = false;
        PlayerRate_G1 = 7;
      }
      if (RunLeft == true && RunRight == false){
        PlayerSiteX_G1 = max(0,PlayerSiteX_G1 -= PlayerRate_G1);
        image(Player_G1[int((ChangePlayer_G1+=0.05)%2)+3],PlayerSiteX_G1,PlayerSiteY_G1);
      }
      if (RunLeft == false && RunRight == true){
        PlayerSiteX_G1 = min(Mywidth-Player_G1[0].width,PlayerSiteX_G1 += PlayerRate_G1);
        image(Player_G1[int((ChangePlayer_G1+=0.05)%2)],PlayerSiteX_G1,PlayerSiteY_G1);
      }
    }
    
    if (RunLeft == false && RunRight == false) image(Player_G1[2],PlayerSiteX_G1,PlayerSiteY_G1);
    
    tint(255,255*0.8);
    image(LRIcon[0],LRIconWH[0][0],LRIconWH[0][1]);
    image(LRIcon[1],LRIconWH[1][0],LRIconWH[1][1]);
    tint(255,255);
    
    if (int(PlayTime_G1/60) == 0){
      if(MousePressedOff) TimeIsUPOn = true; 
      MousePressedOff = false;
    }else{
      TimeIsUPOn = false;
    }
    break;
    
    case 2:
    MousePressedOff = true;
    BackHomePage = true;
    ChangeBegin = true;
    break;
  }
  
}

void LittleGame_2(){
  
  switch (GameType){
  
  case 0:
  
  PlayTime_G2 = 1800;
  GameType =1;
  
  break;  
  case 1:
    fill(255);
    image(BackGround_G2,0,0);
    image(CardBackGround_G2,(int((1.8*Mywidth/5-(GameCard_G2[0].width*6+10*5)/2))+(GameCard_G2[0].width*6 + 10*5)/2) - CardBackGround_G2.width/2,((height/2-(GameCard_G2[0].height*4+10*3)/2)+(GameCard_G2[0].height*4 + 10*3)/2) - CardBackGround_G2.height/2);
    image(TextTable,Mywidth-TextTable.width,0);
    image(TextTable,Mywidth-TextTable.width,TextTable.height + 10);
    fill(255);
    textSize(28);
    text("Time:" + int(PlayTime_G2/60),Mywidth-160,TextTable.height/2+16);
    text("Score:" + PlayerPoint_G2,Mywidth-160,3*TextTable.height/2+16+10);
    textSize(32);
    
    if(ReadyGoOn == false && SpinFirst_G2 == false){
    PlayTime_G2 = max(0,PlayTime_G2-= 1);
      for (int i = 0 ; i < 6 ; i ++){
        for (int k = 0 ; k < 4 ; k ++){
           CardWidth_G2 = int((1.8*Mywidth/5-(GameCard_G2[0].width*6+10*5)/2))+(GameCard_G2[0].width*i + 10*i);
           CardHeight_G2 = (height/2-(GameCard_G2[0].height*4+10*3)/2)+(GameCard_G2[0].height*k + 10*k);
          
           if(MyMouseX > CardWidth_G2 && MyMouseX < CardWidth_G2+GameCard_G2[0].width && mouseY > CardHeight_G2 && mouseY < CardHeight_G2 + GameCard_G2[0].height){
             GameCardCheck_G2[i*4+k] = true;
           }else{
             GameCardCheck_G2[i*4+k] = false;
           }
           //GameCardOn[i][0]
           G2_CardSpinOn(GameCard_G2[CardNumber_G2[i*4+k]],CardHeight_G2,CardWidth_G2,i*4+k);
           
           if(CheckSelect_G2[0] != 99 && CheckSelect_G2[1] != 99 ){ //&& SpinCardAllTime_G2 % 2 == 0
             if(CheckSelect_G2[0] != CheckSelect_G2[1]){
               GameCardOn_G2[CheckSelect_G2[2]][0] = true;
               GameCardOn_G2[CheckSelect_G2[3]][0] = true;
               CheckSelect_G2[0] = 99;
               CheckSelect_G2[1] = 99;
               MoodBubbleOn_G2 += 60;
               FalseTime_G2 += 1;
               TrueTime_G2 = 0;
               if (FalseTime_G2 > 5){ 
                  MoodNo_G2 = 2; 
                }else if (FalseTime_G2 > 2){ 
                  MoodNo_G2 = 1; 
                }else if (FalseTime_G2 > 0){
                  MoodNo_G2 = 0;
                }
                
             }else{
               CheckSelect_G2[0] = 99;
               CheckSelect_G2[1] = 99;
               PlayerPoint_G2 += 100;           
               MoodBubbleOn_G2 += 60;
               FalseTime_G2 = 0;
               TrueTime_G2 += 1;
               if (TrueTime_G2 > 2){ 
                  MoodNo_G2 = 3; 
                }else if (TrueTime_G2 > 0){
                  MoodNo_G2 = 4;
                }
                
             }
            }
        }
      }
    }
    G2_FirstSpin();
    //println(ReadyGoOn +"," + MousePressedOff + "," + SpinFirst_G2 + "," + SpinCardFirst_G2);
    fill(0);
    image(Player_G2,650,450);
    if(MoodBubbleOn_G2 > 0) image(MoodBubble_G2[MoodNo_G2],630,355);

    MoodBubbleOn_G2 = max(0,MoodBubbleOn_G2 -= 1);
    Game_ReadyGoMove(50);
    Game_TimeIsUpMove(50);
    if (int(PlayTime_G2/60) == 0){
      if(MousePressedOff) TimeIsUPOn = true; 
      MousePressedOff = false;
    }else{
      TimeIsUPOn = false;
    }
  break;
  case 2:
  
  PlayerPoint_G2 = 0;
  FalseTime_G2 = 0;
  TrueTime_G2 = 0;
  SpinCardAllTime_G2 = 0;
  CheckSelect_G2[0] = 99;
  CheckSelect_G2[1] = 99;
  for(int i = 0 ; i < 24 ; i ++){
    SpinCardTime_G2[i] = 0;
   for(int k = 0 ; k < 3 ; k ++){
     GameCardOn_G2[i][k] = false;
   }
  }
  ReadyGoOn = false;
  SpinFirst_G2 = true;
  BackHomePage = true;
  ChangeBegin = true;
  
  break;
  }

}

void G2_FirstSpin(){
  if(SpinFirst_G2 == true){
    
    if(ReadyGoOn == false && MousePressedOff == true){
       SpinCardFirst_G2 = max(0,min(GameCard_G2[18].width,SpinCardFirst_G2 += SpinCardRateFirst_G2));
       if (SpinCardFirst_G2 == GameCard_G2[18].width){
          SpinCardRateFirst_G2 *= -1;
          SpinCardTimeFirst_G2 = 1;
       }else if(SpinCardFirst_G2 == 0){
          SpinCardRateFirst_G2 *= -1;
          if(ScreenSet == 3) SpinFirst_G2 = false;
       }   
    }
    
    for (int i = 0 ; i < 6 ; i ++){
      for (int k = 0 ; k < 4 ; k ++){
         CardWidth_G2 = int((1.8*Mywidth/5-(GameCard_G2[0].width*6+10*5)/2))+(GameCard_G2[0].width*i + 10*i);
         CardHeight_G2 = (height/2-(GameCard_G2[0].height*4+10*3)/2)+(GameCard_G2[0].height*k + 10*k);
         if(ReadyGoOn ==  MousePressedOff){
           image(GameCard_G2[CardNumber_G2[i*4+k]],CardWidth_G2,CardHeight_G2);
         }else{
          if (SpinCardTimeFirst_G2 == 1){
             image(GameCard_G2[18],CardWidth_G2+SpinCardFirst_G2/2,CardHeight_G2,GameCard_G2[0].width-SpinCardFirst_G2,GameCard_G2[0].height);
           }else{
             image(GameCard_G2[CardNumber_G2[i*4+k]],CardWidth_G2+SpinCardFirst_G2/2,CardHeight_G2,GameCard_G2[0].width-SpinCardFirst_G2,GameCard_G2[0].height);
           } 
         }
      }
    }
  }
}

void G2_CardSpinOn(PImage Card,int CardH,int CardW,int Who){
  //GameCardOn[Who][0] = Run GameCardOn[Who][1] = save on card No GameCardOn[Who][2] = save who is on
  if(GameCardOn_G2[Who][0] == true){
    MousePressedOff = false;
    SpinCard_G2[Who] = max(0,min(GameCard_G2[18].width,SpinCard_G2[Who] += SpinCardRate_G2[Who]));
    if (SpinCard_G2[Who] == 0 || SpinCard_G2[Who] == GameCard_G2[18].width) SpinCardTime_G2[Who]+=1;
    if (SpinCard_G2[Who] == GameCard_G2[18].width){
      SpinCardRate_G2[Who] *= -1;
    }else if(SpinCard_G2[Who] == 0){
      SpinCardRate_G2[Who] *= -1;
      GameCardOn_G2[Who][1] =! GameCardOn_G2[Who][1];
      GameCardOn_G2[Who][0] = false;
      SpinCardAllTime_G2 += 1;
      MousePressedOff = true;
    }
  }

  if (GameCardOn_G2[Who][2] == true && GameCardOn_G2[Who][0] == false){
    if(CheckSelect_G2[0] != 99){ CheckSelect_G2[1] = CardNumber_G2[Who]; CheckSelect_G2[3] = Who; }else{ CheckSelect_G2[0] = CardNumber_G2[Who]; CheckSelect_G2[2] = Who; }
    GameCardOn_G2[Who][2] = false;
  }
  if (SpinCardTime_G2[Who] % 4 == 1 || SpinCardTime_G2[Who] % 4 == 2){
     image(Card,CardW+SpinCard_G2[Who]/2,CardH,GameCard_G2[0].width-SpinCard_G2[Who],GameCard_G2[0].height);
   }else{
     image(GameCard_G2[18],CardW+SpinCard_G2[Who]/2,CardH,GameCard_G2[0].width-SpinCard_G2[Who],GameCard_G2[0].height);
   }
}

void LittleGame_3(){
  background(255,0,0);
  
}

void LittleGame_4(){
  background(0,255,255);
  
  
}


void Game_ReadyGoMove(float Rate){
  if(ReadyGoOn){
    ReadyGoRate += (1/Rate);
    if(ReadyGoRate <= 1.7) image(ReadyIcon,Mywidth/2-(ReadyIcon.width*(min(1,ReadyGoRate)))/2,height/5,ReadyIcon.width*min(1,ReadyGoRate),ReadyIcon.height*min(1,ReadyGoRate));
    if(ReadyGoRate > 1.7 && ReadyGoRate <= 3.0) image(GoIcon,Mywidth/2-GoIcon.width/2,height/5);
    if(ReadyGoRate > 3.0){
      ReadyGoRate = 0;
      ReadyGoOn = false;
    }
  }
}

void Game_TimeIsUpMove(float Rate){
  if(TimeIsUPOn){
    TimeIsUPRate += (1/Rate);
    if(TimeIsUPRate <= 1.7) image(TimesUpIcon,Mywidth/2-(TimesUpIcon.width*(min(1,TimeIsUPRate)))/2,height/5,TimesUpIcon.width*min(1,TimeIsUPRate),TimesUpIcon.height*min(1,TimeIsUPRate));
    if(TimeIsUPRate > 2.5){
      TimeIsUPRate = 0;
      TimeIsUPOn = false;
      ChanceTypeSelect[0] = 8;
      ChangeRun = true;
    }
  }
  
}


void keyPressed() {
  if (key == CODED && MousePressedOff == true && ScreenSet == 2 && ReadyGoOn == false) { // detect special keys 
    switch (keyCode) {
      case LEFT:
        RunLeft = true;
        RunRight = false;
        break;
      case RIGHT:
        RunRight = true;
        RunLeft = false;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case LEFT:
        RunLeft = false;
        break;
      case RIGHT:
        RunRight = false;
        break;
    }
  }
}



int ScreenSet = 0;

//ScreenChange Random Set
int [] CahangeRect = new int[2];
boolean ChangeBegin = false;
boolean MousePressedOff = true;
boolean MousePressedOff2 = true;

//StartPage Random Set
PImage StartPageBG;
PImage [] StartPageIcon = new PImage [6];
int StartPageIconGap = 30;
int [][] StartPageIconXY = new int [2][3];
int [] StartPageIconWH = new int [2];
boolean [] CheckStartPageIcon = new boolean [3];

//GamePage Random Set
PImage [] ScriptTable = new PImage[2]; //Table = 1201*334 Name = 281*89
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

void setup(){
  size(1280,960);
  frameRate(120);
  ScriptTextType = createFont("Type.ttf", 32);
  textFont(ScriptTextType);
  CahangeRect[0] = 0;
  CahangeRect[1] = 1;
  rectMode(CORNER);
  //StartPage Data Load
  ScreenSet = 0;
  for (int i = 0 ; i < 3 ; i ++) CheckStartPageIcon[i] = false;
  StartPageBG = loadImage("Picture/TitlePage.jpg");
  StartPageIcon[0] = loadImage("Picture/Start_A.jpg");
  StartPageIcon[1] = loadImage("Picture/Start_B.jpg");
  StartPageIcon[2] = loadImage("Picture/Continue_A.jpg");
  StartPageIcon[3] = loadImage("Picture/Continue_B.jpg");
  StartPageIcon[4] = loadImage("Picture/Exit_A.jpg");
  StartPageIcon[5] = loadImage("Picture/Exit_B.jpg");
  StartPageIconWH[0] = 421;
  StartPageIconWH[1] = 108;
  StartPageIconXY[0][0] = width/2-StartPageIconWH[0]/2;
  StartPageIconXY[0][1] = width/2-StartPageIconWH[0]/2;
  StartPageIconXY[0][2] = width/2-StartPageIconWH[0]/2;
  StartPageIconXY[1][0] = height-(StartPageIconWH[1]*3)-50-(StartPageIconGap*2);
  StartPageIconXY[1][1] = height-(StartPageIconWH[1]*2)-50-StartPageIconGap;
  StartPageIconXY[1][2] = height-StartPageIconWH[1]-50;
  
  //GamePage Data Load
  ScriptText = loadStrings("Data/Script_Text.txt"); //No.23 need to change color on Number_15
  ScriptOn = loadStrings("Data/Script_On.txt");
  ScriptPeoPleName = loadStrings("Data/Script_PeoPleName.txt");
  ChangeScenesOn = loadStrings("Data/ChangeScenes_On.txt");
  PeoPle1Type = loadStrings("Data/Character/Character_No1.txt");
  PeoPle1Face = loadStrings("Data/Character/Character_No1_Face.txt");
  PeoPle2Type = loadStrings("Data/Character/Character_No2.txt");
  PeoPle2Face = loadStrings("Data/Character/Character_No2_Face.txt");
  PeoPleMoveType = loadStrings("Data/Character/Character_MoveType.txt");
  PeoPleSite = loadStrings("Data/Character/Character_Site.txt");
  SpecialObject = loadStrings("Data/SpecialObject.txt");
  BGData = loadStrings("Data/BackGround_Change.txt");
  for (int i = 0 ; i < PeoPleSite.length ; i++){ if(int(PeoPleSite[i]) == 0) PeoPleSite[i] = "Left"; if(int(PeoPleSite[i]) == 1) PeoPleSite[i] = "Mid"; if(int(PeoPleSite[i]) == 2) PeoPleSite[i] = "Right"; }
  ScriptTable[0] =loadImage("Picture/Script_Table.gif");
  ScriptTable[1] =loadImage("Picture/Script_Name.gif");
  for (int i = 0 ; i < 7 ; i ++){
    BG[i] = loadImage("Picture/BackGround/"+ i +".jpg");
    for (int k = 0 ; k < 11 ; k ++){
      PeoPlePicture[i][k] = loadImage("Picture/Character/" + i + "_" + k + ".png");
    } 
  }
   
  ScriptText[13] = ScriptText[13].substring(0,20) + "\n" + ScriptText[13].substring(20,ScriptText[13].length());
  ScriptText[14] = ScriptText[14].substring(0,25) + "\n" + ScriptText[14].substring(25,ScriptText[14].length());
  ScriptText[15] = ScriptText[15].substring(0,33) + "\n" + ScriptText[15].substring(25,ScriptText[15].length());
  
  
  
  
  
}

void draw(){

  if (ScreenSet == 0) StartPage();
  if (ScreenSet == 1) GamePage();
  
  
  if (ChangeBegin == true){
    if (ScreenSet == 0) ScreenChange(0,5);
    if (ScreenSet == 1 && BackHomePage == false) ScreenChange(1,5);
    if (ScreenSet == 1 && BackHomePage == true) ScreenChange(2,5);
  }

  
}


void StartPage(){
  fill(0);
  image(StartPageBG,0,0);
  for (int i = 0 ; i < 3 ; i ++){
      if (StartPageIconXY[0][i] < mouseX && mouseX < (StartPageIconXY[0][i] + StartPageIconWH[0]) && StartPageIconXY[1][i] < mouseY && mouseY < (StartPageIconXY[1][i]+StartPageIconWH[1])) {
        image(StartPageIcon[i*2+1],StartPageIconXY[0][i],StartPageIconXY[1][i]);
        CheckStartPageIcon[i] = true;
      }else {
        image(StartPageIcon[i*2],StartPageIconXY[0][i],StartPageIconXY[1][i]);
        CheckStartPageIcon[i] = false;
      }
    }  
}

void GamePage(){
  if (CheckToNext <= ScriptText.length-1) image(BG[int(BGData[BGNext])],0,0);
  if (CheckToNext < ScriptText.length-1){
    BackHomePage = false;
    if(PeoPleMoveType[CheckToNext].length() > 0) CharaCterAnimateSelect(int(PeoPleMoveType[CheckToNext]),PeoPlePicture[int(PeoPle1Type[CheckToNext])][int(PeoPle1Face[CheckToNext])],PeoPlePicture[int(PeoPle2Type[CheckToNext])][int(PeoPle2Face[CheckToNext])],PeoPleSite[CheckToNext],10,15);
    if(int(ChangeScenesOn[CheckToNext]) == 1) ChangeBegin = true;  
    if(int(ScriptOn[CheckToNext]) == 1) {
      if(CheckToNext == 23) ScriptLoad(23,32,true,15);
      if(CheckToNext == 38 || CheckToNext == 56 || CheckToNext == 116) ScriptLoad(CheckToNext,48,true,15);
      if(CheckToNext != 23 && CheckToNext != 38 && CheckToNext != 56 && CheckToNext != 116) ScriptLoad(CheckToNext,32,false,0); 
    }
  }else if ( CheckToNext == ScriptText.length-1 ){
    ScriptLoad(ScriptText.length-1,32,false,0);
  }else{
    BackHomePage = true;
    ChangeBegin = true;
  }
  if (int(SpecialObject[CheckToNext]) == 1) CheckToNext += 1;
}

void mousePressed(){
  if(MousePressedOff == true && MousePressedOff2==true){
  //StartPage Key
    if(ScreenSet == 0){
      if(CheckStartPageIcon[0]) ChangeBegin = true;
      if(CheckStartPageIcon[2]) exit();
    }
  //GamePage Key
    if(ScreenSet == 1){
      CheckToNext += 1;
      BGNext = CheckToNext;
      SiteStartSet = true;
      PeoPleTransparency = 0;
      PeoPleMove = 0;
    }
    MousePressedOff2 = false;
  }
  
}

void mouseReleased(){
  
  MousePressedOff2 = true;
  
}

void ScreenChange(int ChangeType,int Rate){
 MousePressedOff = false;
 fill(0,0,0,CahangeRect[0] += CahangeRect[1]*Rate); 
 rect(0,0,width,height);
 if (CahangeRect[0] >= 255){
  CahangeRect[1] *= -1;
  CahangeRect[0] = 255;
  if (ChangeType == 0) ScreenSet += 1;
  if (ChangeType == 2) ScreenSet = 0;
  if (ChangeType == 1) BGNext += 1;
 }
 if (CahangeRect[0] <= 0){
  CahangeRect[1] *= -1;
  CahangeRect[0] = 0;
  ChangeBegin = false;
  MousePressedOff = true;
  if (ChangeType == 1) CheckToNext += 1;
  if (ChangeType == 0) CheckToNext = 1;
 }
 
}

void ScriptLoad(int ScriptTextNumber,int ScriptTextSize,boolean DiffColor,int DiffColorBeginNumber){
  tint(255, 255*0.7);
  image(ScriptTable[0],width/2-ScriptTable[0].width/2,height-ScriptTable[0].height-30);
  if(ScriptPeoPleName[ScriptTextNumber].length() > 0) image(ScriptTable[1],40,490);
  textSize(ScriptTextSize);
  fill(0);
  text(ScriptPeoPleName[ScriptTextNumber],40+(ScriptTable[1].width/2)-(textWidth(ScriptPeoPleName[ScriptTextNumber])/2),490+89/2+ScriptTextSize/2);
  if (DiffColor && ScriptText[ScriptTextNumber].length() > DiffColorBeginNumber) {
    fill(255,0,0);
    text(ScriptText[ScriptTextNumber],width/2-ScriptTable[0].width/2+20,height-ScriptTable[0].height-30+20,ScriptTable[0].width-40,ScriptTable[0].height-40);
    fill(0);
    text(ScriptText[ScriptTextNumber].substring(0,DiffColorBeginNumber-1),width/2-ScriptTable[0].width/2+20,height-ScriptTable[0].height-30+20,ScriptTable[0].width-40,ScriptTable[0].height-40);
  }else{
    text(ScriptText[ScriptTextNumber],int(width/2-ScriptTable[0].width/2+20),height-ScriptTable[0].height-30+20,ScriptTable[0].width-40,ScriptTable[0].height-40);
  }
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
  if (Site == "Mid") image(PeoPleNumber,width/2-PeoPleNumber.width/2,PeoPleCeilingDistance);
  if (Site == "Right") image(PeoPleNumber,width-PeoPleNumber.width,PeoPleCeilingDistance);
}

void TwoPeoPle(PImage PeoPleNumber1,PImage PeoPleNumber2,boolean TransparencyOpen,int TransparencyRate){
  if (TransparencyOpen) {tint(255, min(255,(PeoPleTransparency += TransparencyRate))); } else { tint(255, 255); }
  image(PeoPleNumber1,0,PeoPleCeilingDistance);
  image(PeoPleNumber2,width-PeoPleNumber2.width,PeoPleCeilingDistance); 
}

void ThreePeoPle(PImage PeoPleNumber1,PImage PeoPleNumber2,PImage PeoPleNumber3,boolean TransparencyOpen,int TransparencyRate){
  if (TransparencyOpen) {tint(255, min(255,(PeoPleTransparency += TransparencyRate))); } else { tint(255, 255); }
  image(PeoPleNumber1,0,PeoPleCeilingDistance);
  image(PeoPleNumber2,width/2-PeoPleNumber2.width/2,PeoPleCeilingDistance);
  image(PeoPleNumber3,width-PeoPleNumber3.width,PeoPleCeilingDistance); 
}

void OneToTwoPeoPle(PImage PeoPleNumber1,PImage PeoPleNumber2,String Site,int Rate,boolean TransparencyOpen,int TransparencyRate){
  tint(255, 255);
  if (SiteStartSet){ 
    if (Site == "Left"){ PeoPleMove = 0; }else if (Site == "Mid"){ PeoPleMove = width/2-PeoPleNumber1.width/2; } 
    SiteStartSet = false; 
  }
  image(PeoPleNumber1,min(PeoPleMove,width-PeoPleNumber1.width),PeoPleCeilingDistance);
  PeoPleMove = min(width*2,PeoPleMove += Rate);
  if (PeoPleMove >= width-PeoPleNumber1.width){
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
    if (Site == "Left"){ PeoPleMove = 0; }else if (Site == "Mid"){ PeoPleMove = width/2-PeoPleNumber1.width/2; } 
    SiteStartSet = false; 
  }
  image(PeoPleNumber1,min(PeoPleMove,width-PeoPleNumber1.width),PeoPleCeilingDistance);
  PeoPleMove = min(width*2,PeoPleMove += Rate);
  if (PeoPleMove >= width-PeoPleNumber1.width){
    if (TransparencyOpen) {tint(255, min(255,(PeoPleTransparency += TransparencyRate))); } else { tint(255, 255); }
    image(PeoPleNumber2,0,PeoPleCeilingDistance);
    image(PeoPleNumber3,width/2-PeoPleNumber3.width/2,PeoPleCeilingDistance);
    if (TransparencyOpen) { if(PeoPleTransparency >= 255){ MousePressedOff = true; }else{ MousePressedOff = false; } }else{ MousePressedOff = true; }
  }else{
    MousePressedOff = false;
  }
}


void OnePeoPleOff(PImage PeoPleNumber,String Site,int TransparencyRate){
  tint(255, min(255,255-(PeoPleTransparency += TransparencyRate)));
  if (Site == "Left") image(PeoPleNumber,0,PeoPleCeilingDistance);
  if (Site == "Mid") image(PeoPleNumber,width/2-PeoPleNumber.width/2,PeoPleCeilingDistance);
  if (Site == "Right") image(PeoPleNumber,width-PeoPleNumber.width,PeoPleCeilingDistance);
  if (255-(PeoPleTransparency += TransparencyRate) <= 0){
    MousePressedOff = true;
  }else{
    MousePressedOff = false;
  }
}
void TwoPeoPleOff(PImage PeoPleNumber1,PImage PeoPleNumber2,int TransparencyRate){
  tint(255, min(255,255-(PeoPleTransparency += TransparencyRate)));
  image(PeoPleNumber1,0,PeoPleCeilingDistance);
  image(PeoPleNumber2,width-PeoPleNumber2.width,PeoPleCeilingDistance); 
  if (255-(PeoPleTransparency += TransparencyRate) <= 0){
    MousePressedOff = true;
  }else{
    MousePressedOff = false;
  }
}
void ThreePeoPleOff(PImage PeoPleNumber1,PImage PeoPleNumber2,PImage PeoPleNumber3,int TransparencyRate){
  tint(255, min(255,255-(PeoPleTransparency += TransparencyRate)));
  image(PeoPleNumber1,0,PeoPleCeilingDistance);
  image(PeoPleNumber2,width/2-PeoPleNumber2.width/2,PeoPleCeilingDistance);
  image(PeoPleNumber3,width-PeoPleNumber3.width,PeoPleCeilingDistance); 
  if (255-(PeoPleTransparency += TransparencyRate) <= 0){
    MousePressedOff = true;
  }else{
    MousePressedOff = false;
  }
}

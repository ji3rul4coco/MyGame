
int NextText = 0;
PFont ScriptTextType;
int ScreenSet = 0;

//StartPage Random Set
PImage StartPageBG;
PImage [] StartPageIcon = new PImage [6];
int StartPageIconGap = 30;
int [][] StartPageIconXY = new int [2][3];
int [] StartPageIconWH = new int [2];
boolean [] CheckStartPageIcon = new boolean [3];

//ScreenChange Random Set
int CahangeRect;

void setup(){
  size(1280,700);
  ScriptTextType = createFont("Type.ttf", 32);
  textFont(ScriptTextType);
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
  StartPageIconWH[0] = StartPageIcon[0].width;
  StartPageIconWH[1] = StartPageIcon[0].height;
  StartPageIconXY[0][0] = width/2-StartPageIconWH[0]/2;
  StartPageIconXY[0][1] = width/2-StartPageIconWH[0]/2;
  StartPageIconXY[0][2] = width/2-StartPageIconWH[0]/2;
  StartPageIconXY[1][0] = height-(StartPageIconWH[1]*3)-50-(StartPageIconGap*2);
  StartPageIconXY[1][1] = height-(StartPageIconWH[1]*2)-50-StartPageIconGap;
  StartPageIconXY[1][2] = height-StartPageIconWH[1]-50;
  
}

void draw(){
  background(255);
  if (ScreenSet == 0) StartPage();
  if (ScreenSet == 1) TextPage();

  

  
}

void ScreenChange(){
  
  
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

void TextPage(){
 background(23,57,13);
}

void mousePressed(){
  //StartPage Key
  if(CheckStartPageIcon[0]) ScreenSet = 1;
  if(CheckStartPageIcon[2]) exit();
  
}

void ScreenChange(int ChangeType){
 
 fill(255); 
 rect(0,0,width,height);
}

PImage fundo;
PFont ubuntu;
PFont ubuntuBold;
PImage ImgGNU;
PImage pinguimLinux;
PImage terminalDerbian;
PImage ImglogoUbuntu;
PImage ImgubuntuNav;
PImage slackwarelogo;
PImage servidor;


int tela = 0;
//0 = menu
//1 = GNU
//2 = Criação do Linux
//3 = Linux começa a ser utilizado
//4 = Criação do Ubuntu
//5 = Consolidação mundial do Linux

void setupD () {
  ubuntu = createFont("Ubuntu-Regular.ttf", 32);
  ubuntuBold = createFont("Ubuntu-Bold.ttf", 40);
  ImgGNU = loadImage("GNU.png");
  pinguimLinux = loadImage("pinguim_linux.png");
  slackwarelogo = loadImage("Slackware-Logo.png");
  ImglogoUbuntu = loadImage("logoUbuntu.png");
  servidor = loadImage("servidor.jpg");
}

void setup(){
  fullScreen();
  setupD();
}


void draw() {
  drawD();
}
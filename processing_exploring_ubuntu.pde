PImage fundo;
PFont ubuntu;
PFont ubuntuBold;
PImage GNU;
PImage pinguimLinux;
PImage terminalDerbian;
PImage logoUbuntu;
PImage ubuntuNav;

int tela = 0;
//0 = menu
//1 = GNU
//2 = Criação do Linux
//3 = Linux começa a ser utilizado
//4 = Criação do Ubuntu
//5 = Consolidação mundial do Linux

void setup() {
  fullScreen();
  fundo = loadImage("FundoUbuntu.jpg");
  ubuntu = createFont("Ubuntu-Regular.ttf", 32);
  ubuntuBold = createFont("Ubuntu-Bold.ttf", 40);
  GNU = loadImage("GNU.png");
  pinguimLinux = loadImage("pinguim_linux.png");
  terminalDerbian = loadImage("terminalDerbian.jpg");
  logoUbuntu = loadImage("logoUbuntu.png");
  ubuntuNav = loadImage("UbuntuNav.jpg");
}

void draw() {
  image(fundo, 0, 0, width, height);
  fill(0, 120);
  rect(0, 0, width, height);

  if (tela==0) {

    retanguloMenu();
    textoMenu();
    linha();
    data1();
    data2();
    data3();
    data4();
    data5();
    GNU();
    setaLinha();
    criacaoLinux();
    utilLinux();
    criacaoUbuntu();
    consoLinux();
  }

  if (tela==1) {
    sGnu();
    retanguloMenu();
    textoMenuGnu();
    BotaoVoltar();
    Fundo();
    textoGnu();
  }
  if (tela==2) {
    retanguloMenu();
    textoMenuCrLinux();
    BotaoVoltar();
    imagemPinguim();
    Fundo();
    textoCrLinux();
  }


  if (tela==3) {
    retanguloMenu();
    textoMenuUtiLinux();
    BotaoVoltar();
    Fundo();
    textoUtiLinux();
    terminalD();
  }


  if (tela==4) {
    retanguloMenu();
    textoCrUbuntu();
    BotaoVoltar();
    logoUbuntu();
    Fundo();
    textoUbuntu();
  }


  if (tela==5) {
    retanguloMenu();
    textoConsoLinux();
    BotaoVoltar();
    ubuntuNav();
    Fundo();
    textoLinux();
  }
}


//Menu principal(tela = 0)
void retanguloMenu() {
  fill(0);
  rect(0, height*0.05, width, height*0.12, 20);
}

void textoMenu() {
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("História do Linux & Ubuntu", width/2, height*0.11);
}


void linha() {

  strokeWeight(6);
  line(
    width * 0.008,
    height*0.55,
    width * 0.97,
    height*0.55
    );
}

void data1() {
  fill(0);
  textAlign(CENTER);
  text("1983", width*0.089, height*0.6);
}

void data2() {
  fill(0);
  textAlign(CENTER);
  text("1991", width*0.27, height*0.53);
}

void data3() {
  fill(0);
  textAlign(CENTER);
  text("1993", width*0.45, height*0.6);
}

void data4() {
  fill(0);
  textAlign(CENTER);
  text("2004", width*0.63, height*0.53);
}

void data5() {
  fill(0);
  textAlign(CENTER);
  text("2010", width*0.81, height*0.6);
}

void GNU() {
  fill(233, 84, 32);
  rect(width*0.01, height*0.38, width*0.16, height*0.12, 25);
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(ubuntu);
  text("GNU", width*0.01 + width*0.16/2, height*0.38 + height*0.12/2);
}

void criacaoLinux() {
  fill(233, 84, 32);
  rect(width*0.18, height*0.58, width*0.18, height*0.12, 25);
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(ubuntu);
  text("Criação do Linux", width*0.18 + width*0.18/2, height*0.58 + height*0.12/2);
}

void utilLinux() {
  fill(233, 84, 32);
  rect(width*0.37, height*0.38, width*0.16, height*0.12, 25);
  fill(0);
  textAlign(CENTER, BOTTOM);
  textFont(ubuntu);
  text("Linux começa", width*0.37+ width*0.16/2, height*0.38 + height*0.12/2);
  fill(0);
  textAlign(CENTER, TOP);
  textFont(ubuntu);
  text("a ser utilizado", width*0.37 + width*0.16/2, height*0.39 + height*0.12/2);
}

void criacaoUbuntu() {
  fill(233, 84, 32);
  rect(width*0.54, height*0.58, width*0.18, height*0.12, 25);
  fill(0);
  textAlign(CENTER, BOTTOM);
  textFont(ubuntu);
  text("Criação do", width*0.54 + width*0.18/2, height*0.58 + height*0.12/2);
  fill(0);
  textAlign(CENTER, TOP);
  textFont(ubuntu);
  text("Ubuntu", width*0.54 + width*0.18/2, height*0.58 + height*0.12/2);
}

void consoLinux() {
  fill(233, 84, 32);
  rect(width*0.73, height*0.38, width*0.16, height*0.12, 25);
  fill(0);
  textAlign(CENTER, BOTTOM);
  textFont(ubuntu);
  text("Consolidação", width*0.73+ width*0.16/2, height*0.38 + height*0.12/2);
  fill(0);
  textAlign(CENTER, TOP);
  textFont(ubuntu);
  text("geral do linux", width*0.73 + width*0.16/2, height*0.39 + height*0.12/2);
}




void setaLinha() {
  fill(255);
  triangle(
    width*0.945, height*0.52,
    width*1.00, height*0.55,
    width*0.945, height*0.58
    );
}

void mousePressed() {
  if (mouseX > width *0.01 && mouseX< width*0.01 + width * 0.16 && mouseY> height*0.38 && mouseY<height*0.38 + height*0.12) {
    tela = 1;
  }
  if (mouseX > width *0.18 && mouseX< width*0.18 + width * 0.18 && mouseY> height*0.58 && mouseY<height*0.58 + height*0.12) {
    tela = 2;
  }
  if (mouseX> width*0.37 && mouseX< width*0.37 + width* 0.16 && mouseY> height*0.38 && mouseY<height*0.38 + height*0.12) {
    tela = 3;
  }
  if (mouseX> width*0.54 && mouseX< width*0.54 + width* 0.58 && mouseY> height*0.58 && mouseY<height*0.58 + height*0.12) {
    tela = 4;
  }
  if (mouseX> width*0.73 && mouseX< width*0.73 + width* 0.16 && mouseY> height*0.39 && mouseY<height*0.39 + height*0.12) {
    tela = 5;
  }
  if (mouseX> width*0.4 && mouseX< width*0.4 + width* 0.15 && mouseY> height*0.9 && mouseY<height*0.9 + height*0.09) {
    tela = 0;
  }
}

void BotaoVoltar() {
  fill(233, 84, 32);
  rect(width*0.4, height*0.9, width*0.15, height*0.09, 25);
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(ubuntu);
  text("Voltar", width*0.4 + width*0.15/2, height*0.9 + height*0.09/2);
}


//Projeto GNU (tela=1)


void sGnu() {
  image(GNU, width*0.08, height*0.25, width*0.26, height*0.45);
}

void textoMenuGnu() {
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Projeto GNU", width/2, height*0.11);
}

void textoGnu() {
  fill(#e95420);
  textFont(ubuntu);
  text("O projeto GNU Project foi criado em 1983 por Richard Stallman "
    +"com o objetivo de desenvolver um sistema operacional totalmente livre, "
    +"permitindo que qualquer pessoa pudesse usar, estudar, modificar e distribuir "
    +"seus programas. O nome GNU significa GNU's Not Unix, pois o sistema era "
    +"semelhante ao Unix, mas sem utilizar código proprietário. O projeto também deu "
    +"origem ao movimento do software livre e a diversas ferramentas importantes, como "
    +"o compilador GCC e a licença GPL, que ajudaram no desenvolvimento de sistemas como o Linux.",
    width*0.4, height*0.25, width*0.5, height*0.4);
}







//Criação Linux (tela=2)

void textoMenuCrLinux() {
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Criação do Linux", width/2, height*0.11);
}

void imagemPinguim(){
  image(pinguimLinux, width*0.08, height*0.25, width*0.26, height*0.45);
}

void Fundo(){
  fill(0);
  rect(width*0.4,height*0.25,width*0.5,height*0.4);
}

void textoCrLinux() {
  fill(#e95420);
  textFont(ubuntu);
  text("O Linux foi criado em 1991 por Linus Torvalds, " 
  +"um estudante finlandês de ciência da computação."
  +"Inicialmente, o projeto surgiu como um hobby para criar um sistema operacional"
  +"inspirado no Unix, mas gratuito e aberto para modificações."
  +"Linus publicou o código na internet, permitindo que programadores do mundo todo"
  +"colaborassem com melhorias. Com o tempo, o Linux passou a ser utilizado "
  +"junto das ferramentas do GNU Project, formando sistemas operacionais completos conhecidos como"
  +"distribuições Linux, como o Ubuntu e o Debian.",
    width*0.4, height*0.25, width*0.5, height*0.4);
}








//Utilização do Linux(tela=3)

void textoMenuUtiLinux() {
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Linux começa a ser utilizado", width/2, height*0.11);
}

void textoUtiLinux(){
  fill(#e95420);
  textFont(ubuntu);
  text("Em 1993, o Linux começou a ganhar popularidade porque oferecia uma alternativa gratuita, "
  +"estável e aberta aos sistemas operacionais proprietários da época. Nesse período surgiram"
  +"as primeiras distribuições mais organizadas, como o Debian e o Slackware,"
  +"que facilitavam a instalação e o uso do sistema. O Linux passou a ser utilizado"
  +"principalmente por estudantes, programadores e universidades, já que permitia modificar"
  +"o código e adaptar o sistema às necessidades de cada usuário. Além disso, a colaboração pela" 
  +"internet ajudou o sistema a evoluir rapidamente e conquistar cada vez mais usuários.",
    width*0.4, height*0.25, width*0.5, height*0.4);
}

void terminalD(){
  image(terminalDerbian ,width*0.08, height*0.25, width*0.26, height*0.45);
}








//Criação do Ubuntu(tela=4)
void textoCrUbuntu() {
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Criação do Ubuntu", width/2, height*0.11);
}

void logoUbuntu(){
  image(logoUbuntu,width*0.08, height*0.25, width*0.26, height*0.45);
}

void textoUbuntu(){
  fill(#e95420);
  textFont(ubuntu);
  text("O Ubuntu foi criado em 2004 pela empresa Canonical, liderada por Mark Shuttleworth. O objetivo do projeto era tornar "
  +"o Linux mais simples, acessível e fácil de usar para pessoas comuns, oferecendo uma interface amigável e atualizações frequentes. "
  +"Baseado no Debian, o Ubuntu rapidamente se tornou uma das distribuições Linux mais populares do mundo por combinar estabilidade, " 
  +"facilidadede instalação e software livre.",
    width*0.4, height*0.25, width*0.5, height*0.4);
}










//Consolidação mundial do Linux (tela=5)
void textoConsoLinux() {
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Consolidação mundial do Linux", width/2, height*0.11);
}

void ubuntuNav(){
  image(ubuntuNav,width*0.08, height*0.25, width*0.26, height*0.45);
}

void textoLinux(){
    fill(#e95420);
    textFont(ubuntu);
    text("Por volta de 2010, o Linux se popularizou entre usuários comuns graças a distribuições mais acessíveis, "
    +"como o Ubuntu, tornando o sistema mais fácil de instalar e usar; ele passou a ser adotado por ser gratuito, "
    +"leve, seguro e altamente personalizável, já sendo forte em servidores e expandindo seu uso também para computadores"
    +"pessoais, onde continua sendo utilizado até hoje em servidores, sistemas embarcados e por usuários que buscam mais controle do sistema.",
    width*0.4, height*0.25, width*0.5, height*0.4);
}

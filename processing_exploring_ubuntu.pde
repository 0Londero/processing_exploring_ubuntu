PImage fundo;
PFont ubuntu;
PFont ubuntuBold;
PImage GNU;

int tela = 0;
//0 = menu
//1 = GNU
//2 = criação
//3 = Debian 1993
//4 = Ubuntu 2004
//5 = Ubuntu moderno

void setup(){
  fullScreen();
  fundo = loadImage("FundoUbuntu.jpg");
  ubuntu = createFont("Ubuntu-Regular.ttf", 32);
  ubuntuBold = createFont("Ubuntu-Bold.ttf",40);
  GNU = loadImage("GNU.png");
  
}

void draw(){
  image(fundo, 0, 0, width, height);
    fill(0, 120);
    rect(0, 0, width, height);
  
  if(tela==0){
   
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

  if(tela==1){
   sGnu();
   retanguloMenu();
   textoMenuGnu();
    
   
     }
  if (tela==2){ 
    retanguloMenu();
    textoMenuCrLinux();
  
    
     
     
     
  }
  
  
  if(tela==3){
    retanguloMenu();
    textoMenuUtiLinux();
    
    
    
    
    
  }
  
  
  if(tela==4){
    retanguloMenu();
    textoCrUbuntu();
  
  
  
  
  }
  
  
  if(tela==5){
    retanguloMenu();
    textoConsoLinux();







  }
}


//Menu principal(tela = 0)
void retanguloMenu(){
  fill(0);
  rect(0,height*0.05,width,height*0.12,20);
}

void textoMenu(){
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("História do Linux & Ubuntu",width/2,height*0.11);
}


void linha(){
   
  strokeWeight(6);
  line(
    width * 0.008,
    height*0.55,
    width * 0.97,
    height*0.55
  );
}

void data1(){
  fill(0);
  textAlign(CENTER);
  text("1983", width*0.08, height*0.62);
}

void data2(){
  fill(0);
  textAlign(CENTER);
  text("1991", width*0.28, height*0.53);
}

void data3(){
  fill(0);
  textAlign(CENTER);
  text("1993", width*0.45, height*0.62);
}

void data4(){
  fill(0);
  textAlign(CENTER);
  text("2004", width*0.62, height*0.53);
}

void data5(){
  fill(0);
  textAlign(CENTER);
  text("2010", width*0.80, height*0.62);
}

void GNU(){
  fill(233,84,32);
  rect(width*0.01,height*0.38,width*0.16,height*0.12,25);
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(ubuntu);
  text("GNU", width*0.01 + width*0.16/2, height*0.38 + height*0.12/2);
}

void criacaoLinux(){
  fill(233,84,32);
  rect(width*0.18,height*0.58,width*0.18,height*0.12,25);
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(ubuntu);
  text("Criação do Linux", width*0.18 + width*0.18/2, height*0.58 + height*0.12/2);
  
}

void utilLinux(){
  fill(233,84,32);
  rect(width*0.37,height*0.38,width*0.16,height*0.12,25);
  fill(0);
  textAlign(CENTER, BOTTOM);
  textFont(ubuntu);
  text("Linux começa", width*0.37+ width*0.16/2, height*0.38 + height*0.12/2);
  fill(0);
  textAlign(CENTER, TOP);
  textFont(ubuntu);
  text("a ser utilizado", width*0.37 + width*0.16/2, height*0.39 + height*0.12/2);
  
}
  
void criacaoUbuntu(){
  fill(233,84,32);
  rect(width*0.54,height*0.58,width*0.18,height*0.12,25);
  fill(0);
  textAlign(CENTER, BOTTOM);
  textFont(ubuntu);
  text("Criação do", width*0.54 + width*0.18/2, height*0.58 + height*0.12/2);
  fill(0);
  textAlign(CENTER, TOP);
  textFont(ubuntu);
  text("Ubuntu", width*0.54 + width*0.18/2, height*0.58 + height*0.12/2);
  
}

void consoLinux(){
  fill(233,84,32);
  rect(width*0.73,height*0.38,width*0.16,height*0.12,25);
  fill(0);
  textAlign(CENTER, BOTTOM);
  textFont(ubuntu);
  text("Consolidação",width*0.73+ width*0.16/2, height*0.38 + height*0.12/2);
  fill(0);
  textAlign(CENTER, TOP);
  textFont(ubuntu);
  text("geral do linux", width*0.73 + width*0.16/2, height*0.39 + height*0.12/2);
  
}




void setaLinha(){
  fill(255);
  triangle(
  width*0.945, height*0.52,
  width*1.00,  height*0.55,
  width*0.945, height*0.58
);
}

void mousePressed(){
  if(mouseX > width *0.01 && mouseX< width*0.01 + width * 0.16 && mouseY> height*0.38 && mouseY<height*0.38 + height*0.12){
    tela = 1; 
  }
  if(mouseX > width *0.18 && mouseX< width*0.18 + width * 0.18 && mouseY> height*0.58 && mouseY<height*0.58 + height*0.12){
    tela = 2;
  }
  if(mouseX> width*0.37 && mouseX< width*0.37 + width* 0.16 && mouseY> height*0.38 && mouseY<height*0.38 + height*0.12){
    tela = 3;
  }
  if(mouseX> width*0.54 && mouseX< width*0.54 + width* 0.58 && mouseY> height*0.58 && mouseY<height*0.58 + height*0.12){
    tela = 4;
  }
  if(mouseX> width*0.73 && mouseX< width*0.73 + width* 0.16 && mouseY> height*0.39 && mouseY<height*0.39 + height*0.12){
    tela = 5;
  }
}



//Projeto GNU (tela=1)


void sGnu(){
  image(GNU, width*0.36, height*0.25, width*0.26,height*0.45);
  
  
}

void textoMenuGnu(){
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Projeto GNU",width/2,height*0.11);
}







//Criação Linux (tela=2)

void textoMenuCrLinux(){
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Criação do Linux",width/2,height*0.11);
}








//Utilização do Linux(tela=3)

void textoMenuUtiLinux(){
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Linux começa a ser utilizado",width/2,height*0.11);
}
 
  
  
  
  
  
  
  
//Criação do Ubuntu(tela=4)
void textoCrUbuntu(){
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Criação do Ubuntu",width/2,height*0.11);
}











//Consolidação mundial do Linux (tela=5)
void textoConsoLinux(){
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Consolidação mundial do Linux",width/2,height*0.11);
}
  
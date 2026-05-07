PImage fundo;
PFont ubuntu;
PFont ubuntuBold;
void setup(){
  fullScreen();
  fundo = loadImage("FundoUbuntu.jpg");
  ubuntu = createFont("Ubuntu-Regular.ttf", 32);
  ubuntuBold = createFont("Ubuntu-Bold.ttf",40);
  
}

void draw(){
 // fundo
  image(fundo, 0, 0, width, height);

  // escurecer um pouco
  fill(0, 120);
  rect(0, 0, width, height);
  
  
  retanguloMenu();
  textoMenu();
  linha();
}

void retanguloMenu(){
  fill(0);
  rect(0,30,width,80);
}

void textoMenu(){
  fill(#e95420);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("História do Linux & Ubuntu",width/2,85);
}

// arrumar a linha depois
void linha(){
  fill(0);
  line(100,130,100,130);
}
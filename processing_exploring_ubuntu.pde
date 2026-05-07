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
  data1();
  data2();
  data3();
  data4();
  data5();
  GNU();
  setaLinha();
}

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
  fill(0);
  rect(width*0.01,height*0.38,width*0.16,height*0.12,25);
}

void setaLinha(){
triangle(
  width*0.945, height*0.52,
  width*1.00,  height*0.55,
  width*0.945, height*0.58
);
}
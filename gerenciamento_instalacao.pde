PImage fundo;
PFont regular;
PFont bold;

void gerenciamento_instalacao(){
    fundo = loadImage("images/fundo_guilherme.jpg");
    image(fundo,0,0,width, height);
    menu();
}

void botoes(float x, float y, float w,float h,float r){
    float soma_fundo = height/153.6;
    noStroke();
    fill(119,33,111);
    rect(x+soma_fundo,y+soma_fundo,w,h,r);
    fill(58,0,46);
    rect(x,y,w,h,r);
}

void menu(){
    regular = createFont("images/Ubuntu-Regular.ttf", height/19.2);
    bold = createFont("images/Ubuntu-Bold.ttf", height/17);
    smooth(10);

    //Titulo
    fill(58,0,46);
    botoes(width/18.21, height/38, width/1.11, height/5.12, height/19.2);
    //Texto Título
    fill(233,84,32);
    textFont(bold);
    textAlign(CENTER, CENTER);
    text("Gerenciamento de Pacotes e Instalação de Programas",(width/18.21)+((width/1.11)/2),(height/38)+((height/5.12)/2));
    //Botao superior esquerdo
    fill(58,0,46);
    botoes(width/18.21, height/3.37, width/2.27, height/5.12, height/19.2);
    //Texto botão superior esquerdo
    fill(233,84,32);
    textFont(regular);
    textAlign(CENTER, CENTER);
    text("O que são pacotes e\n Gerenciadores de pacotes",(width/18.21)+((width/2.27)/2),(height/3.37)+((height/5.12)/2));
    //Botao superior direito
    fill(58,0,46);
    botoes(width/1.95, height/3.37, width/2.27, height/5.12, height/19.2);
    //Texto botão superior direito
    fill(233,84,32);
    textFont(regular);
    textAlign(CENTER, CENTER);
    text("Como o Ubuntu\n instala os programas",(width/1.95)+((width/2.27)/2),(height/3.37)+((height/5.12)/2));
    //Botao inferior esquerdo
    fill(58,0,46);
    botoes(width/18.21, height/1.6, width/2.27, height/5.12, height/19.2);
    //Texto botão inferior esquerdo
    fill(233,84,32);
    textFont(regular);
    textAlign(CENTER, CENTER);
    text("Comandos Principais",(width/18.21)+((width/2.27)/2),(height/1.6)+((height/5.12)/2));
    //Botao inferior direito
    fill(58,0,46);
    botoes(width/1.95, height/1.6, width/2.27, height/5.12, height/19.2);
    //Texto botão inferior direito
    fill(233,84,32);
    textFont(regular);
    textAlign(CENTER, CENTER);
    text("Vantagens do\n sistema Ubuntu",(width/1.95)+((width/2.27)/2),(height/1.6)+((height/5.12)/2));
}
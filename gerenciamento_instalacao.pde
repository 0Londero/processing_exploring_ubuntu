PImage fundo;

void gerenciamento_instalacao(){
    fundo = loadImage("images/fundo_guilherme.jpg");
    image(fundo,0,0,width, height);
    //Titulo
    fill(58,0,46);
    botoes(width/18.21, height/38, width/1.11, height/5.12, height/19.2);
    //Botao superior esquerdo
    fill(58,0,46);
    botoes(width/18.21, height/3.37, width/2.27, height/5.12, height/19.2);
    //Botao superior direito
    fill(58,0,46);
    botoes(width/1.95, height/3.37, width/2.27, height/5.12, height/19.2);
    //Botao inferior esquerdo
    fill(58,0,46);
    botoes(width/18.21, height/1.6, width/2.27, height/5.12, height/19.2);
    //Botao inferior direito
    fill(58,0,46);
    botoes(width/1.95, height/1.6, width/2.27, height/5.12, height/19.2);
}

void botoes(float x, float y, float w,float h,float r){
    float soma_fundo = height/153.6;
    noStroke();
    fill(119,33,111);
    rect(x+soma_fundo,y+soma_fundo,w,h,r);
    fill(58,0,46);
    rect(x,y,w,h,r);
}
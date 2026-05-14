PImage fundo;
PImage pacote_ubuntu;
PImage pacote_desenho;
PFont regular;
PFont bold;
int tela_atual = 0;

void gerenciamento_instalacao(){
    if (tela_atual == 0){
        menu();
    }
    if (tela_atual == 1){
        pacotes();
    }
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
    fundo = loadImage("images/fundo_guilherme.jpg");
    image(fundo,0,0,width, height);
    regular = createFont("images/Ubuntu-Regular.ttf", 40);
    bold = createFont("images/Ubuntu-Bold.ttf", 50);
    textAlign(CENTER, CENTER);

    //Titulo
    fill(58,0,46);
    botoes(width/18.21, height/38, width/1.11, height/5.12, height/19.2);
    //Texto Título
    fill(233,84,32);
    textFont(bold);
    text("Gerenciamento de Pacotes e Instalação de Programas",(width/18.21)+((width/1.11)/2),(height/38)+((height/5.12)/2));

    //Botao superior esquerdo
    fill(58,0,46);
    botoes(width/18.21, height/3.37, width/2.27, height/5.12, height/19.2);
    //Texto botão superior esquerdo
    fill(233,84,32);
    textFont(regular);
    text("O que são pacotes e\n gerenciadores de pacotes",(width/18.21)+((width/2.27)/2),(height/3.37)+((height/5.12)/2));

    //Botao superior direito
    fill(58,0,46);
    botoes(width/1.95, height/3.37, width/2.27, height/5.12, height/19.2);
    //Texto botão superior direito
    fill(233,84,32);
    textFont(regular);
    text("Como o Ubuntu\n instala os programas",(width/1.95)+((width/2.27)/2),(height/3.37)+((height/5.12)/2));

    //Botao inferior esquerdo
    fill(58,0,46);
    botoes(width/18.21, height/1.6, width/2.27, height/5.12, height/19.2);
    //Texto botão inferior esquerdo
    fill(233,84,32);
    textFont(regular);
    text("Comandos Principais",(width/18.21)+((width/2.27)/2),(height/1.6)+((height/5.12)/2));

    //Botao inferior direito
    fill(58,0,46);
    botoes(width/1.95, height/1.6, width/2.27, height/5.12, height/19.2);
    //Texto botão inferior direito
    fill(233,84,32);
    textFont(regular);
    text("Vantagens do\n sistema Ubuntu",(width/1.95)+((width/2.27)/2),(height/1.6)+((height/5.12)/2));
}

void pacotes(){
    fundo = loadImage("images/fundo_guilherme.jpg");
    pacote_ubuntu = loadImage("images/pacote_ubuntu.png");
    pacote_desenho = loadImage("images/pacote_desenho.png");
    image(fundo,0,0,width, height);
    regular = createFont("images/Ubuntu-Regular.ttf", 40);
    bold = createFont("images/Ubuntu-Bold.ttf", 50);
    textAlign(CENTER, CENTER);

    //Título
    fill(58,0,46);
    botoes(width/18.21, height/38, width/1.11, height/6, height/19.2);
    fill(233,84,32);
    textFont(bold);
    text("O que são pacotes e gerenciadores de pacotes",(width/18.21)+((width/1.11)/2),(height/38)+((height/6)/2));

    //Explicação
    fill(58,0,46);
    botoes(width/18.21, height/4.5, width/1.4, height/5.12, height/19.2);
    fill(233,84,32);
    textFont(regular);
    textSize(25);
    text("Pacotes são arquivos que armazenam programas e todos os \ncomponentes necessários para seu funcionamento, como bibliotecas e dependências.\nNo Ubuntu, o gerenciamento desses pacotes é feito pelo APT,\n sistema responsável por instalar, atualizar e remover programas de forma automática e segura.",(width/18.21)+((width/1.4)/2),(height/4.5)+((height/5.12)/2));
    image(pacote_ubuntu, width/1.24, height/4.5, width/6.41, height/5.12);

    //Desenho do pacote
    image(pacote_desenho, width/18.21, height/2.25, width/4.55, height/2.56);

    //Botão de voltar
    botao_voltar();
}

void mousePressed(){
    if (tela_atual == 0 && mouseX >= width/18.21 && mouseX <= width/2.02 && mouseY >= height/3.37 && mouseY <= height/2.03){
        tela_atual = 1;
    }
    if(tela_atual == 1 && mouseX >= width/18.21 && mouseX <= (width/18.21)*2 && mouseY >= height/1.16 && mouseY <= (height/1.16)+(height/10.24)){
        tela_atual = 0;
    }
}

void botao_voltar(){
    botoes(width/18.21, height/1.16, width/18.21, height/10.24, height/19.2);
    stroke(233,84,32);
    strokeWeight(10);
    line((width/18.21)+(width/91), (height/1.16)+(height/10.24/2), (width/18.21)+(width/39), (height/1.16)+(height/51.2));
    line((width/18.21)+(width/91), (height/1.16)+(height/10.24/2), (width/18.21)+(width/39), (height/1.16)+(height/12.8));
    line((width/18.21)+(width/91), (height/1.16)+(height/10.24/2), (width/18.21)+(width/22.75), (height/1.16)+(height/10.24/2));
}
//final da tela = width/1.04

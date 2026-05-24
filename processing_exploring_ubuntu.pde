import processing.video.*;
PImage fundo;
PImage pacote_ubuntu;
PImage pacote_desenho;
PImage fluxograma;
PImage instalacaoimg;
PImage firefox;
PImage imgterminal;
PImage vantagem1;
PImage vantagem2;
PImage vantagem3;
PImage vantagem4;
PImage fluxokernel;
PImage funcoesKernel;
PFont regular;
PFont bold;
Movie terminal;

void setup_gi_kernel(){
    pacote_ubuntu = loadImage("images/pacote_ubuntu.png");
    pacote_desenho = loadImage("images/pacote_desenho.png");
    fluxograma = loadImage("images/fluxograma.png");
    instalacaoimg = loadImage("images/instalacao.png");
    firefox = loadImage("images/firefox.png");
    imgterminal = loadImage("images/imgterminal.png");
    vantagem1 = loadImage("images/vantagem1.png");
    vantagem2 = loadImage("images/vantagem2.png");
    vantagem3 = loadImage("images/vantagem3.png");
    vantagem4 = loadImage("images/vantagem4.png");
    fluxokernel = loadImage("images/fluxoKernel.png");
    funcoesKernel = loadImage("images/funcoesKernel.png");
    regular = createFont("images/Ubuntu-Regular.ttf", 40);
    bold = createFont("images/Ubuntu-Bold.ttf", height/17);
    terminal = new Movie(this, "terminal.mp4");
}

void setup() {
    fullScreen();
    smooth(10);
    setup_gi_kernel();
}

void draw() {
    gerenciamento_instalacao(); 
}
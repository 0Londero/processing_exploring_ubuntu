import processing.video.*;
PImage fundo;
PImage pacote_ubuntu;
PImage pacote_desenho;
PImage fluxograma;
PImage instalacaoimg;
PImage firefox;
PFont regular;
PFont bold;
Movie terminal;

void setup_gi(){
    fundo = loadImage("images/fundo_guilherme.jpg");
    pacote_ubuntu = loadImage("images/pacote_ubuntu.png");
    pacote_desenho = loadImage("images/pacote_desenho.png");
    fluxograma = loadImage("images/fluxograma.png");
    instalacaoimg = loadImage("images/instalacao.png");
    firefox = loadImage("images/firefox.png");
    regular = createFont("images/Ubuntu-Regular.ttf", 40);
    bold = createFont("images/Ubuntu-Bold.ttf", 50);
    terminal = new Movie(this, "terminal.mp4");
}

void setup() {
    fullScreen();
    smooth(10);
    setup_gi();
}

void draw() {
    gerenciamento_instalacao();   
}
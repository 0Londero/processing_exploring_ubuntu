PFont minhaFonte;
PImage fundo;
int tela = 0;
String[] botoes = {
  "GNOME",
  "Ubuntu",
  "Dock",
  "Personalização",
  "GUI vs Terminal"
};
void setup() {
  size(1280, 720);
  minhaFonte = createFont("Ubuntu-Regular.ttf", 32, true);
  fundo = loadImage("philip-oroni-D8K6LtI0gWs-unsplash.jpg");
  textFont(minhaFonte);
  textAlign(CENTER, CENTER);
}
void draw() {
  image(fundo, 0, 0, width, height);
  rectMode(CORNER);
  fill(0, 120);
  noStroke();
  rect(0, 0, width, height);
  if (tela == 0) {
    fill(255);
    textFont(minhaFonte, 40);
    text("Interface Gráfica", width/2, 100);
    for (int i = 0; i < botoes.length; i++) {
      desenharBotao(
        botoes[i],
        width/2,
        230 + i * 70
      );
    }
  } else {
    if (tela == 1) telaGnome();
    else mostrarTela();
    desenharBotao("Voltar", 120, 650);
  }
}
void telaGnome() {
  fill(255);
  textFont(minhaFonte, 30);
  text("O que é GNOME?", width/2, 100);
  fill(220);
  textFont(minhaFonte, 20);
  text(
    "O GNOME é o ambiente gráfico utilizado no Ubuntu para permitir\n" +
    "que o usuário interaja com o sistema de forma visual e intuitiva.\n" +
    "Ele é responsável pela aparência da área de trabalho, janelas,\n" +
    "menus, botões, barra superior e dock lateral do sistema.\n\n" +
    "Com uma interface moderna e organizada, o GNOME facilita\n" +
    "o uso do Linux tanto para iniciantes quanto para usuários\n" +
    "mais avançados. Além disso, oferece recursos de personalização\n" +
    "como temas, ícones e extensões.",
    width/2,
    height/2
  );
}
void mostrarTela() {
  fill(255);
  textFont(minhaFonte, 30);
  if (tela == 2) {
    text("Ubuntu", width/2, 100);
    fill(220);
    textFont(minhaFonte, 20);
    text(
      "O Ubuntu é uma distribuição Linux baseada em software livre\n" +
      "e desenvolvida para ser simples, segura e fácil de utilizar.\n\n" +
      "Ele possui interface gráfica moderna, suporte para milhares\n" +
      "de aplicativos e é muito utilizado em computadores pessoais,\n" +
      "servidores e ambientes de programação.\n\n" +
      "O sistema é conhecido pela estabilidade, personalização e\n" +
      "pela grande comunidade que ajuda usuários ao redor do mundo.\n\n" +
      "Além disso, o Ubuntu utiliza o ambiente gráfico GNOME,\n" +
      "oferecendo uma experiência visual organizada e intuitiva.",
      width/2,
      height/2
    );
  }
  if (tela == 3) {
    text("Dock", width/2, 100);
    fill(220);
    textFont(minhaFonte, 20);
    text(
      "O Dock é uma barra lateral presente no Ubuntu utilizada\n" +
      "para acessar aplicativos de forma rápida e prática.\n\n" +
      "Nele ficam fixados programas importantes como navegador,\n" +
      "arquivos, terminal e aplicativos favoritos do usuário.\n\n" +
      "O Dock também mostra aplicativos abertos em tempo real,\n" +
      "facilitando a navegação entre diferentes janelas.\n\n" +
      "Além disso, ele pode ser personalizado em tamanho,\n" +
      "posição, transparência e comportamento.",
      width/2,
      height/2
    );
    desenharDock();
  }
  if (tela == 4) {
    text("Personalização", width/2, 100);
    fill(220);
    textFont(minhaFonte, 20);
    text(
      "O Ubuntu oferece diversas opções de personalização para\n" +
      "deixar o sistema com a aparência desejada pelo usuário.\n\n" +
      "É possível alterar temas, ícones, cores, fontes,\n" +
      "papéis de parede e até animações do sistema.\n\n" +
      "Com extensões do GNOME, também é possível modificar\n" +
      "menus, barra superior, Dock e funcionalidades extras.\n\n" +
      "Essa flexibilidade é uma das características mais\n" +
      "marcantes dos sistemas Linux.",
      width/2,
      height/2
    );
  }
  if (tela == 5) {
    text("GUI vs Terminal", width/2, 100);
    fill(220);
    textFont(minhaFonte, 20);
    text(
      "A GUI é a interface gráfica do sistema, utilizada através\n" +
      "de janelas, ícones, botões e elementos visuais.\n\n" +
      "Já o Terminal permite controlar o sistema utilizando\n" +
      "comandos digitados diretamente pelo usuário.\n\n" +
      "A interface gráfica é mais simples para iniciantes,\n" +
      "enquanto o terminal oferece mais velocidade e controle.\n\n" +
      "No Linux, os dois métodos são muito utilizados e se\n" +
      "complementam no uso do sistema operacional.",
      width/2,
      height/2 - 60
    );
    desenharTerminal();
  }
}
void texto(String t) {
  fill(220);
  textFont(minhaFonte, 22);
  text(t, width/2, height/2);
}
void desenharBotao(String txt, float x, float y) {
  float w = 250;
  float h = 42;
  rectMode(CENTER);
  boolean hover = mouseSobre(x, y, w, h);
  noStroke();
  fill(0, 80);
  rect(x + 4, y + 4, w, h, 14);
  for (int i = 0; i < h; i++) {
    float inter = map(i, 0, h, 0, 1);
    color c1;
    color c2;
    if (hover) {
      c1 = color(255, 140, 40);
      c2 = color(190, 70, 20);
    } else {
      c1 = color(230, 110, 30);
      c2 = color(160, 50, 15);
    }
    fill(lerpColor(c1, c2, inter));
    rect(x, y - h/2 + i, w, 1, 14);
  }
  fill(255, 50);
  rect(x, y - h/2 + 6, w - 12, 6, 10);
  stroke(255, 120);
  noFill();
  rect(x, y, w, h, 14);
  fill(255);
  textFont(minhaFonte, 18);
  text(txt, x, y - 2);
}
boolean mouseSobre(float x, float y, float w, float h) {
  return mouseX > x - w/2 &&
         mouseX < x + w/2 &&
         mouseY > y - h/2 &&
         mouseY < y + h/2;
}
void mousePressed() {
  if (tela == 0) {
    for (int i = 0; i < botoes.length; i++) {
      if (mouseSobre(width/2, 230 + i * 70, 250, 42)) {
        tela = i + 1;
      }
    }
  } else {
    if (mouseSobre(120, 650, 250, 42)) {
      tela = 0;
    }
  }
}
void desenharDock() {
  rectMode(CORNER);
  fill(60);
  rect(50, 150, 60, 300, 10);
  for (int i = 0; i < 4; i++) {

    fill(150);
    rect(60, 170 + i * 70, 40, 40, 8);
  }
}
void desenharTerminal() {
  rectMode(CORNER);
  fill(0);
  rect(width/2 - 200, height/2 + 120, 400, 180, 10);
  fill(0, 255, 0);
  textFont(minhaFonte, 20);
  textAlign(LEFT, TOP);
  text("$ sudo apt update\n$ ls",
       width/2 - 180,
       height/2 + 140);
  textAlign(CENTER, CENTER);
}

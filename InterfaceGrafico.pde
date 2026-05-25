// ============================================================
//  MÓDULO: InterfaceGrafico.pde
//  Responsabilidade: aba "Interface e ambiente" (paginacao == 5).
//
//  Funções públicas:
//    configInterfaceGrafico() — chame em setup()
//    showAmbienteDesktop()    — chame em drawConteudo() para paginacao == 5
//    mousePressedInterfaceGrafico() — chame em mousePressed() para paginacao == 5
//
//  Navegação interna:
//    telaInterface == 0  →  menu com os 5 botões
//    telaInterface == 1  →  GNOME
//    telaInterface == 2  →  Área de Trabalho
//    telaInterface == 3  →  Dock
//    telaInterface == 4  →  Personalização
//    telaInterface == 5  →  GUI vs Terminal
//
//  ⚠  Este módulo usa rectMode(CENTER) internamente.
//     showAmbienteDesktop() restaura rectMode(CORNER) ao final.
// ============================================================

// ------ Recursos privados deste módulo ------
PFont  minhaFonte;
PImage terminalImg;
PImage desktopImg;

// ------ Estado interno de navegação ------
// Renomeado de 'tela' para evitar conflito com historia_ubuntu.pde
int telaInterface = 0;

// ------ Labels dos botões do menu ------
String[] botoesInterface = {
  "GNOME",
  "Área de Trabalho",
  "Dock",
  "Personalização",
  "GUI vs Terminal"
};

// ----------------------------------------------------------
//  configInterfaceGrafico() — carrega recursos; chamar no setup()
// ----------------------------------------------------------
void configInterfaceGrafico() {
  minhaFonte  = createFont("fonts/Ubuntu-Regular.ttf", 32, true);
  terminalImg = loadImage("images/gabriel-heinzer-4Mw7nkQDByk-unsplash.jpg");
  desktopImg  = loadImage("images/admc-computer-4674946_1920.jpg");
}

// ----------------------------------------------------------
//  showAmbienteDesktop() — ponto de entrada; chamar em draw()
// ----------------------------------------------------------
void showAmbienteDesktop() {
  background(#333333);

  if (telaInterface == 0) {
    // ── Menu principal da aba ──
    fill(#E95420);
    textFont(minhaFonte, 40);
    textAlign(CENTER, CENTER);
    text("Interface Gráfica", width / 2, 100);

    for (int i = 0; i < botoesInterface.length; i++) {
      desenharBotaoInterface(botoesInterface[i], width / 2, 230 + i * 70);
    }

  } else {
    // ── Sub-telas ──
    if (telaInterface == 1) {
      subTelaGnome();
    } else {
      subTelasMostrar();
    }
    desenharBotaoInterface("Voltar", 120, 650);
  }

  // ⚠ Restaura o rectMode padrão do projeto após este módulo
  rectMode(CORNER);
  noStroke();
}

// ----------------------------------------------------------
//  mousePressedInterfaceGrafico() — delegado de mousePressed()
//  Chame apenas quando paginacao == 5
// ----------------------------------------------------------
void mousePressedInterfaceGrafico() {
  if (telaInterface == 0) {
    // Cliques nos botões do menu
    for (int i = 0; i < botoesInterface.length; i++) {
      if (mouseSobreInterface(width / 2, 230 + i * 70, 250, 42)) {
        telaInterface = i + 1;
        return;
      }
    }
  } else {
    // Clique no botão Voltar
    if (mouseSobreInterface(120, 650, 250, 42)) {
      telaInterface = 0;
    }
  }
}

// ----------------------------------------------------------
//  Sub-telas (chamadas por showAmbienteDesktop)
// ----------------------------------------------------------
void subTelaGnome() {
  fill(#E95420);
  textFont(minhaFonte, 30);
  textAlign(CENTER, CENTER);
  text("O que é GNOME?", width / 2, 100);

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
    width / 2, height / 2
  );
}

void subTelasMostrar() {
  fill(#E95420);
  textFont(minhaFonte, 30);
  textAlign(CENTER, CENTER);

  if (telaInterface == 2) {
    text("Área de Trabalho do Ubuntu", width / 2, 100);

    fill(220);
    textFont(minhaFonte, 20);
    text(
      "A área de trabalho do Ubuntu é o ambiente visual onde\n" +
      "o usuário interage com o sistema operacional através\n" +
      "de janelas, ícones e menus.\n\n" +
      "Ela permite abrir programas, acessar arquivos,\n" +
      "organizar documentos e utilizar recursos do sistema\n" +
      "de forma simples e intuitiva.\n\n" +
      "No Ubuntu, a área de trabalho utiliza o GNOME,\n" +
      "que oferece uma interface moderna com barra superior,\n" +
      "dock para aplicativos e gerenciamento de janelas.\n\n" +
      "Seu objetivo é facilitar a navegação e aumentar\n" +
      "a produtividade dos usuários no dia a dia.",
      width / 2 - 260,
      height / 2 - 20
    );

    image(desktopImg, width - 520, 170, 430, 300);
  }

  if (telaInterface == 3) {
    text("Dock", width / 2, 100);

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
      width / 2, height / 2
    );

    desenharDockInterface();
  }

  if (telaInterface == 4) {
    text("Personalização", width / 2, 100);

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
      width / 2, height / 2
    );
  }

  if (telaInterface == 5) {
    text("GUI vs Terminal", width / 2, 100);

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
      width / 2 - 250,
      height / 2 - 40
    );

    image(terminalImg, width - 500, 180, 420, 280);
    desenharTerminalInterface();
  }
}

// ----------------------------------------------------------
//  Funções auxiliares de desenho (privadas a este módulo)
// ----------------------------------------------------------
void desenharBotaoInterface(String txt, float x, float y) {
  float bw = 250;
  float bh = 42;

  rectMode(CENTER);

  boolean hover = mouseSobreInterface(x, y, bw, bh);

  noStroke();

  // Sombra
  fill(0, 80);
  rect(x + 4, y + 4, bw, bh, 14);

  // Gradiente simulado linha a linha
  for (int i = 0; i < bh; i++) {
    float inter = map(i, 0, bh, 0, 1);
    color c1 = hover ? color(255, 140, 40) : color(230, 110, 30);
    color c2 = hover ? color(190,  70, 20) : color(160,  50, 15);
    fill(lerpColor(c1, c2, inter));
    rect(x, y - bh / 2 + i, bw, 1, 14);
  }

  // Brilho
  fill(255, 50);
  rect(x, y - bh / 2 + 6, bw - 12, 6, 10);

  // Borda
  stroke(255, 120);
  noFill();
  rect(x, y, bw, bh, 14);

  // Label
  fill(255);
  noStroke();
  textFont(minhaFonte, 18);
  textAlign(CENTER, CENTER);
  text(txt, x, y - 2);
}

boolean mouseSobreInterface(float x, float y, float bw, float bh) {
  return mouseX > x - bw / 2 &&
         mouseX < x + bw / 2 &&
         mouseY > y - bh / 2 &&
         mouseY < y + bh / 2;
}

void desenharDockInterface() {
  rectMode(CORNER);
  fill(60);
  rect(50, 150, 60, 300, 10);

  for (int i = 0; i < 4; i++) {
    fill(150);
    rect(60, 170 + i * 70, 40, 40, 8);
  }
}

void desenharTerminalInterface() {
  rectMode(CORNER);
  fill(0);
  rect(width / 2 - 200, height / 2 + 120, 400, 180, 10);

  fill(0, 255, 0);
  textFont(minhaFonte, 20);
  textAlign(LEFT, TOP);
  text("$ sudo apt update\n$ ls", width / 2 - 180, height / 2 + 140);
  textAlign(CENTER, CENTER);
}

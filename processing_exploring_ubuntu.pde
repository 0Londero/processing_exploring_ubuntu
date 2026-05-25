// ============================================================
//  ARQUIVO PRINCIPAL — processing_exploring_ubuntu
//  Responsabilidade: setup, draw, eventos de mouse,
//                    controle de tela e menu de abas.
// ============================================================

// ----------------------------------------------------------
//  VARIÁVEIS GLOBAIS COMPARTILHADAS (usadas em vários .pde)
// ----------------------------------------------------------
PImage icone;
PFont  ubuntuFonte;   // fonte padrão das abas e menus

// Fontes compartilhadas por kernel.pde e gerenciamento_instalacao.pde
PFont  bold;
PFont  regular;

// ----------------------------------------------------------
//  CONTROLE DE TELA
//   telaAtual == 0  →  Terminal (login) — sem menu visível
//   telaAtual == 1  →  Aplicativo principal (menu + conteúdo)
// ----------------------------------------------------------
int telaAtual = 0;

// ----------------------------------------------------------
//  CONTROLE DO MENU DE ABAS
//   paginacao 1-6 corresponde às abas do menu superior
//   1 = Menu Inicial    4 = Comandos Básicos
//   2 = História        5 = Interface e Ambiente
//   3 = Kernel          6 = Pacotes e Instalações
// ----------------------------------------------------------
int paginacao = 1;

// Sub-navegação interna da aba Comandos Básicos
int subPaginaComandos = 0;

// ----------------------------------------------------------
//  SETUP — roda uma única vez
// ----------------------------------------------------------
void setup() {
  fullScreen();
  background(0);
  noStroke();

  // ── Recursos globais ──
  icone       = loadImage("images/ubuntu_icon.png");
  ubuntuFonte = createFont("fonts/Ubuntu-Regular.ttf", 20);
  bold        = createFont("fonts/Ubuntu-Bold.ttf", 32);
  regular     = createFont("fonts/Ubuntu-Regular.ttf", 24);

  // ── Inicialização de cada módulo ──
  configterminal();          // terminal.pde
  configHistoria();          // historia_ubuntu.pde
  configKernel();            // kernel.pde
  configInterfaceGrafico();  // InterfaceGrafico.pde
  configGerenciamento();     // gerenciamento_instalacao.pde
}

// ----------------------------------------------------------
//  DRAW — loop principal
// ----------------------------------------------------------
void draw() {

  // ── Transição terminal → app principal ──
  // Detecta quando o login foi concluído (estado definido em terminal.pde)
  if (telaAtual == 0 && estado >= 3) {
    telaAtual = 1;
    paginacao = 1;
  }

  // ── Roteamento de telas ──
  if (telaAtual == 0) {
    showterminal();
    return;
  }

  // ── Tela principal (com menu de abas) ──
  background(#111111);

  // Conteúdo primeiro — módulos podem chamar background() internamente
  drawConteudo();

  // Ícone e menu DEPOIS do conteúdo, para nunca serem cobertos por background()
  drawMenu();
}

// ----------------------------------------------------------
//  DRAW CONTEÚDO — chama a função de entrada de cada módulo
// ----------------------------------------------------------
void drawConteudo() {
  // Garante estado limpo antes de qualquer módulo
  rectMode(CORNER);
  noStroke();

  switch (paginacao) {
    case 1: showmenuinicial();          break;  // menuInicial.pde
    case 2: showHistoria();             break;  // historia_ubuntu.pde
    case 3: kernel();                   break;  // kernel.pde
    case 4: drawComandosBasicos();      break;  // ver abaixo
    case 5: showAmbienteDesktop();      break;  // InterfaceGrafico.pde
    case 6: gerenciamento_instalacao(); break;  // gerenciamento_instalacao.pde
  }

  // Restaura estado padrão após módulos que alteram rectMode/stroke
  rectMode(CORNER);
  noStroke();
}

// Aba 4: sub-navegação interna (fluxo → lista de comandos)
void drawComandosBasicos() {
  if (subPaginaComandos == 0) {
    comandos();
  } else {
    comandosMaisComuns();
  }
}

// ----------------------------------------------------------
//  DRAW MENU — abas superiores
// ----------------------------------------------------------
void drawMenu() {
  fill(#111111);
  noStroke();
  rect(0, 0, width, width / 36.92);

  image(icone, width / 91.06, width / 273.2, width / 42.7, width / 42.7);

  eraseButton();
  paintSelectedButton();
  drawHoverButton();
  textos();
}

void drawHoverButton() {
  for (int i = 0; i < 6; i++) {
    float bx = width / 22.8 + (width / 7.8 * i);
    float by = width / 273.2;
    float bw = width / 8;
    float bh = width / 42.7;
    if (mouseX >= bx && mouseX <= bx + bw &&
        mouseY >= by && mouseY <= by + bh &&
        paginacao != i + 1) {
      fill(#451909);
      rect(bx, by, bw, bh, 10, 10, 0, 0);
    }
  }
  textos();
}

// ----------------------------------------------------------
//  MOUSE PRESSED — único no projeto; delega para módulos
// ----------------------------------------------------------
void mousePressed() {

  // Bloqueia cliques durante o terminal
  if (telaAtual == 0) return;

  // ── Cliques nas abas (sempre têm prioridade) ──
  for (int i = 0; i < 6; i++) {
    float bx = width / 22.8 + (width / 7.8 * i);
    float by = width / 273.2;
    float bw = width / 8;
    float bh = width / 42.7;
    if (mouseX >= bx && mouseX <= bx + bw &&
        mouseY >= by && mouseY <= by + bh) {
      paginacao = i + 1;
      subPaginaComandos = 0;  // reseta sub-página ao trocar de aba
      return;
    }
  }

  // ── Delega cliques internos para cada módulo ──
  switch (paginacao) {
    case 2: mousePressedHistoria();          break;  // historia_ubuntu.pde
    case 4: mousePressedComandos();          break;  // ver abaixo
    case 5: mousePressedInterfaceGrafico();  break;  // InterfaceGrafico.pde
    case 6: mousePressedGerenciamento();     break;  // gerenciamento_instalacao.pde
  }
}

// Handler interno da aba Comandos Básicos
void mousePressedComandos() {
  if (subPaginaComandos == 0 &&
      mouseX >= width / 1.2 && mouseX <= width / 1.2 + height / 10 &&
      mouseY >= height / 1.2 && mouseY <= height / 1.2 + height / 20) {
    subPaginaComandos = 1;
  }
}

// ----------------------------------------------------------
//  HELPERS DO MENU
// ----------------------------------------------------------
void eraseButton() {
  fill(#222222);
  for (int i = 0; i < 6; i++) {
    rect(width / 22.8 + (width / 7.8 * i), width / 273.2,
         width / 8, width / 42.7, 10, 10, 0, 0);
  }
}

void paintSelectedButton() {
  if (paginacao >= 1 && paginacao <= 6) {
    fill(#e95420);
    rect(width / 22.8 + (width / 7.8 * (paginacao - 1)), width / 273.2,
         width / 8, width / 42.7, 10, 10, 0, 0);
  }
}

void textos() {
  fill(255, 255, 255);
  textFont(ubuntuFonte);
  textAlign(LEFT);
  String[] labels = {
    "Menu principal", "História", "Kernel",
    "Comandos básicos", "Interface e ambiente", "Pacotes e instalações"
  };
  for (int i = 0; i < 6; i++) {
    text(labels[i], width / 20 + (width / 7.8 * i), width / 51);
  }
}

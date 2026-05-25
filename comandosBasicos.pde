// ============================================================
//  MÓDULO: comandosBasicos.pde
//  Responsabilidade: aba "Comandos Básicos" (paginacao == 4).
//
//  Funções públicas:
//    comandos()          — sub-tela 1: fluxo de um comando
//    comandosMaisComuns()— sub-tela 2: lista de comandos comuns
//
//  ⚠  A variável 'subPaginaComandos' que controla qual sub-tela exibir
//     está declarada no arquivo principal.
//  ⚠  O botão "PRÓXIMO" é DESENHADO aqui, mas o clique é capturado
//     em mousePressed() no arquivo principal (que seta subPaginaComandos = 1).
// ============================================================

// ----------------------------------------------------------
//  Sub-tela 1: Fluxo de um comando
// ----------------------------------------------------------
void comandos() {
  fill(#333333);
  rect(1, width / 36.92, width, height);

  fill(#3D062D);
  rect(100, 100, 1720, 930, 10);

  // Título
  fill(255, 255, 255);
  textFont(ubuntuFonte);
  textSize(60);
  textAlign(CENTER);
  text("FLUXO DE UM COMANDO", width / 2, width / 10);

  // ── Diagrama de setas ────────────────────────────────────
  // Seis blocos (chevrons) posicionados com múltiplos de width/7.5
  int[] blocoIdx = {0, 1, 2, 3, 4, 5};
  color[] coresBlocos = {
    color(0x72, 0x5D, 0x6C),   // 0
    color(0x42, 0x2C, 0x3C),   // 1
    color(0x72, 0x5D, 0x6C),   // 2
    color(0x42, 0x2C, 0x3C),   // 3
    color(0x72, 0x5D, 0x6C),   // 4
    color(0x42, 0x2C, 0x3C)    // 5
  };

  for (int i = 0; i < 6; i++) {
    float bx = width / 10 + (width / 7.5 * i);
    float by = height / 2.8;
    float bw = width / 9.6;
    float bh = width / 6.4;

    fill(coresBlocos[i]);
    rect(bx, by, bw, bh);

    // Seta para a direita
    fill(coresBlocos[i]);
    triangle(bx + bw, by,
             bx + bw, by + bh,
             width / 4.5 + (width / 7.5 * i), height / 2);

    // Recorte triangular na esquerda (efeito chevron)
    fill(#3D062D);
    triangle(bx, by,
             bx, by + bh,
             width / 8.5 + (width / 7.5 * i), height / 2);
  }

  // ── Labels dos blocos ────────────────────────────────────
  String[] titulos = {"TERMINAL", "USUÁRIO", "SHELL", "OS", "KERNEL", "HARDWARE"};
  String[][] subtextos = {
    {"Interface de texto", "onde o usuário", "digita os", "comandos"},
    {"Solicita uma", "tarefa", "", ""},
    {"Programa que", "interpreta os", "comandos", ""},
    {"Organiza os", "arquivos e", "permissões.", ""},
    {"Conversa com o", "hardware", "", ""},
    {"Parte física do", "computador", "", ""}
  };

  textAlign(LEFT);
  for (int i = 0; i < 6; i++) {
    float lx = width / 8 + (width / 7.5 * i);

    fill(#ffffff);
    textSize(30);
    text(titulos[i], lx, height / 2);

    textSize(20);
    for (int j = 0; j < subtextos[i].length; j++) {
      if (subtextos[i][j].length() > 0) {
        text(subtextos[i][j], lx, height / 1.9 + (height / 40 * j));
      }
    }
  }

  // ── Botão PRÓXIMO ────────────────────────────────────────
  fill(#E95420);
  rect(width / 1.2, height / 1.2, height / 10, height / 20, 5);
  fill(#FFFFFF);
  textSize(20);
  textAlign(LEFT);
  text("PRÓXIMO", width / 1.193, height / 1.154);
}

// ----------------------------------------------------------
//  Sub-tela 2: Lista de comandos mais comuns
// ----------------------------------------------------------
void comandosMaisComuns() {
  fill(#333333);
  rect(1, width / 36.92, width, height);

  fill(#9E2D15);
  rect(100, 100, 1720, 930, 10);

  // Título
  fill(255, 255, 255);
  textFont(ubuntuFonte);
  textSize(60);
  textAlign(CENTER);
  text("COMANDOS BÁSICOS", width / 2, width / 10);

  // ── Janela estilo terminal ───────────────────────────────
  fill(0, 60);
  rect(width / 3.8, width / 7, width / 2, height / 1.45, 10);

  fill(#222222);
  rect(width / 4, width / 8, width / 2, height / 20, 10, 10, 0, 0);

  fill(#2d0922);
  rect(width / 4, width / 7, width / 2, height / 1.5, 0, 0, 10, 10);

  fill(#111111);
  textSize(25);
  fill(#ffffff);
  textAlign(CENTER);
  text("user@computador:~", width / 2, width / 7.25);

  // ── Conteúdo ─────────────────────────────────────────────
  textAlign(LEFT);
  float lx = width / 3.8;
  float ly = width / 6;
  float dy = width / 40;

  text("COMANDOS PARA MANIPULAÇÃO DE DIRETÓRIO", lx, ly + dy * 0);
  text("~$ ls    - lista arquivos e pastas do diretório", lx, ly + dy * 1);
  text("~$ cd    - muda de diretório",                    lx, ly + dy * 2);
  text("~$ pwd   - mostra o diretório atual",             lx, ly + dy * 3);
  text("~$ mkdir - cria uma nova pasta",                  lx, ly + dy * 4);
  text("~$ rmdir - remove uma pasta vazia",               lx, ly + dy * 5);

  text("COMANDOS PARA MANIPULAÇÃO DE ARQUIVOS",           lx, ly + dy * 7);
  text("~$ cat   - mostra o conteúdo de um arquivo",      lx, ly + dy * 8);
  text("~$ rm    - remove arquivos",                      lx, ly + dy * 9);
  text("~$ cp    - copia arquivos ou pastas",             lx, ly + dy * 10);
  text("~$ mv    - move ou renomeia arquivos",            lx, ly + dy * 11);
}

import processing.video.*;  // necessário para a classe Movie

// ============================================================
//  MÓDULO: gerenciamento_instalacao.pde
//  Responsabilidade: aba "Pacotes e instalações" (paginacao == 6).
//
//  Funções públicas:
//    configGerenciamento()         — chame em setup()
//    gerenciamento_instalacao()    — chame em drawConteudo() para paginacao == 6
//    mousePressedGerenciamento()   — chame em mousePressed() para paginacao == 6
//
//  Navegação interna:
//    telaGerenciamento == 0  →  menu com 4 botões
//    telaGerenciamento == 1  →  pacotes
//    telaGerenciamento == 2  →  instalação
//    telaGerenciamento == 3  →  comandos principais
//    telaGerenciamento == 4  →  vantagens
//
//  ⚠  Usa as variáveis globais 'bold' e 'regular' (PFont)
//     declaradas no arquivo principal.
//  ⚠  Usa a biblioteca Processing Video para reprodução de vídeo.
//     botoes() e botao_voltar() também são usadas por kernel.pde;
//     elas estão declaradas aqui mas são visíveis globalmente.
// ============================================================

// ------ Recursos privados deste módulo ------
// (imagens: declare o nome exato dos arquivos no loadImage abaixo)
PImage pacote_ubuntu;
PImage pacote_desenho;
PImage fluxograma;
PImage instalacaoimg;
PImage firefox;
PImage imgterminal;
PImage vantagem1, vantagem2, vantagem3, vantagem4;
Movie  terminal;   // objeto de vídeo — requer biblioteca Processing Video

// ------ Estado interno de navegação ------
// Renomeado de 'tela_atual' para evitar conflito com outros módulos
int     telaGerenciamento    = 0;
boolean mostrarVideoGerenciamento = false;

// ----------------------------------------------------------
//  configGerenciamento() — carrega recursos; chamar no setup()
// ----------------------------------------------------------
void configGerenciamento() {
  pacote_ubuntu  = loadImage("images/pacote_ubuntu.png");
  pacote_desenho = loadImage("images/pacote_desenho.png");
  fluxograma     = loadImage("images/fluxograma.png");
  instalacaoimg  = loadImage("images/instalacao.png");
  firefox        = loadImage("images/firefox.png");
  imgterminal    = loadImage("images/imgterminal.png");
  vantagem1      = loadImage("images/vantagem1.png");
  vantagem2      = loadImage("images/vantagem2.png");
  vantagem3      = loadImage("images/vantagem3.png");
  vantagem4      = loadImage("images/vantagem4.png");
  terminal       = new Movie(this, "terminal.mp4");
}

// ----------------------------------------------------------
//  gerenciamento_instalacao() — ponto de entrada; chamar em draw()
// ----------------------------------------------------------
void gerenciamento_instalacao() {
  if (telaGerenciamento == 0) {
    menuGerenciamento();
  } else if (telaGerenciamento == 1) {
    pacotes();
  } else if (telaGerenciamento == 2) {
    instalacao();
  } else if (telaGerenciamento == 3) {
    comandosPrincipais();   // ← renomeado; evita conflito com comandosBasicos.pde
  } else if (telaGerenciamento == 4) {
    vantagens();
  }
}

// ----------------------------------------------------------
//  mousePressedGerenciamento() — delegado de mousePressed()
//  Chame apenas quando paginacao == 6
// ----------------------------------------------------------
void mousePressedGerenciamento() {
  if (telaGerenciamento == 0) {
    // Botão superior esquerdo → pacotes
    if (mouseX >= width / 18.21 && mouseX <= width / 2.02 &&
        mouseY >= height / 3.37  && mouseY <= height / 2.03) {
      telaGerenciamento = 1;
    }
    // Botão superior direito → instalação
    if (mouseX >= width / 1.95 && mouseX <= width / 1.04 &&
        mouseY >= height / 3.37 && mouseY <= height / 2.03) {
      telaGerenciamento = 2;
    }
    // Botão inferior esquerdo → comandos
    if (mouseX >= width / 18.21 && mouseX <= width / 2.02 &&
        mouseY >= height / 1.6   && mouseY <= height / 1.22) {
      telaGerenciamento = 3;
    }
    // Botão inferior direito → vantagens
    if (mouseX >= width / 1.95 && mouseX <= width / 1.04 &&
        mouseY >= height / 1.6   && mouseY <= height / 1.22) {
      telaGerenciamento = 4;
    }

  } else if (telaGerenciamento == 1) {
    if (cliqueBotaoVoltar()) telaGerenciamento = 0;

  } else if (telaGerenciamento == 2) {
    if (cliqueBotaoVoltar()) {
      telaGerenciamento = 0;
    }
    // Clique no vídeo
    if (mouseX >= width / 1.6  && mouseX <= width / 1.04 &&
        mouseY >= height / 2.4  && mouseY <= height / 1.22) {
      terminal.play();
      mostrarVideoGerenciamento = true;
    }

  } else if (telaGerenciamento == 3) {
    if (cliqueBotaoVoltar()) telaGerenciamento = 0;

  } else if (telaGerenciamento == 4) {
    if (cliqueBotaoVoltar()) telaGerenciamento = 0;
  }
}

// Helper: verifica clique na área do botão voltar
boolean cliqueBotaoVoltar() {
  return mouseX >= width / 18.21 &&
         mouseX <= (width / 18.21) * 2 &&
         mouseY >= height / 1.16 &&
         mouseY <= (height / 1.16) + (height / 10.24);
}

// ----------------------------------------------------------
//  movieEvent() — callback da biblioteca Video (único no projeto)
// ----------------------------------------------------------
void movieEvent(Movie m) {
  m.read();
}

// ----------------------------------------------------------
//  Sub-telas (chamadas por gerenciamento_instalacao)
// ----------------------------------------------------------
void menuGerenciamento() {
  background(#333333);
  textAlign(CENTER, CENTER);

  // Título
  botoes(width / 18.21, height / 10.9, width / 1.11, height / 7.68, height / 38.4);
  fill(#2C001E);
  textFont(bold);
  text(
    "Gerenciamento de Pacotes e Instalação de Programas",
    (width / 18.21) + ((width / 1.11) / 2),
    (height / 10.9) + ((height / 7.68) / 2)
  );

  // Botão superior esquerdo
  botoes(width / 18.21, height / 3.37, width / 2.27, height / 5.12, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  text(
    "O que são pacotes e\n gerenciadores de pacotes",
    (width / 18.21) + ((width / 2.27) / 2),
    (height / 3.37) + ((height / 5.12) / 2)
  );

  // Botão superior direito
  botoes(width / 1.95, height / 3.37, width / 2.27, height / 5.12, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  text(
    "Como o Ubuntu\n instala os programas",
    (width / 1.95) + ((width / 2.27) / 2),
    (height / 3.37) + ((height / 5.12) / 2)
  );

  // Botão inferior esquerdo
  botoes(width / 18.21, height / 1.6, width / 2.27, height / 5.12, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  text(
    "Comandos Principais",
    (width / 18.21) + ((width / 2.27) / 2),
    (height / 1.6) + ((height / 5.12) / 2)
  );

  // Botão inferior direito
  botoes(width / 1.95, height / 1.6, width / 2.27, height / 5.12, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  text(
    "Vantagens do\n sistema Ubuntu",
    (width / 1.95) + ((width / 2.27) / 2),
    (height / 1.6) + ((height / 5.12) / 2)
  );
}

void pacotes() {
  background(#333333);
  textAlign(CENTER, CENTER);

  botoes(width / 18.21, height / 12.8, width / 1.11, height / 7.68, height / 38.4);
  fill(#2C001E);
  textFont(bold);
  text(
    "O que são pacotes e gerenciadores de pacotes",
    (width / 18.21) + ((width / 1.11) / 2),
    (height / 12.8) + ((height / 7.68) / 2)
  );

  botoes(width / 18.21, height / 4.5, width / 1.4, height / 5.12, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  textSize(height / 35);
  text(
    "Pacotes são arquivos que armazenam programas e todos os \n" +
    "componentes necessários para seu funcionamento, como bibliotecas e dependências.\n" +
    "No Ubuntu, o gerenciamento desses pacotes é feito pelo APT,\n" +
    " sistema responsável por instalar, atualizar e remover programas de forma automática e segura.",
    (width / 18.21) + ((width / 1.4) / 2),
    (height / 4.5) + ((height / 5.12) / 2)
  );

  image(pacote_ubuntu, width / 1.24, height / 4.5, width / 9, height / 5.12);
  image(pacote_desenho, width / 18.21, height / 2.25, width / 5, height / 2.56);

  botoes(width / 3.54, height / 2.25, width / 2.57, height / 1.89, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  textSize(height / 35);
  text(
    "Programa:\nAplicação principal que o usuário deseja \ninstalar e utilizar.\n" +
    "Biblioteca:\nConjunto de funções e recursos usados\n por programas para executar tarefas específicas.\n" +
    "Dependências:\nArquivos e componentes necessários para\n que o programa funcione corretamente.\n" +
    "Arquivos:\nDocumentos internos do software responsáveis\n pelo funcionamento da aplicação.\n" +
    "Configurações:\nInformações que definem preferências\n e comportamento do programa no sistema.",
    (width / 3.54) + (width / 2.57 / 2),
    (height / 2.25) + (height / 1.89 / 2)
  );

  botoes(width / 1.47, height / 2.25, width / 3.53, height / 1.89, height / 38.4);
  image(fluxograma, width / 1.526, height / 2.25, width / 2.98, height / 2);

  botao_voltar();
}

void instalacao() {
  background(#333333);
  textAlign(CENTER, CENTER);

  botoes(width / 18.21, height / 12.8, width / 1.11, height / 7.68, height / 38.4);
  fill(#2C001E);
  textFont(bold);
  text(
    "Como o Ubuntu instala os programas",
    (width / 18.21) + ((width / 1.11) / 2),
    (height / 12.8) + ((height / 7.68) / 2)
  );

  botoes(width / 18.21, height / 4.5, width / 1.11, height / 5.5, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  textSize(height / 35);
  text(
    "Quando o usuário solicita a instalação de um programa, o Ubuntu verifica \n" +
    "os arquivos necessários, realiza o download e configura automaticamente o software no sistema.\n" +
    " Esse processo reduz erros de instalação e facilita o uso do computador.",
    (width / 18.21) + ((width / 1.11) / 2),
    (height / 4.5) + ((height / 5.5) / 2)
  );

  botoes(width / 18.21, height / 2.4, width / 1.8, height / 2.5, height / 38.4);
  image(instalacaoimg, width / 19, height / 2.8, width / 1.8, height / 1.8);

  botoes(width / 1.62, height / 2.4, width / 2.97, height / 2.5, height / 38.4);
  image(firefox, width / 1.52, height / 2.3, width / 4, height / 2.5);

  // Reprodução de vídeo
  if (mostrarVideoGerenciamento) {
    image(terminal, width / 4, height / 4, width / 2, height / 2);
  }
  if (mostrarVideoGerenciamento && terminal.time() >= terminal.duration() - 0.1) {
    mostrarVideoGerenciamento = false;
    terminal.stop();
  }

  botao_voltar();
}

// Renomeado de 'comandos()' para evitar conflito com comandosBasicos.pde
void comandosPrincipais() {
  background(#333333);
  textAlign(CENTER, CENTER);

  botoes(width / 18.21, height / 12.8, width / 1.11, height / 7.68, height / 38.4);
  fill(#2C001E);
  textFont(bold);
  text(
    "Comandos Principais",
    (width / 18.21) + ((width / 1.11) / 2),
    (height / 12.8) + ((height / 7.68) / 2)
  );

  botoes(width / 18.21, height / 4.5, width / 1.11, height / 5.5, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  textSize(height / 35);
  text(
    "O terminal permite controlar o sistema através de comandos de texto.\n" +
    "Com poucos comandos, é possível instalar programas, atualizar o sistema e remover softwares rapidamente.",
    (width / 18.21) + ((width / 1.11) / 2),
    (height / 4.5) + ((height / 5.5) / 2)
  );

  image(imgterminal, width / 18.21, height / 2.4, width / 2.3, height / 2.3);

  botoes(width / 2, height / 2.4, width / 2.2, height / 2.3, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  textSize(height / 35);
  text(
    "Update: Atualiza a lista de programas disponíveis nos \nrepositórios do Ubuntu.\n" +
    "Upgrade: Instala versões mais recentes \ndos programas já presentes no sistema.\n" +
    "Install: Instala um programa automaticamente junto\n com suas dependências.\n" +
    "Remove: Remove um programa instalado\n do sistema.\n" +
    "Apt search: Pesquisa programas disponíveis nos\n repositórios do Ubuntu.",
    (width / 2) + ((width / 2.2) / 2),
    (height / 2.4) + ((height / 2.3) / 2)
  );

  botao_voltar();
}

void vantagens() {
  background(#333333);
  textAlign(CENTER, CENTER);

  botoes(width / 18.21, height / 12.8, width / 1.11, height / 7.68, height / 38.4);
  fill(#2C001E);
  textFont(bold);
  text(
    "Vantagens do sistema Ubuntu",
    (width / 18.21) + ((width / 1.11) / 2),
    (height / 12.8) + ((height / 7.68) / 2)
  );

  botoes(width / 18.21, height / 4.5, width / 1.11, height / 5.5, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  textSize(height / 35);
  text(
    "O Ubuntu oferece um sistema organizado e eficiente para gerenciamento de softwares.\n" +
    "Isso melhora a estabilidade do sistema, facilita atualizações\n" +
    " e torna o uso mais prático para o usuário.",
    (width / 18.21) + ((width / 1.11) / 2),
    (height / 4.5) + ((height / 5.5) / 2)
  );

  botoes(width / 18.21, height / 2.4, width / 4.52, height / 2.3, height / 38.4);
  image(vantagem1, width / 18.21, height / 2.4, width / 4.52, height / 2.3);

  botoes(width / 3.52, height / 2.4, width / 4.52, height / 2.3, height / 38.4);
  image(vantagem2, width / 3.52, height / 2.4, width / 4.52, height / 2.3);

  botoes(width / 1.95, height / 2.4, width / 4.52, height / 2.3, height / 38.4);
  image(vantagem3, width / 1.95, height / 2.4, width / 4.52, height / 2.3);

  botoes(width / 1.35, height / 2.4, width / 4.62, height / 2.3, height / 38.4);
  image(vantagem4, width / 1.35, height / 2.4, width / 4.62, height / 2.3);

  botao_voltar();
}

// ----------------------------------------------------------
//  Utilitários compartilhados com kernel.pde
//  botoes() e botao_voltar() ficam aqui pois ambos os módulos
//  são compilados juntos e kernel.pde as utiliza.
// ----------------------------------------------------------
void botoes(float x, float y, float w, float h, float r) {
  float sombra = height / 153.6;
  noStroke();
  fill(#E95420);
  rect(x + sombra, y + sombra, w, h, r);
  fill(#AEA79F);
  rect(x, y, w, h, r);
}

void botao_voltar() {
  botoes(width / 18.21, height / 1.16, width / 18.21, height / 10.24, height / 38.4);
  stroke(#2C001E);
  strokeWeight(10);
  line(
    (width / 18.21) + (width / 91),   (height / 1.16) + (height / 10.24 / 2),
    (width / 18.21) + (width / 39),   (height / 1.16) + (height / 51.2)
  );
  line(
    (width / 18.21) + (width / 91),   (height / 1.16) + (height / 10.24 / 2),
    (width / 18.21) + (width / 39),   (height / 1.16) + (height / 12.8)
  );
  line(
    (width / 18.21) + (width / 91),   (height / 1.16) + (height / 10.24 / 2),
    (width / 18.21) + (width / 22.75),(height / 1.16) + (height / 10.24 / 2)
  );
  noStroke();
}

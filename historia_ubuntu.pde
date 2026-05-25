// ============================================================
//  MÓDULO: historia_ubuntu.pde
//  Responsabilidade: aba "História" (paginacao == 2).
//
//  Funções públicas:
//    configHistoria()         — chame em setup()
//    showHistoria()           — chame em drawConteudo() para paginacao == 2
//    mousePressedHistoria()   — chame em mousePressed() para paginacao == 2
//
//  Navegação interna:
//    telaHistoria == 0  →  linha do tempo (menu)
//    telaHistoria == 1  →  Projeto GNU
//    telaHistoria == 2  →  Criação do Linux
//    telaHistoria == 3  →  Linux começa a ser utilizado
//    telaHistoria == 4  →  Criação do Ubuntu
//    telaHistoria == 5  →  Consolidação mundial do Linux
//
//  ⚠  'ubuntu' e 'ubuntuBold' são PFonts privadas deste módulo,
//     distintas de 'ubuntuFonte' do arquivo principal.
//  ⚠  botoes_historia() e botao_voltar_historia() são versões
//     privadas (visual diferente) das funções homônimas de outros módulos.
// ============================================================

// ------ Recursos privados deste módulo ------
PFont  ubuntu;
PFont  ubuntuBold;
PImage ImgGNU;
PImage pinguimLinux;
PImage slackwarelogo;
PImage ImglogoUbuntu;
PImage servidor;

// ------ Estado interno de navegação ------
// Renomeado de 'tela' para evitar conflito com InterfaceGrafico.pde
int telaHistoria = 0;

// ----------------------------------------------------------
//  configHistoria() — carrega recursos; chamar no setup()
//  (era: setupD)
// ----------------------------------------------------------
void configHistoria() {
  ubuntu     = createFont("fonts/Ubuntu-Regular.ttf", 32);
  ubuntuBold = createFont("fonts/Ubuntu-Bold.ttf", 40);
  ImgGNU         = loadImage("images/GNU.png");
  pinguimLinux   = loadImage("images/pinguim_linux.png");
  slackwarelogo  = loadImage("images/Slackware-Logo.png");
  ImglogoUbuntu  = loadImage("images/logoUbuntu.png");
  servidor       = loadImage("images/servidor.jpg");
}

// ----------------------------------------------------------
//  showHistoria() — ponto de entrada; chamar em draw()
//  (era: drawD)
// ----------------------------------------------------------
void showHistoria() {
  stroke(0);
  strokeWeight(1);
  fill(#333333);
  rect(0, 0, width, height);

  if (telaHistoria == 0) {
    retanguloMenu();
    textoMenu();
    linha();
    data1(); data2(); data3(); data4(); data5();
    GNU();
    setaLinha();
    criacaoLinux();
    utilLinux();
    criacaoUbuntu();
    consoLinux();
  }
  if (telaHistoria == 1) {
    sGnu();
    retanguloMenu();
    textoMenuGnu();
    botao_voltar_historia();
    Fundo();
    textoGnu();
  }
  if (telaHistoria == 2) {
    retanguloMenu();
    textoMenuCrLinux();
    botao_voltar_historia();
    imagemPinguim();
    Fundo();
    textoCrLinux();
  }
  if (telaHistoria == 3) {
    retanguloMenu();
    textoMenuUtiLinux();
    botao_voltar_historia();
    Fundo();
    textoUtiLinux();
    slackwareL();
  }
  if (telaHistoria == 4) {
    retanguloMenu();
    textoCrUbuntu();
    botao_voltar_historia();
    logoUbuntu();
    Fundo();
    textoUbuntu();
  }
  if (telaHistoria == 5) {
    retanguloMenu();
    textoConsoLinux();
    botao_voltar_historia();
    ubuntuNav();
    Fundo();
    textoLinux();
  }
}

// ----------------------------------------------------------
//  mousePressedHistoria() — delegado de mousePressed()
//  Chame apenas quando paginacao == 2
// ----------------------------------------------------------
void mousePressedHistoria() {
  if (telaHistoria == 0) {
    // Clique nos eventos da linha do tempo
    if (mouseX > width * 0.01 && mouseX < width * 0.01 + width * 0.16 &&
        mouseY > height * 0.38  && mouseY < height * 0.38 + height * 0.12) {
      telaHistoria = 1;
    }
    if (mouseX > width * 0.18 && mouseX < width * 0.18 + width * 0.18 &&
        mouseY > height * 0.58  && mouseY < height * 0.58 + height * 0.12) {
      telaHistoria = 2;
    }
    if (mouseX > width * 0.37 && mouseX < width * 0.37 + width * 0.16 &&
        mouseY > height * 0.38  && mouseY < height * 0.38 + height * 0.12) {
      telaHistoria = 3;
    }
    if (mouseX > width * 0.54 && mouseX < width * 0.54 + width * 0.58 &&
        mouseY > height * 0.58  && mouseY < height * 0.58 + height * 0.12) {
      telaHistoria = 4;
    }
    if (mouseX > width * 0.73 && mouseX < width * 0.73 + width * 0.16 &&
        mouseY > height * 0.39  && mouseY < height * 0.39 + height * 0.12) {
      telaHistoria = 5;
    }
  } else {
    // Botão Voltar (volta à linha do tempo)
    if (mouseX >= width / 18.21 && mouseX <= (width / 18.21) * 2 &&
        mouseY >= height / 1.16  && mouseY <= (height / 1.16) + (height / 10.24)) {
      telaHistoria = 0;
    }
  }
}

// ----------------------------------------------------------
//  Tela 0: Linha do tempo
// ----------------------------------------------------------
void retanguloMenu() {
  stroke(0);
  strokeWeight(3);
  fill(#5E2750);
  rect(0, height * 0.05, width, height * 0.12, 20);
}

void textoMenu() {
  fill(255);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("História do Linux & Ubuntu", width / 2, height * 0.11);
}

void linha() {
  strokeWeight(6);
  line(width * 0.008, height * 0.55, width * 0.97, height * 0.55);
}

void data1() { fill(255); textAlign(CENTER); text("1983", width * 0.089, height * 0.6);  }
void data2() { fill(255); textAlign(CENTER); text("1991", width * 0.27,  height * 0.53); }
void data3() { fill(255); textAlign(CENTER); text("1993", width * 0.45,  height * 0.6);  }
void data4() { fill(255); textAlign(CENTER); text("2004", width * 0.63,  height * 0.53); }
void data5() { fill(255); textAlign(CENTER); text("2010", width * 0.81,  height * 0.6);  }

void GNU() {
  fill(#AEA79F);
  rect(width * 0.01, height * 0.38, width * 0.16, height * 0.12, 25);
  fill(#2C001E);
  textAlign(CENTER, CENTER);
  textFont(ubuntu);
  text("GNU", width * 0.01 + width * 0.16 / 2, height * 0.38 + height * 0.12 / 2);
}

void criacaoLinux() {
  fill(#AEA79F);
  rect(width * 0.18, height * 0.58, width * 0.18, height * 0.12, 25);
  fill(#2C001E);
  textAlign(CENTER, CENTER);
  textFont(ubuntu);
  text("Criação do Linux", width * 0.18 + width * 0.18 / 2, height * 0.58 + height * 0.12 / 2);
}

void utilLinux() {
  fill(#AEA79F);
  rect(width * 0.37, height * 0.38, width * 0.16, height * 0.12, 25);
  fill(#2C001E);
  textAlign(CENTER, BOTTOM);
  textFont(ubuntu);
  text("Linux começa", width * 0.37 + width * 0.16 / 2, height * 0.38 + height * 0.12 / 2);
  fill(#2C001E);
  textAlign(CENTER, TOP);
  text("a ser utilizado", width * 0.37 + width * 0.16 / 2, height * 0.39 + height * 0.12 / 2);
}

void criacaoUbuntu() {
  fill(#AEA79F);
  rect(width * 0.54, height * 0.58, width * 0.18, height * 0.12, 25);
  fill(#2C001E);
  textAlign(CENTER, BOTTOM);
  textFont(ubuntu);
  text("Criação do", width * 0.54 + width * 0.18 / 2, height * 0.58 + height * 0.12 / 2);
  fill(#2C001E);
  textAlign(CENTER, TOP);
  text("Ubuntu", width * 0.54 + width * 0.18 / 2, height * 0.58 + height * 0.12 / 2);
}

void consoLinux() {
  fill(#AEA79F);
  rect(width * 0.73, height * 0.38, width * 0.16, height * 0.12, 25);
  fill(#2C001E);
  textAlign(CENTER, BOTTOM);
  textFont(ubuntu);
  text("Consolidação", width * 0.73 + width * 0.16 / 2, height * 0.38 + height * 0.12 / 2);
  fill(#2C001E);
  textAlign(CENTER, TOP);
  text("geral do linux", width * 0.73 + width * 0.16 / 2, height * 0.39 + height * 0.12 / 2);
}

void setaLinha() {
  fill(#5E2750);
  triangle(
    width * 0.945, height * 0.52,
    width * 1.00,  height * 0.55,
    width * 0.945, height * 0.58
  );
}

// ----------------------------------------------------------
//  Telas de detalhe (1–5): elementos compartilhados
// ----------------------------------------------------------
void Fundo() {
  noStroke();
  fill(#AEA79F);
  rect(width * 0.4, height * 0.25, width * 0.5, height * 0.63, 20);
}

// botao_voltar versão Historia — visual diferente do gerenciamento
// Renomeada para evitar conflito com botao_voltar() de gerenciamento_instalacao.pde
void botao_voltar_historia() {
  botoes_historia(width / 18.21, height / 1.16, width / 18.21, height / 10.24, height / 38.4);
  stroke(#E95420);
  strokeWeight(10);
  line(
    (width / 18.21) + (width / 91),    (height / 1.16) + (height / 10.24 / 2),
    (width / 18.21) + (width / 39),    (height / 1.16) + (height / 51.2)
  );
  line(
    (width / 18.21) + (width / 91),    (height / 1.16) + (height / 10.24 / 2),
    (width / 18.21) + (width / 39),    (height / 1.16) + (height / 12.8)
  );
  line(
    (width / 18.21) + (width / 91),    (height / 1.16) + (height / 10.24 / 2),
    (width / 18.21) + (width / 22.75), (height / 1.16) + (height / 10.24 / 2)
  );
  noStroke();
}

// Versão da função botoes para este módulo — visual invertido (bege sombra, roxo principal)
// Renomeada para evitar conflito com botoes() de gerenciamento_instalacao.pde
void botoes_historia(float x, float y, float w, float h, float r) {
  float sombra = height / 153.6;
  noStroke();
  fill(#AEA79F);
  rect(x + sombra, y + sombra, w, h, r);
  fill(#2C001E);
  rect(x, y, w, h, r);
}

// ----------------------------------------------------------
//  Tela 1: Projeto GNU
// ----------------------------------------------------------
void sGnu() {
  image(ImgGNU, width * 0.08, height * 0.25, width * 0.26, height * 0.45);
}

void textoMenuGnu() {
  noStroke();
  fill(#FFFFFF);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Projeto GNU", width / 2, height * 0.11);
}

void textoGnu() {
  fill(#2C001E);
  textFont(ubuntu);
  text(
    "O Projeto GNU foi lançado em 1983 por Richard Stallman, é uma iniciativa de colaboração global " +
    "voltada para a criação de um sistema operacional composto inteiramente por software livre. " +
    "Seu objetivo fundamental é garantir a autonomia do usuário, assegurando a liberdade de executar, " +
    "estudar, modificar e redistribuir os programas, o que impede que o software seja usado como " +
    "ferramenta de controle ou restrição.",
    width * 0.4, height * 0.25, width * 0.5, height * 0.63
  );
}

// ----------------------------------------------------------
//  Tela 2: Criação do Linux
// ----------------------------------------------------------
void textoMenuCrLinux() {
  noStroke();
  fill(#FFFFFF);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Criação do Linux", width / 2, height * 0.11);
}

void imagemPinguim() {
  image(pinguimLinux, width * 0.08, height * 0.25, width * 0.26, height * 0.45);
}

void textoCrLinux() {
  fill(#2C001E);
  textFont(ubuntu);
  text(
    "O Linux foi criado em 1991 por Linus Torvalds, " +
    "um estudante finlandês de ciência da computação. " +
    "Inicialmente, o projeto surgiu como um hobby para criar um sistema operacional " +
    "inspirado no Unix, mas gratuito e aberto para modificações. " +
    "Linus publicou o código na internet, permitindo que programadores do mundo todo " +
    "colaborassem com melhorias.",
    width * 0.4, height * 0.25, width * 0.5, height * 0.63
  );
}

// ----------------------------------------------------------
//  Tela 3: Linux começa a ser utilizado
// ----------------------------------------------------------
void textoMenuUtiLinux() {
  noStroke();
  fill(#FFFFFF);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Linux começa a ser utilizado", width / 2, height * 0.11);
}

void textoUtiLinux() {
  fill(#2C001E);
  textFont(ubuntu);
  text(
    " Em 1993, o Linux começou a ganhar popularidade porque oferecia uma alternativa gratuita, " +
    "estável e aberta aos sistemas operacionais proprietários da época. Nesse período surgiram " +
    "as primeiras distribuições mais organizadas, como o Debian e o Slackware, " +
    "que facilitavam a instalação e o uso do sistema. O Linux passou a ser utilizado " +
    "principalmente por estudantes, programadores e universidades.",
    width * 0.4, height * 0.25, width * 0.5, height * 0.63
  );
}

void slackwareL() {
  image(slackwarelogo, width * 0.03, height * 0.25, width * 0.35, height * 0.45);
}

// ----------------------------------------------------------
//  Tela 4: Criação do Ubuntu
// ----------------------------------------------------------
void textoCrUbuntu() {
  noStroke();
  fill(#FFFFFF);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Criação do Ubuntu", width / 2, height * 0.11);
}

void logoUbuntu() {
  image(ImglogoUbuntu, width * 0.08, height * 0.25, width * 0.26, height * 0.45);
}

void textoUbuntu() {
  fill(#2C001E);
  textFont(ubuntu);
  text(
    " O Ubuntu foi criado em 2004 pela empresa Canonical, liderada por Mark Shuttleworth. " +
    "O objetivo do projeto era tornar o Linux mais simples, acessível e fácil de usar para pessoas comuns, " +
    "oferecendo uma interface amigável e atualizações frequentes. " +
    "Baseado no Debian, o Ubuntu rapidamente se tornou uma das distribuições Linux mais populares do mundo " +
    "por combinar estabilidade, facilidade de instalação e software livre.",
    width * 0.4, height * 0.25, width * 0.5, height * 0.63
  );
}

// ----------------------------------------------------------
//  Tela 5: Consolidação mundial do Linux
// ----------------------------------------------------------
void textoConsoLinux() {
  fill(#FFFFFF);
  textAlign(CENTER);
  textFont(ubuntuBold);
  text("Consolidação mundial do Linux", width / 2, height * 0.11);
}

void ubuntuNav() {
  image(servidor, width * 0.08, height * 0.25, width * 0.3, height * 0.5);
}

void textoLinux() {
  fill(#2C001E);
  textFont(ubuntu);
  text(
    " Por volta de 2010, o Linux se popularizou entre usuários comuns graças a distribuições mais acessíveis, " +
    "como o Ubuntu, tornando o sistema mais fácil de instalar e usar. Ele passou a ser adotado por ser gratuito, " +
    "leve, seguro e altamente personalizável, já sendo forte em servidores e expandindo seu uso também para " +
    "computadores pessoais, onde continua sendo utilizado até hoje em servidores, sistemas embarcados e por " +
    "usuários que buscam mais controle do sistema.",
    width * 0.4, height * 0.25, width * 0.5, height * 0.63
  );
}

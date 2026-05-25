// ============================================================
//  MÓDULO: kernel.pde
//  Responsabilidade: aba "Kernel" (paginacao == 3).
//
//  Funções públicas:
//    configKernel() — chame em setup()
//    kernel()       — chame em drawConteudo() para paginacao == 3
//
//  ⚠  Usa as variáveis globais 'bold' e 'regular' (PFont)
//     declaradas no arquivo principal.
//  ⚠  Usa a função botoes() declarada em gerenciamento_instalacao.pde
//     (a versão com sombra laranja e fundo bege).
// ============================================================

// ------ Recursos privados deste módulo ------
PImage fluxokernel;
PImage funcoesKernel;

// ----------------------------------------------------------
//  configKernel() — carrega imagens; chamar no setup()
// ----------------------------------------------------------
void configKernel() {
  fluxokernel   = loadImage("images/fluxoKernel.png");
  funcoesKernel = loadImage("images/funcoesKernel.png");
}

// ----------------------------------------------------------
//  kernel() — renderiza a aba; chamar em drawConteudo()
// ----------------------------------------------------------
void kernel() {
  background(#333333);
  textAlign(CENTER, CENTER);

  // Bloco: Título
  botoes(width / 18.21, height / 10.9, width / 1.11, height / 7.68, height / 38.4);
  fill(#2C001E);
  textFont(bold);
  text(
    "Linux Kernel",
    (width / 18.21) + ((width / 1.11) / 2),
    (height / 10.9) + ((height / 7.68) / 2)
  );

  // Bloco: Explicação
  botoes(width / 18.21, height / 4.0, width / 1.11, height / 5.5, height / 38.4);
  fill(#2C001E);
  textFont(regular);
  textSize(height / 35);
  text(
    "O Kernel é a parte principal do sistema operacional Linux. \n" +
    "Ele funciona como uma ponte entre o hardware do computador e os programas utilizados pelo usuário.\n" +
    "No Ubuntu, o kernel é responsável por controlar componentes como processador,\n" +
    " memória, teclado, mouse, disco e dispositivos conectados ao computador.",
    (width / 18.21) + ((width / 1.11) / 2),
    (height / 4.0) + ((height / 5.5) / 2)
  );

  // Bloco: Fluxo do Kernel (imagem)
  botoes(width / 18.21, height / 2.2, width / 3.5, height / 2, height / 38.4);
  image(fluxokernel, width / 18.21, height / 2.2, width / 3.5, height / 2);

  // Bloco: Funções do Kernel (imagem)
  botoes(width / 2.75, height / 2.2, width / 1.7, height / 2, height / 38.4);
  image(funcoesKernel, width / 2.75, height / 2.05, width / 1.7, height / 2.3);
}

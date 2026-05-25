//  Tela atual do aplicativo
//    0 → Terminal (login)
//    1 → Próxima tela (a ser implementada)
int telaAtual = 0;

public void settings() {
  fullScreen();
}

void setup() {
  background(0);
  configterminal();
}

void draw() {
  background(0);

  // Quando o login for concluído (estado >= 3), avança para a próxima tela
  if (estado >= 3) {
    telaAtual = 1;
  }

  switch (telaAtual) {
    case 0:
      showterminal();
      break;

    case 1:
      // ► Chame aqui a função da sua próxima tela, ex: showDesktop();
      // Por enquanto exibe uma tela em branco como placeholder
      background(0);
      fill(255);
      textAlign(CENTER, CENTER);
      text("Login efetuado como: " + usuario, width / 2.0, height / 2.0);
      textAlign(LEFT, BASELINE); // restaura alinhamento padrão
      break;
  }

  // Remova a linha abaixo após o desenvolvimento (imprime coords no console)
  // println("X: " + (float)mouseX/width + " Y: " + (float)mouseY/height);
}

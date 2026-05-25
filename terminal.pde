// ============================================================
//  MÓDULO: terminal.pde
//  Responsabilidade: tela de login estilo terminal Ubuntu.
//
//  Variáveis exportadas para outros módulos:
//    int    estado   — estado do login (0=user, 1=senha, 2=logado, 3=avançar)
//    String usuario  — nome digitado pelo usuário
//
//  Funções públicas:
//    configterminal() — chame uma vez em setup()
//    showterminal()   — chame em draw() quando telaAtual == 0
//  ⚠  keyPressed()   — captura global; só age quando telaAtual == 0
// ============================================================

// ------ Variáveis de estado do terminal ------
// 'usuario' e 'estado' são lidos por menuInicial.pde e pelo arquivo principal
int    estado  = 0;   // 0=digitando user | 1=digitando senha | 2=logado | 3=avançar
String usuario = "";
String senha   = "";
String buffer  = "";

// ------ Recursos do terminal (privados a este módulo) ------
PImage terminalBG;    // renomeado para evitar conflito com a var 'terminal' em outros escopos
PFont  ubuntumono;

// ------ Paleta de cores ------
final color COR_USER_HOST = color(78, 154,   6);
final color COR_BRANCO    = color(255, 255, 255);
final color COR_CINZA     = color(170, 170, 170);

// ----------------------------------------------------------
//  configterminal() — carrega recursos; chamar no setup()
// ----------------------------------------------------------
void configterminal() {
  terminalBG = loadImage("images/terminal.png");
  ubuntumono = createFont("fonts/UbuntuMono-R.ttf", 32);
}

// ----------------------------------------------------------
//  showterminal() — renderiza a tela; chamar no draw()
// ----------------------------------------------------------
void showterminal() {
  image(terminalBG, 0, 0, width, height);
  textFont(ubuntumono);
  textSize(32);

  // Cursor piscante: alterna a cada 30 frames (~0,5 s a 60 fps)
  String cursor = ((frameCount / 30) % 2 == 0) ? "_" : " ";

  if (estado == 0) {
    // ── Digitando usuário
    fill(COR_BRANCO);
    text("login: " + buffer + cursor, width * 0.254, height * 0.178);

  } else if (estado == 1) {
    // ── Digitando senha
    fill(COR_BRANCO);
    text("login: " + usuario, width * 0.254, height * 0.178);
    text("Password: " + cursor, width * 0.040, height * 0.216);

  } else if (estado >= 2) {
    // ── Logado: exibe tela completa de boas-vindas
    fill(COR_BRANCO);
    text("login: " + usuario, width * 0.254, height * 0.178);
    text("Password: ",         width * 0.040, height * 0.216);
    text("Welcome to Ubuntu 22.04.4 LTS", width * 0.039, height * 0.248);

    fill(COR_CINZA);
    text(" * Documentation:  https://help.ubuntu.com", width * 0.0382, height * 0.28);
    text("Last login: " + day() + "/" + month() + " on tty1", width * 0.0382, height * 0.3125);

    float promptX = width * 0.040;
    float promptY = height * 0.344;

    fill(COR_USER_HOST);
    text(usuario + "@computer", promptX, promptY);

    fill(COR_BRANCO);
    float offsetX = textWidth(usuario + "@computer");
    text(":~$ " + cursor, promptX + offsetX, promptY);
  }
}

// ----------------------------------------------------------
//  keyPressed() — captura global de teclado
//  Age somente quando telaAtual == 0 (terminal ativo).
//  Não interfere com outros módulos.
// ----------------------------------------------------------
void keyPressed() {

  // Ignora completamente quando o terminal não está na tela
  if (telaAtual != 0) return;

  if (estado == 0) {
    // Estado 0: capturando nome de usuário
    if (key == ENTER || key == RETURN) {
      if (buffer.length() > 0) {
        usuario = buffer.trim();
        buffer  = "";
        estado  = 1;
      }
    } else if (key == BACKSPACE) {
      if (buffer.length() > 0)
        buffer = buffer.substring(0, buffer.length() - 1);
    } else if (key != CODED) {
      buffer += key;
    }

  } else if (estado == 1) {
    // Estado 1: capturando senha (invisível)
    if (key == ENTER || key == RETURN) {
      senha  = buffer;
      buffer = "";
      estado = 2;
    } else if (key == BACKSPACE) {
      if (buffer.length() > 0)
        buffer = buffer.substring(0, buffer.length() - 1);
    } else if (key != CODED) {
      buffer += key;
    }

  } else if (estado == 2) {
    // Estado 2: aguarda ENTER para avançar para o app
    if (key == ENTER || key == RETURN) {
      estado = 3;
      // ► O arquivo principal detecta estado >= 3 no draw()
      //   e seta telaAtual = 1 automaticamente.
    }
  }
}

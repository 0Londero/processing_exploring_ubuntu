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


void configterminal() {
  terminalBG = loadImage("images/terminal.png");
  ubuntumono = createFont("fonts/UbuntuMono-R.ttf", 32);
}

void showterminal() {
  image(terminalBG, 0, 0, width, height);
  textFont(ubuntumono);
  textSize(32);

  String cursor = ((frameCount / 30) % 2 == 0) ? "_" : " ";

  if (estado == 0) {
    fill(COR_BRANCO);
    text("login: " + buffer + cursor, width * 0.254, height * 0.178);

  } else if (estado == 1) {
    fill(COR_BRANCO);
    text("login: " + usuario, width * 0.254, height * 0.178);
    text("Password: " + cursor, width * 0.040, height * 0.216);

  } else if (estado >= 2) {
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

void keyPressed() {

  if (telaAtual != 0) return;

  if (estado == 0) {
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
    if (key == ENTER || key == RETURN) {
      estado = 3;
    }
  }
}

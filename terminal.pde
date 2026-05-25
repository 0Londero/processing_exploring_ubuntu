//  Variáveis Globais
PImage terminal;
PFont  ubuntumono;

// Estados do terminal:
//   0 → digitando usuário
//   1 → digitando senha
//   2 → login concluído (mostra tela completa antes de avançar)
int    estado  = 0;
String usuario = "";
String senha   = "";
String buffer  = "";

// Cores 
final color COR_USER_HOST = color(78, 154, 6);
final color COR_BRANCO    = color(255, 255, 255);
final color COR_CINZA     = color(170, 170, 170);

//  Carrega recursos uma única vez (sem lag)
void configterminal() {
  terminal   = loadImage("images/terminal.png");
  ubuntumono = createFont("fonts/UbuntuMono-R.ttf", 32);
}

//  Renderização principal do terminal
void showterminal() {
  image(terminal, 0, 0, width, height);
  textFont(ubuntumono);
  textSize(32);           // garante tamanho consistente antes de medir larguras

  // Cursor piscante: troca a cada 30 frames (~0,5 s a 60 fps)
  String cursor = ((frameCount / 30) % 2 == 0) ? "_" : " ";

  // ESTADO 0: digitando usuário
  if (estado == 0) {
    fill(COR_BRANCO);
    text("login: " + buffer + cursor, width * 0.2540, height * 0.178);

  // ESTADO 1: digitando senha
  } else if (estado == 1) {
    fill(COR_BRANCO);
    text("login: " + usuario, width * 0.2540, height * 0.178);

    // "Password:" sem exibir nenhum caractere digitado
    fill(COR_BRANCO);
    text("Password: " + cursor, width * 0.040, height * 0.216);

  // ESTADO 2: logado 
  } else if (estado >= 2) {
    // Linha de login já preenchida
    fill(COR_BRANCO);
    text("login: " + usuario, width * 0.2540, height * 0.178);

    // Linha de senha — mostra só o prompt, sem revelar o que foi digitado
    fill(COR_BRANCO);
    text("Password: ", width * 0.040, height * 0.216);

    // Mensagem de boas-vindas
    fill(COR_BRANCO);
    text("Welcome to Ubuntu 22.04.4 LTS", width * 0.039, height * 0.248);

    fill(COR_CINZA);
    text(" * Documentation:  https://help.ubuntu.com", width * 0.0382, height * 0.28);

    fill(COR_CINZA);
    text("Last login: " + day() + "/" + month() + " on tty1", width * 0.0382, height * 0.3125);

    float promptX = width * 0.040;
    float promptY = height * 0.344;

    fill(COR_USER_HOST);
    text(usuario + "@computer", promptX, promptY);

    fill(COR_BRANCO);
    // Avança X pela largura exata do texto já desenhado
    float offsetX = textWidth(usuario + "@computer");
    text(":~$ " + cursor, promptX + offsetX, promptY);
  }
}

//  Captura de teclado
void keyPressed() {

  // Estado 0: captura do usuário
  if (estado == 0) {
    if (key == ENTER || key == RETURN) {
      if (buffer.length() > 0) {        // impede usuário vazio
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

  // ── Estado 1: captura da senha (invisível)
  } else if (estado == 1) {
    if (key == ENTER || key == RETURN) {
      senha  = buffer;   // armazena, mas nunca exibe
      buffer = "";
      estado = 2;        // login concluído
    } else if (key == BACKSPACE) {
      if (buffer.length() > 0)
        buffer = buffer.substring(0, buffer.length() - 1);
    } else if (key != CODED) {
      buffer += key;     // acumula mas permanece oculto na tela
    }

  // ── Estado 2: aguarda ENTER para avançar de tela
  } else if (estado == 2) {
    if (key == ENTER || key == RETURN) {
      // ► Aqui você troca para a próxima tela do aplicativo.
      // Exemplo: telaAtual = 1;  (variável definida no arquivo principal)
      // Por enquanto, avança o estado para sinalizar que deve mudar de tela.
      estado = 3;
    }
  }
}

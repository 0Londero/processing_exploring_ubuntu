// Variáveis Globais
PImage terminal;
PFont ubuntumono;

// Carregando a imagem e fonte para o terminal, somente uma vez, evitando assimm um lag do programa.  
void configterminal() {
  terminal = loadImage("images/terminal.png"); 
  ubuntumono = createFont("fonts/UbuntuMono-R.ttf", 32);
}

// Lógica de estados, pois usando o While, o programa irá entrar em loop infinito
int estado = 0;
String usuario = "";
String senha = "";
String buffer = "";


// Função para exibir o terminal, utilizando a imagem e fonte carregada anteriormente.
void showterminal() {

  image(terminal, 0, 0, width, height);
  textFont(ubuntumono);
  fill(255);
  
  if (estado == 0) {
  text("login: ", width * 0.2540 , height * 0.178);

  }

  // text("login:", width * 0.2540 , height * 0.178);
  // text("user@computer:~$ password: ", width * 0.040 , height * 0.216);
  // text("Welcome to Ubuntu 22.04.4 LTS", width * 0.039, height * 0.248);
  // text(" * Documentation:  https://help.ubuntu.com", width * 0.0382, height * 0.28);
  // text("Last login: " + day() + "/" + month() + " on tty1", width * 0.0382, height * 0.3125);
  // text("user@computer:~$ _", width * 0.040, height * 0.344);
}


// O Processing chama esta função automaticamente quando uma tecla é pressionada
void keyPressed() {
  if (key == ENTER || key == RETURN) {
    if (estado == 0) {
      usuario = buffer; // Salva o nome na variável para uso posterior
      buffer = "";      // Limpa para a próxima entrada
      estado = 1;
    } else if (estado == 1) {
      senha = buffer;   // Salva a senha
      buffer = "";
      estado = 2;
    }
  } else if (key == BACKSPACE) {
    if (buffer.length() > 0) {
      buffer = buffer.substring(0, buffer.length() - 1);
    }
  } else if (key != CODED) {
    buffer += key;
  }
}
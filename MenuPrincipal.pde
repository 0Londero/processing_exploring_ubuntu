PImage terminal;
PFont ubuntumono;

void configurarMenu() {
  terminal = loadImage("images/terminal.png"); 
  ubuntumono = createFont("fonts/UbuntuMono-R.ttf", 32);
}

void exibirMenu() {
  float escalaTexto = height * 0.04;
  if (terminal != null) {
    image(terminal, 0, 0, width, height);
  }
  


  textFont(ubuntumono);
  fill(255);
  
  textSize(escalaTexto);
  text("Welcome to Ubuntu 26.04 LTS:", width * 0.2540 , height * 0.178);

}
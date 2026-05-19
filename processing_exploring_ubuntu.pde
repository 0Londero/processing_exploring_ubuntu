// import processing.awt.PSurfaceAWT;
// import processing.awt.PSurfaceAWT.SmoothCanvas;

public void settings() {
  // size(displayWidth/ 2, displayHeight/ 2);
  fullScreen();
}

void setup() {
  background(0);
  configterminal(); 
}

// UTILIZANDO FULLSCREEN, NÃO É NECESSÁRIO REMOVER AS BORDAS DA JANELA, POIS O PROGRAMA OCUPA TODA A TELA.

// PSurface initSurface() {
//   PSurface pSurface = super.initSurface();
//   ((SmoothCanvas) ((PSurfaceAWT)surface).getNative()).getFrame().setUndecorated(true);
//   return pSurface;
// }

void draw() {
  background(0); 
  showterminal();
  // Código para exibir as coordenadas do mouse no console, auxiliando no desenvolvimento.
  println("X: " + (float)mouseX/width + " Y: " + (float)mouseY/height);
}

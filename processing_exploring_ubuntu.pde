import processing.awt.PSurfaceAWT;
import processing.awt.PSurfaceAWT.SmoothCanvas;

public void settings() {
  size(displayWidth / 2, displayHeight / 2);
}

void setup() {
  background(0);
  configurarMenu(); 
}

PSurface initSurface() {
  PSurface pSurface = super.initSurface();
  ((SmoothCanvas) ((PSurfaceAWT)surface).getNative()).getFrame().setUndecorated(true);
  return pSurface;
}

void draw() {
  background(0); 
  exibirMenu();
  println("X: " + (float)mouseX/width + " Y: " + (float)mouseY/height);
}

int paginacao = 0;
int next = 0;
PImage icone;
PFont ubuntuFonte;

void setup(){
    fullScreen();
    background(#111111);
    noStroke();
    fill(#222222);
    rect(width / 22.8, width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    rect(width / 22.8 + (width/7.8 * 1), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    rect(width / 22.8 + (width/7.8 * 2), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    rect(width / 22.8 + (width/7.8 * 3), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    rect(width / 22.8 + (width/7.8 * 4), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    rect(width / 22.8 + (width/7.8 * 5), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    icone = loadImage("ubuntu_icon.png");
    ubuntuFonte = createFont("Ubuntu-Regular.ttf", 20);
}

void draw(){
    image(icone, width / 91.06, width / 273.2, width / 42.7, width / 42.7);
    eraseButton();
    paintSelectedButton();

    if(mouseX >= width / 22.8 && mouseX <= width / 22.8 + (width/8 * 1) && mouseY >= width / 273.2 && mouseY <= width / 42.7 && paginacao != 1){
        fill(#451909);
        rect(width / 22.8, width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        textos();
    }
    else if(mouseX >= width / 22.8 + (width/7.8 * 1) && mouseX <= width / 22.8 + (width/7.8 * 1) + width/8 && mouseY >= width / 273.2 && mouseY <= width / 42.7 && paginacao != 2){
        fill(#451909);
        rect(width / 22.8 + (width/7.8 * 1), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        textos();
    }
    else if(mouseX >= width / 22.8 + (width/7.8 * 2) && mouseX <= width / 22.8 + (width/7.8 * 2) + width/8 && mouseY >= width / 273.2 && mouseY <= width / 42.7 && paginacao != 3){
        fill(#451909);
        rect(width / 22.8 + (width/7.8 * 2), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        textos();
    }
    else if(mouseX >= width / 22.8 + (width/7.8 * 3) && mouseX <= width / 22.8 + (width/7.8 * 3) + width/8 && mouseY >= width / 273.2 && mouseY <= width / 42.7 && paginacao != 4){
        fill(#451909);
        rect(width / 22.8 + (width/7.8 * 3), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        textos();
    }
    else if(mouseX >= width / 22.8 + (width/7.8 * 4) && mouseX <= width / 22.8 + (width/7.8 * 4) + width/8 && mouseY >= width / 273.2 && mouseY <= width / 42.7 && paginacao != 5){
        fill(#451909);
        rect(width / 22.8 + (width/7.8 * 4), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        textos();
    }
    else if(mouseX >= width / 22.8 + (width/7.8 * 5) && mouseX <= width / 22.8 + (width/7.8 * 5) + width/8 && mouseY >= width / 273.2 && mouseY <= width / 42.7 && paginacao != 6){
        fill(#451909);
        rect(width / 22.8 + (width/7.8 * 5), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        textos();
    }
    else if(mouseX >= width/1.2 && mouseX <= width/1.2 + height/10 && mouseY >= height/1.2 && mouseY <= height/1.2 + height/20 && next != 1){
        fill(#9E2D15);
        rect(width/1.2, height/1.2, height/10, height/20, 5);
        fill(#ffffff);
        text("PRÓXIMO", width/1.193, height/1.154);
        textos();
    }
    else{
        if(paginacao == 1){
            background(#111111);
            image(icone, width / 91.06, width / 273.2, width / 42.7, width / 42.7);
            fill(#e95420);
            rect(width / 22.8, width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            fill(#222222);
            rect(width / 22.8 + (width/7.8 * 1), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 2), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 3), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 4), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 5), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        }
        else if(paginacao == 2){
            background(#111111);
            image(icone, width / 91.06, width / 273.2, width / 42.7, width / 42.7);
            fill(#222222);
            rect(width / 22.8, width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            fill(#e95420);
            rect(width / 22.8 + (width/7.8 * 1), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            fill(#222222);
            rect(width / 22.8 + (width/7.8 * 2), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 3), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 4), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 5), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        }
        else if(paginacao == 3){
            background(#111111);
            image(icone, width / 91.06, width / 273.2, width / 42.7, width / 42.7);
            fill(#222222);
            rect(width / 22.8, width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 1), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            fill(#e95420);
            rect(width / 22.8 + (width/7.8 * 2), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            fill(#222222);
            rect(width / 22.8 + (width/7.8 * 3), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 4), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 5), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        }
        else if(paginacao == 4){
            background(#111111);
            image(icone, width / 91.06, width / 273.2, width / 42.7, width / 42.7);
            comandos();
            fill(#222222);
            rect(width / 22.8, width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 1), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 2), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            fill(#e95420);
            rect(width / 22.8 + (width/7.8 * 3), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            fill(#222222);
            rect(width / 22.8 + (width/7.8 * 4), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 5), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            if(next == 1){
                comandosMaisComuns();
            }
        }
        else if(paginacao == 5){
            background(#111111);
            image(icone, width / 91.06, width / 273.2, width / 42.7, width / 42.7);
            fill(#222222);
            rect(width / 22.8, width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 1), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 2), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 3), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            fill(#e95420);
            rect(width / 22.8 + (width/7.8 * 4), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            fill(#222222);
            rect(width / 22.8 + (width/7.8 * 5), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        }
        else if(paginacao == 6){
            background(#111111);
            image(icone, width / 91.06, width / 273.2, width / 42.7, width / 42.7);
            fill(#222222);
            rect(width / 22.8, width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 1), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 2), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 3), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            rect(width / 22.8 + (width/7.8 * 4), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
            fill(#e95420);
            rect(width / 22.8 + (width/7.8 * 5), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
        }
            textos();
    }
}

void mousePressed(){
    if(mouseX >= width / 22.8 && mouseX <= width / 22.8 + (width/8 * 1) && mouseY >= width / 273.2 && mouseY <= width / 42.7){
        paginacao = 1;
    }
    else if(mouseX >= width / 22.8 + (width/7.8 * 1) && mouseX <= width / 22.8 + (width/7.8 * 1) + width/8 && mouseY >= width / 273.2 && mouseY <= width / 42.7){
        paginacao = 2;
    }
    else if(mouseX >= width / 22.8 + (width/7.8 * 2) && mouseX <= width / 22.8 + (width/7.8 * 2) + width/8  && mouseY >= width / 273.2 && mouseY <= width / 42.7){
        paginacao = 3;
    }
    else if(mouseX >= width / 22.8 + (width/7.8 * 3) && mouseX <= width / 22.8 + (width/7.8 * 3) + width/8 && mouseY >= width / 273.2 && mouseY <= width / 42.7){
        paginacao = 4;
    }
    else if(mouseX >= width / 22.8 + (width/7.8 * 4) && mouseX <= width / 22.8 + (width/7.8 * 4) + width/8 && mouseY >= width / 273.2 && mouseY <= width / 42.7){
        paginacao = 5;
    }
    else if(mouseX >= width / 22.8 + (width/7.8 * 5) && mouseX <= width / 22.8 + (width/7.8 * 5) + width/8 && mouseY >= width / 273.2 && mouseY <= width / 42.7){
        paginacao = 6;
    }
    if(mouseX >= width/1.2 && mouseX <= width/1.2 + height/10 && mouseY >= height/1.2 && mouseY <= height/1.2 + height/20){
        next = 1;
    }
}

void eraseButton(){
    fill(#222222);
    rect(width / 22.8, width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    rect(width / 22.8 + (width/7.8 * 1), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    rect(width / 22.8 + (width/7.8 * 2), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    rect(width / 22.8 + (width/7.8 * 3), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    rect(width / 22.8 + (width/7.8 * 4), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    rect(width / 22.8 + (width/7.8 * 5), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
}

void paintSelectedButton(){
    if(paginacao == 1){
        fill(#e95420);
        rect(width / 22.8, width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    }
    else if(paginacao == 2){
        fill(#e95420);
        rect(width / 22.8 + (width/7.8 * 1), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    }
    else if(paginacao == 3){
        fill(#e95420);
        rect(width / 22.8 + (width/7.8 * 2), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    }
    else if(paginacao == 4){
        fill(#e95420);
        rect(width / 22.8 + (width/7.8 * 3), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    }
    else if(paginacao == 5){
        fill(#e95420);
        rect(width / 22.8 + (width/7.8 * 4), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    }
    else if(paginacao == 6){
        fill(#e95420);
        rect(width / 22.8 + (width/7.8 * 5), width / 273.2, width/8, width / 42.7, 10, 10, 0, 0);
    }
}

void textos(){
    fill(255,255,255);
    textFont(ubuntuFonte);
    textAlign(LEFT);
    text("Menu principal", width / 20, width / 51);
    text("História", width/20 + (width/7.8 * 1), width / 51);
    text("Kernel", width/20 + (width/7.8 * 2), width / 51);
    text("Comandos básicos", width/20 + (width/7.8 * 3), width / 51);
    text("Interface e ambiente", width/20 + (width/7.8 * 4), width / 51);
    text("Pacotes e instalações", width/20 + (width/7.8 * 5), width / 51);
}
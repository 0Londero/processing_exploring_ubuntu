int tela_atual = 0;
boolean mostrar_video = false;

void gerenciamento_instalacao(){
    if (tela_atual == 0){
        menu();
    }
    else if (tela_atual == 1){
        pacotes();
    }
    else if (tela_atual == 2){
        instalacao();
    }
    else if (tela_atual == 3){
        comandos();
    }
    else if (tela_atual == 4){
        vantagens();
    }
}

void menu(){
    background(#333333);
    textAlign(CENTER, CENTER);

    //Titulo
    botoes(width/18.21, height/10.9, width/1.11, height/7.68, height/38.4);
    //Texto Título
    fill(#2C001E);
    textFont(bold);
    text("Gerenciamento de Pacotes e Instalação de Programas",(width/18.21)+((width/1.11)/2),(height/10.9)+((height/7.68)/2));

    //Botao superior esquerdo
    botoes(width/18.21, height/3.37, width/2.27, height/5.12, height/38.4);
    //Texto botão superior esquerdo
    fill(#2C001E);
    textFont(regular);
    text("O que são pacotes e\n gerenciadores de pacotes",(width/18.21)+((width/2.27)/2),(height/3.37)+((height/5.12)/2));

    //Botao superior direito
    botoes(width/1.95, height/3.37, width/2.27, height/5.12, height/38.4);
    //Texto botão superior direito
    fill(#2C001E);
    textFont(regular);
    text("Como o Ubuntu\n instala os programas",(width/1.95)+((width/2.27)/2),(height/3.37)+((height/5.12)/2));

    //Botao inferior esquerdo
    botoes(width/18.21, height/1.6, width/2.27, height/5.12, height/38.4);
    //Texto botão inferior esquerdo
    fill(#2C001E);
    textFont(regular);
    text("Comandos Principais",(width/18.21)+((width/2.27)/2),(height/1.6)+((height/5.12)/2));

    //Botao inferior direito
    botoes(width/1.95, height/1.6, width/2.27, height/5.12, height/38.4);
    //Texto botão inferior direito
    fill(#2C001E);
    textFont(regular);
    text("Vantagens do\n sistema Ubuntu",(width/1.95)+((width/2.27)/2),(height/1.6)+((height/5.12)/2));
}

void pacotes(){
    background(#333333);
    textAlign(CENTER, CENTER);

    //Título
    botoes(width/18.21, height/12.8, width/1.11, height/7.68, height/38.4);
    fill(#2C001E);
    textFont(bold);
    text("O que são pacotes e gerenciadores de pacotes",(width/18.21)+((width/1.11)/2),(height/12.8)+((height/7.68)/2));

    //Explicação
    botoes(width/18.21, height/4.5, width/1.4, height/5.12, height/38.4);
    fill(#2C001E);
    textFont(regular);
    textSize(height/35);
    text("Pacotes são arquivos que armazenam programas e todos os \ncomponentes necessários para seu funcionamento, como bibliotecas e dependências.\nNo Ubuntu, o gerenciamento desses pacotes é feito pelo APT,\n sistema responsável por instalar, atualizar e remover programas de forma automática e segura.",(width/18.21)+((width/1.4)/2),(height/4.5)+((height/5.12)/2));
    image(pacote_ubuntu, width/1.24, height/4.5, width/9  , height/5.12);

    //Desenho do pacote
    image(pacote_desenho, width/18.21, height/2.25, width/5, height/2.56);

    //Explicação de cada termo no pacote
    botoes(width/3.54, height/2.25, width/2.57, height/1.89, height/38.4);
    fill(#2C001E);
    textFont(regular);
    textSize(height/35);
    text("Programa:\nAplicação principal que o usuário deseja \ninstalar e utilizar.\nBiblioteca:\nConjunto de funções e recursos usados\n por programas para executar tarefas específicas.\nDependências:\nArquivos e componentes necessários para\n que o programa funcione corretamente.\nArquivos:\nDocumentos internos do software responsáveis\n pelo funcionamento da aplicação.\nConfigurações:\nInformações que definem preferências\n e comportamento do programa no sistema.",(width/3.54)+(width/2.57/2), (height/2.25)+(height/1.89/2));

    //Fluxograma
    botoes(width/1.47, height/2.25, width/3.53, height/1.89, height/38.4);
    image(fluxograma, width/1.526, height/2.25, width/2.98, height/2);

    //Botão de voltar
    botao_voltar();
}

void instalacao(){
    background(#333333);
    textAlign(CENTER, CENTER);

    //Título
    botoes(width/18.21, height/12.8, width/1.11, height/7.68, height/38.4);
    fill(#2C001E);
    textFont(bold);
    text("Como o Ubuntu instala os programas",(width/18.21)+((width/1.11)/2),(height/12.8)+((height/7.68)/2));

    //Explicação
    botoes(width/18.21, height/4.5, width/1.11, height/5.5, height/38.4);
    fill(#2C001E);
    textFont(regular);
    textSize(height/35);
    text("Quando o usuário solicita a instalação de um programa, o Ubuntu verifica \nos arquivos necessários, realiza o download e configura automaticamente o software no sistema.\n Esse processo reduz erros de instalação e facilita o uso do computador.",(width/18.21)+((width/1.11)/2),(height/4.5)+((height/5.5)/2));

    //Fluxo Instalação
    botoes(width/18.21, height/2.4, width/1.8, height/2.5, height/38.4);
    image(instalacaoimg, width/19, height/2.8, width/1.8, height/1.8);

    //Video terminal
    botoes(width/1.62, height/2.4, width/2.97, height/2.5, height/38.4);
    image(firefox, width/1.52, height/2.3, width/4, height/2.5);

    if (mostrar_video){
        image(terminal, width/4, height/4, width/2, height/2);
    }

    if (mostrar_video && terminal.time() >= terminal.duration()-0.1){
        mostrar_video = false;
        terminal.stop();
    }

    botao_voltar();
}

void comandos(){
    background(#333333);
    textAlign(CENTER, CENTER);

    //Título
    botoes(width/18.21, height/12.8, width/1.11, height/7.68, height/38.4);
    fill(#2C001E);
    textFont(bold);
    text("Comandos Principais",(width/18.21)+((width/1.11)/2),(height/12.8)+((height/7.68)/2));

    //Explicação
    botoes(width/18.21, height/4.5, width/1.11, height/5.5, height/38.4);
    fill(#2C001E);
    textFont(regular);
    textSize(height/35);
    text("O terminal permite controlar o sistema através de comandos de texto.\nCom poucos comandos, é possível instalar programas, atualizar o sistema e remover softwares rapidamente.",(width/18.21)+((width/1.11)/2),(height/4.5)+((height/5.5)/2));

    //Imagem comandos
    image(imgterminal, width/18.21, height/2.4, width/2.3, height/2.3);

    //Explicação dos comandos
    botoes(width/2, height/2.4, width/2.2, height/2.3, height/38.4);
    fill(#2C001E);
    textFont(regular);
    textSize(height/35);
    text("Update: Atualiza a lista de programas disponíveis nos \nrepositórios do Ubuntu.\nUpgrade: Instala versões mais recentes \ndos programas já presentes no sistema.\nInstall: Instala um programa automaticamente junto\n com suas dependências.\nRemove: Remove um programa instalado\n do sistema.\nApt search: Pesquisa programas disponíveis nos\n repositórios do Ubuntu.", (width/2)+((width/2.2)/2), (height/2.4)+((height/2.3)/2));

    botao_voltar();
}

void vantagens(){
    background(#333333);
    textAlign(CENTER, CENTER);

    //Título
    botoes(width/18.21, height/12.8, width/1.11, height/7.68, height/38.4);
    fill(#2C001E);
    textFont(bold);
    text("Vantagens do sistema Ubuntu",(width/18.21)+((width/1.11)/2),(height/12.8)+((height/7.68)/2));

    //Explicação
    botoes(width/18.21, height/4.5, width/1.11, height/5.5, height/38.4);
    fill(#2C001E);
    textFont(regular);
    textSize(height/35);
    text("O Ubuntu oferece um sistema organizado e eficiente para gerenciamento de softwares.\nIsso melhora a estabilidade do sistema, facilita atualizações\n e torna o uso mais prático para o usuário.",(width/18.21)+((width/1.11)/2),(height/4.5)+((height/5.5)/2));

    //Cards
    botoes(width/18.21, height/2.4, width/4.52, height/2.3, height/38.4);
    image(vantagem1, width/18.21, height/2.4, width/4.52, height/2.3);

    botoes(width/3.52, height/2.4, width/4.52, height/2.3, height/38.4);
    image(vantagem2, width/3.52, height/2.4, width/4.52, height/2.3);

    botoes(width/1.95, height/2.4, width/4.52, height/2.3, height/38.4);
    image(vantagem3, width/1.95, height/2.4, width/4.52, height/2.3);

    botoes(width/1.35, height/2.4, width/4.62, height/2.3, height/38.4);
    image(vantagem4, width/1.35, height/2.4, width/4.62, height/2.3);
    
    botao_voltar();
}

void mousePressed(){
    if (tela_atual == 0){
        if (mouseX >= width/18.21 && mouseX <= width/2.02 && mouseY >= height/3.37 && mouseY <= height/2.03){
            tela_atual = 1;
        }
        if (mouseX >= width/1.95 && mouseX <= width/1.04 && mouseY >= height/3.37 && mouseY <= height/2.03){
            tela_atual = 2;
        }
        if (mouseX >= width/18.21 && mouseX <= width/2.02 && mouseY >= height/1.6 && mouseY <= height/1.22){
            tela_atual = 3;
        }
        if (mouseX >= width/1.95 && mouseX <= width/1.04 && mouseY >= height/1.6 && mouseY <= height/1.22){
            tela_atual = 4;
        }
    }
    else if(tela_atual == 1){
        if (mouseX >= width/18.21 && mouseX <= (width/18.21)*2 && mouseY >= height/1.16 && mouseY <= (height/1.16)+(height/10.24)){
            tela_atual = 0;
        }
    }else if(tela_atual == 2){
        if (mouseX >= width/18.21 && mouseX <= (width/18.21)*2 && mouseY >= height/1.16 && mouseY <= (height/1.16)+(height/10.24)){
            tela_atual = 0;
        }
        if (mouseX >= width/1.6 && mouseX <= width/1.04 && mouseY >= height/2.4 && mouseY <= height/1.22){
            terminal.play();
            mostrar_video = true;
        }
    }else if(tela_atual == 3){
        if (mouseX >= width/18.21 && mouseX <= (width/18.21)*2 && mouseY >= height/1.16 && mouseY <= (height/1.16)+(height/10.24)){
            tela_atual = 0;
        }
    }else if (tela_atual == 4){
        if (mouseX >= width/18.21 && mouseX <= (width/18.21)*2 && mouseY >= height/1.16 && mouseY <= (height/1.16)+(height/10.24)){
            tela_atual = 0;
        }
    }
}

void movieEvent(Movie m){
    m.read();
}

void botoes(float x, float y, float w,float h,float r){
    float soma_fundo = height/153.6;
    noStroke();
    fill(#E95420);
    rect(x+soma_fundo,y+soma_fundo,w,h,r);
    fill(#AEA79F);
    rect(x,y,w,h,r);
}

void botao_voltar(){
    botoes(width/18.21, height/1.16, width/18.21, height/10.24, height/38.4);
    stroke(#2C001E);
    strokeWeight(10);
    line((width/18.21)+(width/91), (height/1.16)+(height/10.24/2), (width/18.21)+(width/39), (height/1.16)+(height/51.2));
    line((width/18.21)+(width/91), (height/1.16)+(height/10.24/2), (width/18.21)+(width/39), (height/1.16)+(height/12.8));
    line((width/18.21)+(width/91), (height/1.16)+(height/10.24/2), (width/18.21)+(width/22.75), (height/1.16)+(height/10.24/2));
}

//final da tela = width/1.04
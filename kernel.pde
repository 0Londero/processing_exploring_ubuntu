void kernel(){
    background(#333333);
    textAlign(CENTER, CENTER);

     //Titulo
    botoes(width/18.21, height/10.9, width/1.11, height/7.68, height/38.4);
    //Texto Título
    fill(#2C001E);
    textFont(bold);
    text("Linux Kernel",(width/18.21)+((width/1.11)/2),(height/10.9)+((height/7.68)/2));

    //Explicação
    botoes(width/18.21, height/4.0, width/1.11, height/5.5, height/38.4);
    fill(#2C001E);
    textFont(regular);
    textSize(height/35);
    text("O Kernel é a parte principal do sistema operacional Linux. \nEle funciona como uma ponte entre o hardware do computador e os programas utilizados pelo usuário.\nNo Ubuntu, o kernel é responsável por controlar componentes como processador,\n memória, teclado, mouse, disco e dispositivos conectados ao computador.",(width/18.21)+((width/1.11)/2),(height/4)+((height/5.5)/2));

    //Fluxo Kernel
    botoes(width/18.21, height/2.2, width/3.5, height/2, height/38.4);
    image(fluxokernel, width/18.21, height/2.2, width/3.5, height/2);

    //Funções Kernel
    botoes(width/2.75, height/2.2, width/1.7, height/2, height/38.4);
    image(funcoesKernel, width/2.75, height/2.05, width/1.7, height/2.3);  
}
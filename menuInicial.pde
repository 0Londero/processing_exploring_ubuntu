void showmenuinicial() {
  background(#333333);

  float marginX     = width * 0.03;
  float marginY     = height * 0.22;
  float cardWidth   = (width - (marginX * 4)) / 3;
  float cardHeight  = height * 0.65;
  float headerHeight = height * 0.08;

  float titleSize = height * 0.05;
  textFont(ubuntuFonte);
  textSize(titleSize);

  String msgBemVindo = "Bem vindo(a) ao Ubuntu ";
  String nomeUsuario = (usuario != null && usuario.length() > 0) ? usuario : "";

  float w1     = textWidth(msgBemVindo);
  float w2     = textWidth(nomeUsuario);
  float startX = (width - (w1 + w2)) / 2;
  float titleY = height * 0.08;

  textAlign(LEFT, TOP);
  fill(#AEA79F);
  text(msgBemVindo, startX, titleY);
  fill(#E95420);
  text(nomeUsuario, startX + w1, titleY);

  String titulo1 = "O que é Ubuntu?";
  String corpo1  = "É um dos sistemas operacionais mais populares do mundo, baseado em Linux. "
                 + "Desenvolvido para ser gratuito, seguro e extremamente fácil de usar, ele é "
                 + "uma alternativa completa aos sistemas tradicionais (como Windows e macOS).\n\n"
                 + "• Base: Debian (estabilidade pura).\n• Foco: Acessibilidade e liberdade.";

  String titulo2 = "Por que usar?";
  String corpo2  = "O Ubuntu une o poder e a segurança do ecossistema Linux com uma interface "
                 + "visual intuitiva para o dia a dia.\n\n"
                 + "• Gratuito e Leve: Sem custos com licenças e roda bem em hardware antigo.\n"
                 + "• Imunidade: Altamente seguro contra vírus e malwares comuns.\n"
                 + "• Dev Friendly: É a escolha favorita de programadores e cientistas de dados.";

  String titulo3 = "Filosofia Ubuntu";
  String corpo3  = "O nome vem de uma expressão sul-africana que significa "
                 + "\"Sou o que sou pelo que nós somos\". No mundo do software, isso se traduz "
                 + "em comunidade.\n\n"
                 + "• Espírito Coletivo: O sistema é moldado pela colaboração global.\n"
                 + "• Software Livre: Compartilhamento e evolução constante de código.";

  desenharCard(marginX,                  marginY, cardWidth, cardHeight, headerHeight, titulo1, corpo1);
  desenharCard(marginX * 2 + cardWidth,  marginY, cardWidth, cardHeight, headerHeight, titulo2, corpo2);
  desenharCard(marginX * 3 + cardWidth * 2, marginY, cardWidth, cardHeight, headerHeight, titulo3, corpo3);
}

void desenharCard(float x, float y, float w, float h, float headerH,
                  String titulo, String corpo) {
  noStroke();

  fill(#5E2750);
  rect(x, y, w, headerH, 15, 15, 0, 0);

  fill(#AEA79F);
  rect(x, y + headerH, w, h - headerH, 0, 0, 15, 15);

  fill(#FFFFFF);
  textAlign(CENTER, CENTER);
  textSize(w * 0.055);
  text(titulo, x + w / 2, y + headerH / 2 - (w * 0.01));

  fill(#2C001E);
  textAlign(LEFT, TOP);
  textSize(w * 0.045);

  float padding = w * 0.05;
  text(corpo, x + padding, y + headerH + padding,
       w - (padding * 2), h - headerH - (padding * 2));
}

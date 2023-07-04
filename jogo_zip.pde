Menina menina;
Car[] cars;
float grid = 50;
Tronco[] troncos;
PImage telaMenina, telaCarro, telaTronco, telaGrama, telaFundo, telaInicio, telaInfor, telaVitoria;
PImage telaCut1, telaCut2, telaCut3, telaCut4, telaCut5, telaCut6, telaCut7, telaCut8, telaCut9, telaCut10;
int score = 0;
PFont customFont;
boolean venceu = false;
boolean jogoIniciado = false;
boolean telaInfoExibida = false;
int telaAtual = 0;

void resetarMenina() {
  menina = new Menina(width / 2 - grid / 2, height - grid, grid);//cria um novo objeto menina na posição inicial.
  menina.attach(null);//desanexa qualquer objeto Tronco anteriormente anexado a menina.
}

void resetarJogo() {
  menina = new Menina(width/2-grid/2, height-grid, grid);//reinicia  a posição inicial.
  menina.attach(null);//desanexa qualquer objeto tronco anteriormente anexado a menina.
  score = 0;
}

void setup() {
  size(500, 500);
  telaMenina = loadImage("imagens/menina.png");
  telaCarro = loadImage("imagens/carro.png");
  telaTronco = loadImage("imagens/tronco.png");
  telaGrama = loadImage("imagens/grama.png");
  telaFundo = loadImage("imagens/fundo.png");
  telaInicio = loadImage("imagens/inicio.png");
  telaInfor = loadImage("imagens/info.png");
  telaVitoria = loadImage("imagens/vitoria.png");
  telaCut1 = loadImage("imagens/Cut1.png");
  telaCut2 = loadImage("imagens/Cut2.png");
  telaCut3 = loadImage("imagens/Cut3.png");
  telaCut4 = loadImage("imagens/Cut4.png");
  telaCut5 = loadImage("imagens/Cut5.png");
  telaCut6 = loadImage("imagens/Cut6.png");
  telaCut7 = loadImage("imagens/Cut7.png");
  telaCut8 = loadImage("imagens/Cut8.png");
  telaCut9 = loadImage("imagens/Cut9.png");
  telaCut10 = loadImage("imagens/Cut10.png");

//inicialização dos carros.
  cars = new Car[8];
  int index = 0;
  //carro 01.
  for (int i = 0; i < 2; i++) {
    float x = i * 300;
    cars[index] = new Car(x, height - grid * 2, grid, grid, 2);
    index++;
  }
  //carro 02.
  for (int i = 0; i < 2; i++) {
    float x = i * 200 + 150;
    cars[index] = new Car(x, height - grid * 3, grid, grid, 2.5);
    index++;
  }
  //carro 03.
  for (int i = 0; i < 4; i++) {
    float x = i * 150 + 25;
    cars[index] = new Car(x, height - grid * 4, grid, grid, 1.2);
    index++;
  }
  
//inicialização dos troncos.
  troncos = new Tronco[7];
  index = 0;
  //tronco 01.
  for (int i = 0; i < 2; i++) {
    float x = i * 250 + 100;
    troncos[index] = new Tronco(x, height - grid * 6, grid * 3, grid, 2.3);
    index++;
  }
  //tronco 02.
  for (int i = 0; i < 3; i++) {
    float x = i * 200 + 30;
    troncos[index] = new Tronco(x, height - grid * 7, grid * 3, grid, -1.3);
    index++;
  }
  //tronco 03.
  for (int i = 0; i < 2; i++) {
    float x = i * 400 + 10;
    troncos[index] = new Tronco(x, height - grid * 8, grid * 3, grid, 0.5);
    index++;
  }
}

void drawTelaVitoria() {
  image(telaVitoria, 0, 0);
  noLoop();//interrompe o loop do jogo.
}

void drawTelaInicio() {
  if (!telaInfoExibida) {
    if (telaAtual == 0) {
      image(telaCut1, 0, 0);
    } else if (telaAtual == 1) {
      image(telaCut2, 0, 0);
    } else if (telaAtual == 2) {
      image(telaCut3, 0, 0);
    } else if (telaAtual == 3) {
      image(telaCut4, 0, 0);
    } else if (telaAtual == 4) {
      image(telaCut5, 0, 0);
    } else if (telaAtual == 5) {
      image(telaCut6, 0, 0);
    } else if (telaAtual == 6) {
      image(telaCut7, 0, 0);
    } else if (telaAtual == 7) {
      image(telaCut8, 0, 0);
    } else if (telaAtual == 8) {
      image(telaCut9, 0, 0);
    } else if (telaAtual == 9) {
      image(telaCut10, 0, 0);
    }
  } else {
    image(telaInfor, 0, 0);
  }
}

void mousePressed() {
  if (!jogoIniciado) {
    if (!telaInfoExibida) {
      if (telaAtual < 10) {
        telaAtual++;
      } else {
        telaInfoExibida = true;
        telaAtual = 0;
      }
    } else {
      jogoIniciado = true;
      resetarJogo();
    }
  }
}


void draw() {
  if (!jogoIniciado) {
    drawTelaInicio();
    return;
  }

  image(telaFundo, 0, 0);
  
//exibe e atualiza os carros.
  for (Car car : cars) {
    car.show();
    car.update();
    if (menina.intersects(car)) {
      resetarJogo();//reinicia o jogo se a menina colidir com um carro.
    }
  }

//exibe e atualiza os troncos.
  for (Tronco tronco : troncos) {
    tronco.show();
    tronco.update();
  }

//verifica se a menina está em uma posição onde pode se mover sobre os troncos.
  if (menina.y < height - grid * 5 && menina.y > grid * 2) {
    boolean ok = false;
    for (Tronco tronco : troncos) {
      if (menina.intersects(tronco)) {
        ok = true;
        menina.attach(tronco);//anexa a menina ao tronco.
      }
    }
    if (!ok) {
      resetarJogo();//reinicia o jogo se a menina não estiver em um tronco.
    }
  } else {
    menina.attach(null);//desanexa a menina de qualquer tronco.
  }

//verifica se a menina atingiu a área de pontuação.
  if (menina.y < grid * 2) {
    score++;
    resetarMenina();//reinicia a menina na posição inicial.
  }

  menina.update();//att a posição da menina.
  menina.show();

  fill(0);
  text("Chaves: " + score, 30, 55);

// Verifica se o jogador venceu.
  if (score >= 20 && !venceu) {
    venceu = true;
    drawTelaVitoria();
    return;
  }
}

void keyPressed() {
  //movimentação da menina.
  if (keyCode == UP) {
    menina.move(0, -1);
    score++;
  } else if (keyCode == DOWN) {
    menina.move(0, 1);
  } else if (keyCode == RIGHT) {
    menina.move(1, 0);
  } else if (keyCode == LEFT) {
    menina.move(-1, 0);
  }

//verifica se a menina atingiu a área de pontuação.
  if (menina.y < grid * 2) {
    score++;
  }

//verifica se a menina atingiu a área de pontuação e reinicia na posição inicial.
  if (menina.y < grid * 2) {
    score++;
    resetarMenina();
  }
}

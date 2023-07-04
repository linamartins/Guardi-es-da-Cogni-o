class Car extends Rectangle {
  float speed;
  Car(float x, float y, float w, float h, float s) {    // Chama o construtor da classe pai (Rectangle) passando as coordenadas (x, y) e as dimensões (w, h)
    super(x, y, w, h);
    //define a velocidade do carro.
    speed = s;
  }

  //método para atualizar a posição do carro.
  void update() {
    //att a posição do carro com base na velocidade.
    x = x + speed;

    //verifica se o carro saiu da tela e faz ele voltar para o lado oposto.
    if (speed > 0 && x > width + grid) {
      x = -w - grid;
    } else if (speed < 0 && x < -w - grid) {
      x = width + grid;
    }
  }

  //método para exibir o carro.
  void show() {
    fill(200);
    image(telaCarro, x, y, w, h); // Exibe a imagem do carro na posição e dimensões corretas
  }
}

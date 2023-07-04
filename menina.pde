//o "extends" serve para indica que a classe Menina herda da classe Rectangle.
class Menina extends Rectangle {
  Tronco attached = null;

  Menina(float x, float y, float w) {
    //chama o construtor da classe pai (Rectangle) passando as coordenadas (x, y) e a largura w.
    super(x, y, w, w);
  }

  //método para vincular um tronco à menina.
  void attach(Tronco tronco) {
    attached = tronco;
  }

  //método para atualizar a posição da menina.
  void update() {
    if (attached != null) {
      menina.x += attached.speed;
    }
    menina.x = constrain(x, 0, width - w);
  }

  //método para exibir a menina.
  void show() {
    fill(150, 100, 100);
    image(telaMenina, x, y, w, w); // Exibe a imagem da menina na posição e dimensões corretas
  }

  //método para mover a menina.
  void move(float xdir, float ydir) {
    x += xdir * grid; 
    y += ydir * grid; 
  }
}

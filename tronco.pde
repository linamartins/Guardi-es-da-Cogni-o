class Tronco extends Car {

  Tronco(float x, float y, float w, float h, float s) {
    super(x, y, w, h, s);
  }

  void show() {
    fill(150, 100, 100); 
    image(telaTronco, x, y, w, h); 
  }
}

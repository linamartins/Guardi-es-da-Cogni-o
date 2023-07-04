class Rectangle {
  float x;
  float y;
  float w;
  float h;

  Rectangle(float x, float y, float w, float h) {
    //classe Rectangle que recebe as coordenadas x, y e as dimensões w, h do retângulo.
    this.x = x;
    this.w = w;
    this.y = y;
    this.h = h;
  }

  //verificação da interseção entre dois retângulos
  boolean intersects(Rectangle other) {

    float left = x;
    float right = x + w;
    float top = y;
    float bottom = y + h;

    float oleft = other.x;
    float oright = other.x + other.w;
    float otop = other.y;
    float obottom = other.y + other.h;

    //retorna verdadeiro se não houver interseção entre os lados dos retângulos.
    return !(left >= oright ||
             right <= oleft ||
             top >= obottom ||
             bottom <= otop);
  }
}

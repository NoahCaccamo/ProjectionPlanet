class Tile {
  float xpos, ypos, size;
  float saturation;
  Tile(float ixpos, float iypos, float isize) {
    xpos = ixpos;
    ypos = iypos;
    size = isize;
  }

  void display() {
    top.colorMode(HSB, 360, 100, 100);
    top.fill(138, saturation, 81);
    top.rect(xpos, ypos, size, size);
    top.colorMode(RGB);

    if (frameCount % 20 == 0 && saturation > 0) {
      saturation --;
    }
  }

  void proximityColor() {
    float valueAdd =  map(distPlayer(p1), 0, 100, 0.2, 0);
    if (valueAdd > 0 && saturation < 100) {
        saturation += valueAdd;
    }
  }

  float distPlayer(Player p) {
    return dist(p.xpos, p.ypos, xpos, ypos);
  }
}

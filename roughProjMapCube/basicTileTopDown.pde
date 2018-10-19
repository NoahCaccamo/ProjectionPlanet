class Tile {
  float xpos, ypos, size;
  float saturation, maxSaturation;
  float brightness = random (70, 81);
  boolean canFade = true;
  Tile(float ixpos, float iypos, float isize) {
    xpos = ixpos;
    ypos = iypos;
    size = isize;
  }

  void display() {
    top.colorMode(HSB, 360, 100, 100);
    top.noStroke();
    top.fill(138, saturation, brightness);
    top.rect(xpos, ypos, size, size);
    top.stroke(0);
    top.colorMode(RGB);

    if (frameCount % 2 == 0 && saturation > 0 && canFade == true) {
      saturation --;
    }
  }

  void proximityColor() {
    maxSaturation = map(distPlayer(p1), 100, 0, 0, 100);
    if(maxSaturation > 100){
    maxSaturation = 100;
    }else if (maxSaturation < 0) {
     maxSaturation = 0; 
    }
    float valueAdd =  map(distPlayer(p1), 0, 100, 2, 0);
    if (valueAdd > 0 && saturation < 100 && saturation < maxSaturation) {
        saturation += valueAdd;
        canFade = false;
    }else{
     canFade = true; 
    }
  }

  float distPlayer(Player p) {
    return dist(p.xpos, p.ypos, xpos, ypos);
  }
}

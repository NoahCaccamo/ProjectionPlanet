class fgTile extends Tile {

  fgTile(float ixpos, float iypos, float isize, int iside) {
    xpos = ixpos;
    ypos = iypos;
    size = isize;
    side = iside;
    hue = 238;
    brightness = random(24,30);
    if (side == 5) {
     hue = 216;
    brightness = random(75,90); 
    }
  }
 
 void chooseSide(PGraphics targetSide) {
    targetSide.colorMode(HSB, 360, 100, 100);
    targetSide.noStroke();
    if (side != 5) {
    targetSide.fill(hue, brightness, saturation + tempSaturation);
    }else {
      targetSide.fill(hue, 100, brightness);
    }
    targetSide.rect(xpos, ypos, size, size);
    targetSide.stroke(0);
    targetSide.colorMode(RGB);
  }
  
  
}

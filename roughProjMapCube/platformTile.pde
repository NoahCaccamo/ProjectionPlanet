class PlatformTile extends Tile {


  PlatformTile(float ixpos, float iypos, float isize, int iside) {
    xpos = ixpos;
    ypos = iypos;
    size = isize;
    side = iside;
    hue = 238;
    brightness = random(15,17);
  }

void chooseSide(PGraphics targetSide) {
    targetSide.colorMode(HSB, 360, 100, 100);
    targetSide.noStroke();
    targetSide.fill(hue, brightness, saturation + tempSaturation);
    targetSide.rect(xpos, ypos, size, size);
    targetSide.stroke(0);
    targetSide.colorMode(RGB);
  }
  

  void playerCollision() {
    if (p1.screen == 2 && p1.ypos + p1.size/2 >= ypos - size/2 && p1.ypos+p1.size/2 < ypos + size/2 && p1.xpos + size/2 > xpos - size/2 && p1.xpos - size/2 < xpos + size/2) {
      p1.ypos = ypos - size;
      p1.vertA = 0;
      p1.airborne = false;
    }
    
    if (p1.screen == 2 && p1.ypos -p1.size/2 <= ypos + size/2 && p1.ypos-p1.size/2 > ypos - size/2 && p1.xpos + size/2 > xpos - size/2 && p1.xpos - size/2 < xpos + size/2) {
     if (p1.vertA > 0) {
      p1.vertA = 0; 
     }
    }
    
    if(p1.screen == 2 && p1.xpos + p1.size/2 >= xpos - size/2 && p1.xpos + p1.size/2 < xpos + size/2 && (p1.ypos + p1.size/2)-1 >= ypos - size/2 && (p1.ypos - size/2)+1 <= ypos+size/2) {
     p1.xpos = xpos - size;
    }
    
    if(p1.screen == 2 && p1.xpos - p1.size/2 <= xpos + size/2 && p1.xpos - p1.size/2 > xpos - size/2 && (p1.ypos + p1.size/2)-1 >= ypos - size/2 && (p1.ypos - size/2)+1 <= ypos+size/2) {
      p1.xpos = xpos + size;
    }
  }
}

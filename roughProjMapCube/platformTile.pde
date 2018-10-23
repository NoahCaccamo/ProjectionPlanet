class PlatformTile extends Tile {

PlatformTile() {}
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
    //OLD MOVEMENT
    Player player = p1;
    if (side == 4| side==5|side==6) {
     player = p2; 
    }
    if (player.screen == side && player.ypos + player.size/2 >= ypos - size/2 && player.ypos+player.size/2 < ypos + size/2 && player.xpos + size/2 > xpos - size/2 && player.xpos - size/2 < xpos + size/2) {
      player.ypos = ypos - size;
      player.vertA = 0;
      player.airborne = false;
    }
    
    if (player.screen == side && player.ypos -player.size/2 <= ypos + size/2 && player.ypos-player.size/2 > ypos - size/2 && player.xpos + size/2 > xpos - size/2 && player.xpos - size/2 < xpos + size/2) {
     if (player.vertA > 0) {
      player.vertA = 0; 
     }
    }
    
    if(player.screen == side && player.xpos + player.size/2 >= xpos - size/2 && player.xpos + player.size/2 < xpos + size/2 && (player.ypos + player.size/2)-1 >= ypos - size/2 && (player.ypos - size/2) <= ypos+size/2) {
     player.xpos = xpos - size;
     player.canRight = false;
    }
    
    if(player.screen == side && player.xpos - player.size/2 <= xpos + size/2 && player.xpos - player.size/2 > xpos - size/2 && (player.ypos + player.size/2)-1 >= ypos - size/2 && (player.ypos - size/2) <= ypos+size/2) {
      player.xpos = xpos + size;
      player.canLeft = false;
    }
    
    //if (p1.screen == side && p1.ypos + p1.size >= ypos && p1.ypos < ypos + size && p1.xpos + size > xpos && p1.xpos < xpos + size) {
    //  p1.ypos = ypos - size;
    //  p1.vertA = 0;
    //  p1.airborne = false;
    //}
    
    //if (p1.screen == side && p1.ypos < ypos + size && p1.ypos > ypos && p1.xpos + size >= xpos && p1.xpos <= xpos + size) {
    //  p1.ypos = ypos + size;
    // if (p1.vertA > 0) {
    //  p1.vertA = 0; 
    // }
    //}
    
    //if(p1.screen == side && p1.keys[2] == true && p1.xpos + p1.size > xpos && p1.xpos < xpos + size && (p1.ypos + p1.size) > ypos && (p1.ypos) < ypos+size) {
    //  p1.xpos = xpos - width - 1;
    // p1.canRight = false;
    //}
    
    //if(p1.screen == side && p1.keys[3] == true && p1.xpos <= xpos + size && p1.xpos > xpos && (p1.ypos + p1.size)-1 >= ypos && (p1.ypos) <= ypos+size) {
    //  p1.canLeft = false;
    //}
    
    
  }
}

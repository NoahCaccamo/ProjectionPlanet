class Tile {
  float xpos, ypos, size;
  float saturation, maxSaturation, tempSaturation;
  float hue;
  float brightness;
  int flowerChance = int(random (1, 50));
  int side;
  boolean canFade;

  Tile() {
  }
  Tile(float ixpos, float iypos, float isize, int iside) {
    xpos = ixpos;
    ypos = iypos;
    size = isize;
    side = iside;
    hue = 138;
    brightness = random (70, 81);
    if (flowerChance == 4) {
      hue = 385; 
      brightness = 100;
    } else if (flowerChance == 5) {
      hue = 55;
      brightness = 100;
    }
  }
  void chooseSide(PGraphics targetSide) {
    targetSide.colorMode(HSB, 360, 100, 100);
    targetSide.noStroke();
    targetSide.fill(hue, saturation + tempSaturation, brightness);
    targetSide.rect(xpos, ypos, size, size);
    targetSide.stroke(0);
    targetSide.colorMode(RGB);
  }
  
  void display() {
    switch(side) {

    case 1:
      chooseSide(top);
      break;
    case 2:
      chooseSide(side1);
      break;
    case 3:
      chooseSide(side2);
      break;
    }
      
      if (frameCount % 2 == 0 && saturation+tempSaturation > 0 && canFade == true) {
      tempSaturation --;
    }
  }
  
    void display(PGraphics targetSide) {

    targetSide.colorMode(HSB, 360, 100, 100);
    targetSide.noStroke();
    targetSide.fill(hue, saturation + tempSaturation, brightness);
    targetSide.rect(xpos, ypos, size, size);
    targetSide.stroke(0);
    targetSide.colorMode(RGB);

    if (frameCount % 2 == 0 && saturation+tempSaturation > 0 && canFade == true) {
      tempSaturation --;
    }
  }

  void proximityColor() {
    if (p1.screen == side) {
      maxSaturation = map(distPlayer(p1), 100, 0, 0, 100);
      if (maxSaturation > 100) {
        maxSaturation = 100;
      } else if (maxSaturation < 0) {
        maxSaturation = 0;
      }
      float valueAdd =  map(distPlayer(p1), 0, 100, 2, 0);
      if (valueAdd > 0) {
        canFade = false;
        if (saturation+tempSaturation < 100 && saturation+tempSaturation < maxSaturation && p1.mode == 1) {
          tempSaturation += valueAdd;
        } else if (valueAdd > 0 && saturation < 100 && p1.mode == 2) {
          saturation += valueAdd; 
          canFade = true;
        } else if (p1.mode == 3) {
          saturation --;
          canFade = true;
        }
      } else {
        canFade = true;
      }
    }

    if (saturation > 100) {
      saturation = 100;
    } else if (saturation <0) {
      saturation = 0;
    }
    if (tempSaturation > 100) {
      tempSaturation = 100;
    } else if (tempSaturation <0) {
      tempSaturation = 0;
    }
  }

  float distPlayer(Player p) {
    return dist(p.xpos, p.ypos, xpos, ypos);
  }
}

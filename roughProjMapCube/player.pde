class Player {
  boolean[] keys =new boolean [4];
  float size;
  float xpos;
  float ypos;
  float xpos2;
  float ypos2;
  float mvspeed;
  float vertA;
  int screen;
  boolean isTop, isSide1, isSide2;
  boolean airborne = true;
  boolean canLeft = true, canRight = true;
  int mode = 1;
  Area hbox;

  Player(float isize, float ixpos, float iypos, float imvspeed, int iscreen) {
    size = isize;
    xpos = ixpos;
    ypos = iypos;
    mvspeed = imvspeed;
    screen = iscreen;
    isTop = true;
  }

  void display() {
    
    switch (mode) {
      case 1:
    top.fill(255, 0, 0);
    side1.fill(255,0,0);
    side2.fill(255,0,0);
    break;
    
    case 2:
    top.fill(0, 255, 0);
    side1.fill(0,255,0);
    side2.fill(0,255,0);
    break;
    
    case 3:
    top.fill(0, 0, 255);
    side1.fill(0,0,255);
    side2.fill(0,0,255);
    break;
    }
    if (isTop == true) {
      top.rect(xpos, ypos, size, size);
    }
    if (isSide1 == true) {
      side1.rect(xpos, ypos, size, size);
      xpos2  = xpos - sideSize;
      ypos2 = ypos;
      side2.rect(xpos2, ypos, size, size);
    }
    if (isSide2 == true) {
      side2.rect(xpos, ypos, size, size);
    }


    hbox = new Area(new Rectangle2D.Float(p1.xpos - size/2, p1.ypos - size/2, size, size));
  }

  void refresh() {
    hbox = new Area(new Rectangle2D.Float(p1.xpos - size/2, p1.ypos - size/2, size, size));
  }

  void keysCheckP() {
    if (key == 'w' || key == 'W') {
      keys[0] = true;
    }
    if (key == 's' || key == 'S') {
      keys[1] = true;
    }
    if (key == 'a' || key == 'A') {
      keys[2] = true;
    }
    if (key == 'd' || key == 'D') {
      keys[3] = true;
    }
  }

  void keysCheckR() {
    if (key == 'w' || key == 'W') {
      keys[0] = false;
    }

    if (key == 's' || key == 'S') {
      keys[1] = false;
    }

    if (key == 'a' || key == 'A') {
      keys[2] = false;
    }

    if (key == 'd' || key == 'D') {
      keys[3] = false;
    }
  }

  void move() {
if (isTop == true) {
    if (keys[0] == true) {
      ypos -= mvspeed;
    }
    if (keys[1] == true) {
      ypos += mvspeed;
    }
    if (keys[2] == true) {
      xpos -= mvspeed;
    }
    if (keys[3] == true) {
      xpos += mvspeed;
    }
}else {
  
  if (keys[2] == true && canLeft == true) {
      xpos -= mvspeed;
    }
    if (keys[3] == true && canRight == true) {
      xpos += mvspeed;
    }
  
 vertA--;
 if (ypos+p1.size/2 >= sideSize) {
  vertA = 0; 
  ypos = sideSize - p1.size;
 }
 ypos -= vertA;
}
    if (ypos >= top.height+20 && screen == 1) {
      ypos = -19;
      isTop = false;
      isSide1 = true;
      screen = 2;
    } else if (ypos <= -20 && screen == 2) {
      screen = 1; 
      isSide1 = false;
      isTop = true;
      ypos = topSize + 19;
    } else if (xpos >= side1.width+2 && screen == 2) {
      screen = 3;
      isSide2 = true;
      isSide1 = false;
      xpos = 2;
    } else if (ypos <= -20 && screen == 3) {
      screen = 1;
      isTop = true;
      isSide2 = false;
      ypos = top.height - xpos;
      xpos = top.width-20;
    } else if (xpos <= 1 && screen == 3) {
      screen = 2;
      isSide1 = true;
      isSide2 = false;
      xpos = side2.width;
    } else if (xpos >= top.width + 20 && screen == 1) {
      screen = 3;
      isTop = false;
      isSide2 = true;
      xpos = 400-ypos;
      ypos = 20;
    }
  }
  
  void toggleMode2() {
   if (mode != 2) {
    mode = 2; 
   }else {
    mode = 1; 
   }
  }
  
  void toggleMode3() {
    if (mode != 3) {
    mode = 3; 
   }else {
    mode = 1; 
   }
  }
}

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
  boolean airborne = true;
  boolean canLeft = true, canRight = true;
  boolean canFall = true;
  int fallTimer;
  int mode = 1;
  float resolveSpeed;

  Player(float isize, float ixpos, float iypos, float imvspeed, int iscreen) {
    size = isize;
    xpos = ixpos;
    ypos = iypos;
    mvspeed = imvspeed;
    screen = iscreen;
  }

  void display() {
    if (canFall == false) {
      fallTimer ++;
      if (fallTimer >= 120) {
        fallTimer = 0;
        canFall = true;
      }
    }

    switch (mode) {
    case 1:
      top.fill(255, 0, 0);
      side1.fill(255, 0, 0);
      side2.fill(255, 0, 0);
      secondTop.fill(255, 0, 0);
      secondSide1.fill(255, 0, 0);
      secondSide2.fill(255, 0, 0);
      break;

    case 2:
      top.fill(0, 255, 0);
      side1.fill(0, 255, 0);
      side2.fill(0, 255, 0);
      secondTop.fill(0, 255, 0);
      secondSide1.fill(0, 255, 0);
      secondSide2.fill(0, 255, 0);
      break;

    case 3:
      top.fill(0, 0, 255);
      side1.fill(0, 0, 255);
      side2.fill(0, 0, 255);
      secondTop.fill(0, 0, 255);
      secondSide1.fill(0, 0, 255);
      secondSide2.fill(0, 0, 255);
      break;
    }
    if (screen == 1) {
      top.rect(xpos, ypos, size, size);
    }
    else if (screen == 2) {
      side1.rect(xpos, ypos, size, size);
      xpos2  = xpos - sideSize;
      ypos2 = ypos;
      side2.rect(xpos2, ypos, size, size);
    }
    else if (screen == 3) {
      side2.rect(xpos, ypos, size, size);
    }
    else if (screen == 4) {
      secondTop.rect(xpos, ypos, size, size);
    }else if (screen == 5) {
      secondSide1.rect(xpos, ypos, size, size);
      xpos2  = xpos - sideSize;
      ypos2 = ypos;
      secondSide2.rect(xpos2, ypos, size, size);
    }
    else if (screen == 6) {
      secondSide2.rect(xpos, ypos, size, size);
    }

  }



  void keysCheckP(int controls) {
    if(controls == 1) {
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
    }else {
      if (key == '8') {
      keys[0] = true;
    }
    if (key == '5') {
      keys[1] = true;
    }
    if (key == '4') {
      keys[2] = true;
    }
    if (key == '6') {
      keys[3] = true;
    }
    }
  }

  void keysCheckR(int controls) {
    if ( controls == 1) {
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
  }else {
    if (key == '8') {
      keys[0] = false;
    }

    if (key == '5') {
      keys[1] = false;
    }

    if (key == '4') {
      keys[2] = false;
    }

    if (key == '6') {
      keys[3] = false;
    }
  }
  }

  void move() {
    if (resolveSpeed > 0) {
      ypos -= resolveSpeed;
      resolveSpeed --;
    }
    if (screen == 1| screen == 4) {
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
    } else {

      if (keys[2] == true && canLeft == true) {
        xpos -= mvspeed;
      }
      if (keys[3] == true && canRight == true) {
        xpos += mvspeed;
      }

      vertA--;
      if (ypos+size/2 >= sideSize) {
        vertA = 0; 
        ypos = sideSize - size;
      }
      ypos -= vertA;
    }
    if (ypos >= top.height+20 && screen == 1) {
      ypos = -19;
      screen = 2;
      canFall = false;
    } else if (ypos <= -20 && screen == 2 && canFall == true) {
      screen = 1; 
      ypos = topSize + 19;
      canFall = false;
      resolveSpeed = 10;
    } else if (ypos <= -20 && screen == 5 && canFall == true) {
      screen = 4; 
      ypos = topSize + 19;
      canFall = false;
      resolveSpeed = 10;
    }else if (xpos >= side1.width+2 && screen == 2) {
      screen = 3;
      xpos = 2;
    } else if (xpos >= side1.width+2 && screen == 5) {
      screen = 6;
      xpos = 2;
    } else if (ypos <= -20 && screen == 3) {
      screen = 1;
      ypos = top.height - xpos;
      xpos = top.width-20;
    } else if (xpos <= 1 && screen == 3) {
      screen = 2;
      xpos = side2.width;
    } else if (xpos <= 1 && screen == 6) {
      screen = 5;
      xpos = side2.width;
    }
    else if (xpos >= top.width + 20 && screen == 1) {
      screen = 3;
      xpos = 400-ypos;
      ypos = 20;
    }

    if (screen == 1 && xpos + size > topSize| screen == 4 && xpos + size > topSize) {
      xpos = topSize - size;
    } else if (screen == 1 && xpos < 0|screen == 4 && xpos < 0) {
      xpos = 0;
    } else if (screen == 1 && ypos + size > topSize|screen == 4 && ypos + size > topSize) {
      ypos = topSize - size;
    } else if (screen == 1 && ypos < 0|screen == 4 && ypos < 0) {
      ypos = 0;
    }
  }

  void toggleMode2() {
    if (mode != 2) {
      mode = 2;
    } else {
      mode = 1;
    }
  }

  void toggleMode3() {
    if (mode != 3) {
      mode = 3;
    } else {
      mode = 1;
    }
  }
}

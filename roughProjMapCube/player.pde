class Player {
  boolean[] keys =new boolean [4];
  float size;
  float xpos;
  float ypos;
  float xpos2;
  float ypos2;
  float mvspeed;
  int screen;
  boolean isTop;
  boolean isSide1;
  boolean isSide2;
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
    top.fill(255, 0, 0);

    if (isTop == true) {
      top.rect(xpos, ypos, size, size);
    }
    if (isSide1 == true) {
      side1.rect(xpos, ypos, size, size);
      xpos2  = xpos - 400;
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
    if (ypos >= top.height+20 && screen == 1) {
      ypos = -21;
      isTop = false;
      isSide1 = true;
      screen = 2;
    } else if (ypos <= -20 && screen == 2) {
      screen = 1; 
      isSide1 = false;
      isTop = true;
      ypos = 419;
    } else if (xpos >= side1.width+2 && screen == 2) {
      screen = 3;
      isSide2 = true;
      isSide1 = false;
      xpos = 0;
    } else if (ypos <= -20 && screen == 3) {
      screen = 1;
      isTop = true;
      isSide2 = false;
      ypos = 400 - xpos;
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
}

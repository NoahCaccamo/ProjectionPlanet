import deadpixel.keystone.*;
import java.awt.geom.*;
import java.awt.*;

Keystone ks;
CornerPinSurface surface1, surface2, surface3;
PGraphics top, side1, side2;

boolean debug = true;

ArrayList<Tile> tiles = new ArrayList<Tile>();

Player p1; 
Tile t1, t2, t3;

int topSize = 800;
int tileSize = 40;
float topCompletion;
void setup() {
  //fullScreen(P3D);
  size(800, 600, P3D);
  rectMode(CENTER);

  ks = new Keystone(this);
  surface1 = ks.createCornerPinSurface(topSize, topSize, 20);
  surface2 = ks.createCornerPinSurface(400, 400, 20);
  surface3 = ks.createCornerPinSurface(400, 400, 20);

  top = createGraphics(topSize, topSize, P3D);
  top.rectMode(CENTER);
  side1 = createGraphics(400, 400, P3D);
  side1.rectMode(CENTER);
  side2 = createGraphics(400, 400, P3D);
  side2.rectMode(CENTER);

  p1 = new Player(40, 1, 1, 5, 1);

  //Top Grid
  for (int x=0; x < topSize; x += tileSize) {
    for (int y=0; y < topSize; y += tileSize) {
      tiles.add(new Tile(x, y, tileSize));
    }
  }
}


void draw() {
  background(0);
  p1.move();


  /////////////TOP DRAW/////////////////////////////////////
  top.beginDraw();
  top.background(0);

  //Update Top Tiles
  topCompletion = 0;
  for (int i=0; i < tiles.size(); i++) {
    Tile getTile = tiles.get(i);
    getTile.display();
    getTile.proximityColor();
    topCompletion += getTile.saturation;
  }
  println(topCompletion);
  p1.display();
  top.endDraw();
  surface1.render(top);
  //////////////////////////////////////////////////////////////
  side1.beginDraw();
  side1.background(0);
  p1.display();
  side1.endDraw();
  surface2.render(side1);

  side2.beginDraw();
  side2.background(0);
  p1.display();
  side2.endDraw();
  surface3.render(side2);
}

void keyPressed() { //add new person on key press  
  p1.keysCheckP();
  switch(key) {
  case 'c':
    // enter/leave calibration mode, where surfaces can be warped 
    // and moved
    ks.toggleCalibration();
    break;

  case 'l':
    // loads the saved layout
    ks.load();
    break;

  case 's':
    // saves the layout
    ks.save();
    break;
  }
}

void keyReleased() {
  p1.keysCheckR();
}

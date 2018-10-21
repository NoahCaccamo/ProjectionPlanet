import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import deadpixel.keystone.*;
import java.awt.geom.*;
import java.awt.*;

Keystone ks;
CornerPinSurface surface1, surface2, surface3;

Minim minim;
AudioPlayer pa, pb, pc, pd, pe, pf, pg, ph, pi, pj, pk, pl, pm, pn, po, pp, pq, pr, ps, pt, pu, pv, pw, px, py, pz, pz1, pz2;
int firstLoop = -1, lastLoop = -1;
int startLoopCheck = 4000;
boolean initialRewind;
int posA;

PGraphics top, side1, side2;
PImage topMap, side1Map, side2Map, legend;
int tileNum, waterTileNum, crystalTileNum, platformTileNum, fgTileNum, bgTileNum;

boolean debug = true;

ArrayList<Tile> tiles = new ArrayList<Tile>();
ArrayList<waterTile> waterTiles = new ArrayList<waterTile>();
ArrayList<PlatformTile> Ptiles = new ArrayList<PlatformTile>();
ArrayList<fgTile> fgTiles = new ArrayList<fgTile>();
ArrayList<bgTile> bgTiles = new ArrayList<bgTile>();

Player p1; 
Tile t1, t2, t3;

int topSize = 800;
int sideSize = 800;
int tileSize = 40;
float basicTopCompletion, waterTopCompletion, platformSide1Completion, bgSide1Completion, fgSide1Completion;
void setup() {
  fullScreen(P3D);
  //size(800, 600, P3D);
  rectMode(CENTER);

  minim = new Minim(this);

  startThreads();

  topMap = loadImage("tPlanet.png");
  side1Map = loadImage("side1Map.png");
  legend = loadImage("tileLegend.png");
  setLegend();
  parseMap(topMap, 1);
  parseMap(side1Map, 2);
  ks = new Keystone(this);
  surface1 = ks.createCornerPinSurface(topSize, topSize, 20);
  surface2 = ks.createCornerPinSurface(sideSize, sideSize, 20);
  surface3 = ks.createCornerPinSurface(sideSize, sideSize, 20);

  top = createGraphics(topSize, topSize, P3D);
  top.rectMode(CENTER);
  side1 = createGraphics(sideSize, sideSize, P3D);
  side1.rectMode(CENTER);
  side2 = createGraphics(sideSize, sideSize, P3D);
  side2.rectMode(CENTER);

  p1 = new Player(40, 1, 1, 5, 1);

}

void draw() {
  background(0);
  p1.move();


  /////////////TOP DRAW/////////////////////////////////////
  top.beginDraw();
  top.background(0);

  //Update Top Tiles
  basicTopCompletion = 0;
  for (int i=0; i < tiles.size(); i++) {
    Tile getTile = tiles.get(i);
    getTile.proximityColor();
    getTile.display();
    basicTopCompletion += getTile.saturation;
  }
  basicTopCompletion /= tiles.size();

  //Update Top Water Tiles
  waterTopCompletion = 0;
  for (int i=0; i < waterTiles.size(); i++) {
    waterTile getTile = waterTiles.get(i);
    getTile.proximityColor();
    getTile.display();
    waterTopCompletion += getTile.saturation;
  }
  waterTopCompletion /= waterTiles.size();

  p1.display();
  top.endDraw();
  surface1.render(top);
  //////////////////////////////////////////////////////////////
  side1.beginDraw();
  side1.background(0);


 
//update bg tiles
bgSide1Completion = 0;
    for (int i=0; i < bgTiles.size(); i++) {
    bgTile getTile = bgTiles.get(i);
    getTile.proximityColor();
    getTile.display();
    bgSide1Completion += getTile.saturation;
  }
bgSide1Completion /= bgTiles.size();

  //Update Platform Tiles
  platformSide1Completion = 0;
  for (int i=0; i < Ptiles.size(); i++) {
    PlatformTile getTile = Ptiles.get(i);
    getTile.proximityColor();
    getTile.display();
    getTile.playerCollision();
    platformSide1Completion += getTile.saturation;
  }
  platformSide1Completion /= Ptiles.size();

 p1.display();
  
  //foreground update
  fgSide1Completion = 0;
    for (int i=0; i < fgTiles.size(); i++) {
    fgTile getTile = fgTiles.get(i);
    getTile.proximityColor();
    getTile.display();
    fgSide1Completion += getTile.saturation;
  }
  fgSide1Completion /= fgTiles.size();
  
  side1.endDraw();
  surface2.render(side1);

  side2.beginDraw();
  side2.background(0);
  p1.display();
  side2.endDraw();
  surface3.render(side2);


  if (millis() > startLoopCheck) {
    forceRewind();
    rewindAll();
    musicProgression();
  }
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

  case 'k':
    // saves the layout
    ks.save();
    break;

  case ' ':
    //jump
    if (p1.isTop == false) {
      p1.vertA = 15;
    }
    break;
  case 'q':
    p1.toggleMode2();
    break;
  case 'e':
    p1.toggleMode3();
    break;
  case 'h':
    posA = pa.position();
    syncSongs();
    break;
  }
}

void keyReleased() {
  p1.keysCheckR();
}

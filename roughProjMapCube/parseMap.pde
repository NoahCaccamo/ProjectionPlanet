void setLegend () {
    for (int x=0; x < legend.width; x += 1) {
      
      int tileColor = legend.get(x,0);
      switch(x) {
        case 0:
        tileNum = tileColor;
        break;
        
        case 1:
        waterTileNum = tileColor;
        break;
        
        case 2:
        crystalTileNum = tileColor;
        break;
        
        case 3:
        platformTileNum = tileColor;
        break;
        
        case 4:
        fgTileNum = tileColor;
        break;
        
        case 5:
        bgTileNum = tileColor;
        break;
      }
      
    }
}

void parseMap (PImage map, int side){
    for (int y=0; y < topSize/tileSize; y += 1) {
    for (int x=0; x < topSize/tileSize; x += 1) {
      
      int tileColor = map.get(x,y);
      if (tileColor == tileNum) {
        tiles.add(new Tile(x*tileSize, y*tileSize, tileSize, side));
      }else if(tileColor == waterTileNum) {
        waterTiles.add(new waterTile(x*tileSize, y*tileSize, tileSize, side));
    }else if(tileColor == platformTileNum) {
       Ptiles.add(new PlatformTile(x*tileSize, y*tileSize, tileSize, side)); 
      }else if(tileColor == fgTileNum) {
        fgTiles.add(new fgTile(x*tileSize, y*tileSize, tileSize, side));
      }else if(tileColor == bgTileNum) {
       bgTiles.add(new bgTile(x*tileSize, y*tileSize, tileSize, side)); 
      }
      
    }
  }
}

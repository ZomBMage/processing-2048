void setup() {
  size(435,435);
  background(187, 173, 160);
  textSize(32);
  for (int i=0; i<16;i++) {
    tiles[i] = 0;
    }
  for (int j=0;j<1;j++) {
      int pos = (int)random(0,16);
      int val = (int)random(0,10);
      while (tiles[pos] != 0) { pos = (int)random(0,16); }
      if (val < 9) { tiles[pos] = 2; }
      else { tiles[pos] = 4; }
  }
}

int[] tiles = new int[16];

void draw() {
  for (int i=0; i<16;i++) {
    stroke(187, 173, 160);
    if (tiles[i] == 0) { fill(205, 192, 180); }
    else if (tiles[i] == 2) { fill(238, 228, 218); }
    else if (tiles[i] == 4) { fill(237, 224, 200); }
    else if (tiles[i] == 8) { fill(242, 177, 121); }
    else if (tiles[i] == 16) { fill(245, 149, 99); }
    else if (tiles[i] == 32) { fill(246, 124, 95); }
    else if (tiles[i] == 64) { fill(246, 94, 59); }
    else if (tiles[i] == 128) { fill(237, 207, 114); }
    else if (tiles[i] == 256) { fill(237, 204, 97); }
    else if (tiles[i] == 512) { fill(237, 200, 80); }
    else if (tiles[i] == 1024) { fill(237, 197, 63); }
    else if (tiles[i] == 2048) { fill(237, 194, 46); }
    rect((i%4)*107+7,(int)i/4*107+7,100,100);
    if (tiles[i] != 0) {
      fill(0);
    }
    text(tiles[i],(i%4)*107+50,(int)i/4*107+70);
  }
}
void keyPressed() {
  String dir = "";
  if (keyCode == 87 || keyCode == UP) { // A or UP
    dir = "UP";
  }
  else if (keyCode == 83 || keyCode == DOWN) { // S or DOWN
    dir = "DOWN";
  }
  else if (keyCode == 65 || keyCode == LEFT) { // A or LEFT
    dir = "LEFT";
  }
  else if (keyCode == 68 || keyCode == RIGHT) { // A or UP
    dir = "RIGHT";
  }
  print(dir + "\n");
  boolean moved = true;
  if (dir == "UP") {
    for (int i = 4;i<16;i++) {
      if (tiles[i] != 0) {
        int j = i;
        try {
          while (j >= 0) {
            if (tiles[j-4] == 0) {
              tiles[j-4] = tiles[j];
              tiles[j] = 0;
              draw();
                moved = true;
              j -= 4;
            }
            else if (tiles[j-4] == tiles[j]) {
              tiles[j-4] *= 2;
              tiles[j] = 0;  
              draw();
                moved = true;
              break;
            }
            else { break; }
          }
        }
        catch (Exception e) {;}
      }
    } 
  }
  if (dir == "DOWN") {
    for (int i = 12;i>=0;i--) {
      if (tiles[i] != 0) {
        int j = i;
        try {
          while (j >= 0) {
            if (tiles[j+4] == 0) {
              tiles[j+4] = tiles[j];
              tiles[j] = 0;
              draw();
                moved = true;
              j += 4;
            }
            else if (tiles[j+4] == tiles[j]) {
              tiles[j+4] *= 2;
              tiles[j] = 0;  
              draw();
                moved = true;
              break;
            }
            else { break; }
          }
        }
        catch (Exception e) {;}
      }
    } 
  }
  if (dir == "LEFT") {
    for (int j = 1;j<4;j++) {
      for (int k = 0;k<4;k++) {
        int i = j + k * 4;
        if (tiles[i] != 0) {
          int l = i;
          try {
            while (l % 4 >= 0) {
              if (tiles[l-1] == 0 && l % 4 > 0) {
                tiles[l-1] = tiles[l];
                tiles[l] = 0;
                draw();
                moved = true;
                l -= 1;
              }
              else if (tiles[l-1] == tiles[l]) {
                tiles[l-1] *= 2;
                tiles[l] = 0;  
                draw();
                moved = true;
                break;
              }
              else { break; }
            }
          }
          catch (Exception e) {;}
        }
      }
    } 
  }
  if (dir == "RIGHT") {
    for (int j = 2;j>=0;j--) {
      for (int k = 3;k>=0;k--) {
        int i = j + k * 4;
        if (tiles[i] != 0) {
          int l = i;
          try {
            while (l % 4 <= 3) {
              if (tiles[l+1] == 0 && l % 4 < 3) {
                tiles[l+1] = tiles[l];
                tiles[l] = 0;
                draw();
                moved = true;
                l += 1;
              }
              else if (tiles[l+1] == tiles[l]) {
                tiles[l+1] *= 2;
                tiles[l] = 0;  
                draw();
                moved = true;
                break;
              }
              else { break; }
            }
          }
          catch (Exception e) {;}
        }
      }
    } 
  }
  if ((dir == "LEFT" || dir == "RIGHT" || dir == "UP" || dir == "DOWN") && moved) {
    int newTile = (int)random(0,16);
    while (tiles[newTile] != 0) { newTile = (int)random(0,15); }
    int val = (int)random(0,10);
    if (val < 9) { tiles[newTile] = 2; }
    else { tiles[newTile] = 4; }
  }
  draw();
}

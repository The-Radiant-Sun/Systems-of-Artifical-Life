import java.util.*;

int particleNumber = 1000;

public void settings() {
  fullScreen();
}

void setup() {
  for(int i = 0; i < particleNumber; i++) {
    round(random(0, width));
    round(random(0, height));
  }
}

void draw() {
  background(0);
}

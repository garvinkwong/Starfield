class Particle {
  double myX, myY, myAngle, mySpeed;
  int myColor;
  Particle(int x, int y) {
    myX = x;
    myY = y;
    myAngle = (double)(Math.random()*360);
    mySpeed = (Math.random()*8);
    myColor = (int)(Math.random()*255);
  }

  void move() {
    myX = ((Math.cos(myAngle))*mySpeed) + myX;
    myY = ((Math.sin(myAngle))*mySpeed) + myY;
    if (mouseY<=200) {
      myY=myY+0.9;
    } else if (mouseY>200) {
      myY = myY-0.9;
    }
    if (mouseX<=200) {
      myX=myX+0.9;
    } else if (mouseX>200) {
      myX = myX-0.9;
    }
  }

  void show() {
    fill(myColor);
    ellipse((int)myX, (int)myY, 10, 10);
  }
}

void mousePressed() {
  for (int i = 0; i<800; i++) {
    davyn[i] = new Particle(mouseX, mouseY);
  }
  for (int i = 800; i<davyn.length; i++) {
    davyn[i] = new Beam(mouseX, mouseY);
  }
}

class Beam extends Particle {
  Beam(int x, int y) {
    super(x, y);
    myX = 200;
    myY = 200;
    myAngle = (int)(Math.random()*360);
    mySpeed = 10;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }
}

Particle[] davyn;
Beam deez;

void setup() {
  size(400, 400);
  davyn = new Particle[1000];
  noStroke();
  for (int i =0; i<800; i++) {
    davyn[i] = new Particle(200, 200);
  }

  for (int i =200; i<davyn.length; i++) {
    davyn[i] = new Beam(200, 200);
  }
}

void draw() {
  background(0);
  for (int i =0; i<davyn.length; i++) {
    davyn[i].move();
    davyn[i].show();
  }
  fill(255, 255, 255, 200);
  ellipse(75, 75, 100, 100);
  rect(0, 300, 50, 100);
  fill(255, 255, 255, 175);
  rect(50, 340, 80, 60);
  fill(255, 255, 255, 150);
  rect(130, 320, 70, 80);
  fill(255, 255, 255, 125);
  rect(200, 350, 70, 50);
  fill(255, 255, 255, 100);
  rect(270, 290, 40, 110);
  fill(255, 255, 255, 75);
  rect(310, 320, 90, 80);
}




// credit to: Levente Sandor, 2013
// modified by TeppieC, 2016

class Particle {
  float angle;
  int components[];
  float x, y;
  float decay;
  color clr;

  Particle(float w, float h, float decayRate) {
    angle = random(TWO_PI);
    x = w;
    y = h;
    decay = decayRate;
    clr = color(random(450), random(450), random(450), 100);
    components = new int[4];
    for (int i = 0; i < 4; i++) {
      components[i] = int(random(1, 2));
      //components[i] = 1;
    }
  }

  void paint() {
    float a = 0;
    float r = 0;
    float x1 = x;
    float y1 = y;
    float u = random(0.5, 1);

    fill(clr);
    clr = color(clr, 50-decay);

    noStroke();    

    beginShape();
    while (a < TWO_PI) {
      vertex(x1, y1); 
      float v = random(0.85, 1);
      x1 = x + r * cos(angle + a) * u * v;
      y1 = y + r * sin(angle + a) * u * v;
      a += PI / 180;
      for (int i = 0; i < 2; i++) {
        r += sin(a * components[i]);
      }
    }
    endShape(CLOSE);

    if (x < 0 || x > width ||y < 0 || y > height) {
      angle += HALF_PI;
    }

    x += 2 * cos(angle);
    y += 2 * sin(angle); 
    angle += random(-0.15, 0.15);
  }
}
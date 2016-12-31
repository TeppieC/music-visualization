import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer audio;
FFT fft;
float threshold;
int count;
ArrayList<Particle> particles;
ArrayList<Integer> counts;

void setup() {
  size(500, 500, P3D);
  frameRate(30);
  background(0); ////
  
  minim = new Minim(this);
  audio= minim.loadFile("07.mp3", 1024);
  audio.play();

  particles = new ArrayList<Particle>();
  counts = new ArrayList<Integer>(); //size of 30
  threshold = 20;
  fft = new FFT(audio.bufferSize(), audio.sampleRate());
}

void draw(){
  background(255);
  fill(255, 1);
  stroke(255);
  
  fft.forward(audio.left);
  for (int i = 0; i < fft.specSize(); i++)
  {
    float amp = fft.getBand(i);
    if(amp > threshold){
      particles.add(new Particle(random(500), (fft.getBand(i)-threshold)*500, 1));
    };
  }
  
  print(particles.size());
  print(" ");
  
  for (Particle particle : particles){
    particle.paint();
  }
  
  if (particles.size()> 1000){
    particles.clear();
  }
}
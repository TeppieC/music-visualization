import ddf.minim.*;
import ddf.minim.analysis.*;

//ArrayList<Particle> particles;
Minim minim;
AudioPlayer audio;
FFT fft;

void setup() {
  size(640, 360, P3D);
  frameRate(30);
  background(0); ////
  
  minim = new Minim(this);
  audio= minim.loadFile("07.mp3", 1024);
  audio.play();

  fft = new FFT(audio.bufferSize(), audio.sampleRate());
}

void draw(){
  background(0);
  stroke(255);
  
  fft.forward(audio.left);
  for (int i = 0; i < fft.specSize(); i++)
  {
    // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
    line(i, height, i, height - fft.getBand(i) * 4);
  }
}
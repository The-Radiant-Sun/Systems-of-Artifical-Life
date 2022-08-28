import java.util.*;

Particle[] particles; 
int particleNumber;

// Particle Interactions
int[][] typeInteractions = {
  {1, -1},
  {1,  1}
};

// Colour, size, particle number, and acceleration limit
int[][][] typeValues = {
  {{255, 0, 0}, {5}, {20}, {1}},
  {{0, 255, 0}, {5}, {20}, {1}}
};

ParticleType[] particleTypes = new ParticleType[typeInteractions.length];

public void settings() {
  fullScreen();
}

void setup() {
  for (int i = 0; i < particleTypes.length; i++) {
    particleTypes[i] = new ParticleType(typeInteractions, typeValues[i], i, particleTypes.length);
  }
  
  // Find total particles
  particleNumber = 0;
  for (int i = 0; i < typeValues.length; i++) {
    particleNumber += typeValues[i][2][0];
  }
  
  // Populate particle array
  particles = new Particle[particleNumber];
  int i = 0;
  for (ParticleType particleType: particleTypes) {
    for (Particle particle: particleType.particles) {
      particles[i] = particle;
      i++;
    }
  }
  
  // Send all particles to particles
  for (Particle particle: particles) {
    particle.particles = particles;
  }
}

void draw() {
  background(0);
  for (Particle particle: particles) {
    particle.calculate();
  }
  for (Particle particle: particles) {
    particle.display();
  }
}

/* Represents the constituant particles for all interactions */
class Particle {
  int size;
  int[] colour;
  
  PVector position, velocity, acceleration;
  
  Particle[] particles;
  ParticleType type;
  
  Particle(int[] spawn, ParticleType type_) {
    type = type_;
    size = type.size;
    colour = type.colour;
    
    position = new PVector(spawn[0], spawn[1]);
    velocity = new PVector(0, 0);
  }
  
  void calculate() {
    acceleration = new PVector(0, 0);
    for (Particle particle: particles) {
      acceleration.add(type.response(this, particle));
    }
  }
  
  void display() {
    // Change Vetors
    position.add(velocity);
    velocity.add(acceleration).limit(type.velocityLimit);
    
    // Enforce screen borders
    boolean flip = false;
    if (0 > position.x || position.x > width) {
      velocity.x *= -1;
      flip = true;
    } if (0 > position.y || position.y > height) {
      velocity.y *= -1;
      flip = true;
    } if (flip) {
      position.add(velocity);
    }
    
    stroke(0);
    fill(colour[0], colour[1], colour[2]);
    ellipse(position.x, position.y, size, size);
  }
}

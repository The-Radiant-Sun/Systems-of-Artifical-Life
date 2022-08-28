/* Represents the constituant particles for all interactions */
class Particle {
  int size;
  int[] colour;
  
  PVector position, velocity, acceleration;
  
  Particle[] particles;
  ParticleType type;
  
  Particle(int[] spawn, ParticleType t_type) {
    type = t_type;
    size = type.size;
    colour = type.colour;
    
    position = new PVector(spawn[0], spawn[1]);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void calculate() {
    for (Particle particle: particles) {
      acceleration.add(type.response(this, particle));
    }
    acceleration.limit(type.accelerationLimit);
  }
  
  void display() {
    // Change Vetors
    //position.add(velocity);
    //velocity.add(acceleration);
    
    position = new PVector(10,10);
    
    // Make screen borders enforced
    if (0 > position.x || position.x > width) {
      velocity.x *= -1;
    } if (0 > position.y || position.y > height) {
      velocity.y *= -1;
    }
    
    stroke(0);
    fill(colour[0], colour[1], colour[2]);
    ellipse(position.x, position.y, size, size);
  }
}

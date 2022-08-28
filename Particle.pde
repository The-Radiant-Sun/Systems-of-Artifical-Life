/* Represents the constituant particles for all interactions */
class Particle {
  float size;
  
  PVector position; // Its position on the map
  PVector velocity; // The velocity that effects the position
  PVector acceleration; // The acceleration will be affected by the particle relationships
  
  Particle(float t_size, float[] spawn) {
    size = t_size;
    
    position = new PVector(spawn[0], spawn[1]);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void Display() {
    position.add(velocity); // Change Vecotrs
    velocity.add(acceleration);
    
    stroke(0);
    fill(175);
    
    ellipse(position.x, position.y, size, size);
  }
}

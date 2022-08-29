/* Represents the different particle types and their interactions */
class ParticleType {
  // Cosmetic parameters
  int[] colour;
  int size;
  int typeNumber;
  
  // Spawn Parameters
  int[] spawnArea;
  int particleNumber;
  
  // Physics Parameters
  Particle[] particles;
  ParticleType[] particleTypes;
  int[][] typeInteractions;
  int velocityLimit;
  
  ParticleType(int[][] typeInteractions_, int[][] typeValues, int typeNumber_, int numberOfParticleTypes) {
    colour = typeValues[0];
    size = typeValues[1][0];
    particleNumber = typeValues[2][0];
    
    typeNumber = typeNumber_;
    
    particles = new Particle[particleNumber];
    particleTypes = new ParticleType[numberOfParticleTypes];
    typeInteractions = typeInteractions_;
    velocityLimit = typeValues[3][0];
    
    // Spawning all particles of this type
    for (int i = 0; i < particleNumber; i++) {
      int[] spawnPosition = new int[2];
      spawnPosition[0] = round(random(width));
      spawnPosition[1] = round(random(height));
      
      particles[i] = new Particle(spawnPosition, this);
    }
  }
  
  /* Calculate response acceleration vector from the effect of one particle on antoher */
  PVector response(Particle origin, Particle affector) {
    PVector distance = PVector.sub(affector.position, origin.position);
    if (distance.mag() != 0) {
      // The basic force is equal to the normal of the distance divided by the square of the magnitude of the distance
      PVector force = distance.normalize().mult(1 / distance.magSq());
      // Affect the force by the relationship between the origin and affector particle types
      PVector acceleration = force.mult(typeInteractions[origin.type.typeNumber][affector.type.typeNumber]);
      return acceleration;
    }
    return distance;
  }
}

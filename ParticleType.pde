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
  int accelerationLimit;
  
  ParticleType(int[][] t_typeInteractions, int[][] typeValues, int t_typeNumber, int numberOfParticleTypes) {
    colour = typeValues[0];
    size = typeValues[1][0];
    particleNumber = typeValues[2][0];
    
    typeNumber = t_typeNumber;
    
    particles = new Particle[particleNumber];
    particleTypes = new ParticleType[numberOfParticleTypes];
    typeInteractions = t_typeInteractions;
    accelerationLimit = typeValues[3][0];
    
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
    if (origin.position != affector.position) {
      PVector distance = new PVector(1,1);//affector.position.sub(origin.position);
      print(affector.position.sub(origin.position));
      print('\n');
      PVector force = distance.mult(1 / distance.magSq());
      print(affector.position.sub(origin.position).mult(1 / affector.position.sub(origin.position).magSq()));
      print('\n');
      PVector acceleration = force.mult(typeInteractions[origin.type.typeNumber][affector.type.typeNumber]);
      print(affector.position.sub(origin.position).mult(1 / affector.position.sub(origin.position).magSq()).mult(typeInteractions[origin.type.typeNumber][affector.type.typeNumber]));
      print('\n');
      print('\n');
      return new PVector(0,0);
    }
    return new PVector(0,0);
  }
}

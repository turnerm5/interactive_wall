class TrailParticle {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  color particleColor;
  float particleSize;
  
  float topspeed;
  float opacity;
  
  int lifespan;
   
  //construct the particles!!
  TrailParticle(PVector origin_) { 

    //standard location/velocity/acceleration
    location = origin_.get();
    velocity = new PVector(randomGaussian()*.5,abs(randomGaussian()));
    acceleration = new PVector();
    particleColor = color(random(200,255),random(100,50),random(10,30));
    particleSize = random(1,2);
    topspeed = 12;
    lifespan = (int) ((randomGaussian() * 10) + 20) ;

  }
  
  void run() {
   update();
   display();
   lifespan--;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    acceleration.add(f);
  }
  
  void launch(PVector force) {
    PVector f = force.get();
    velocity.add(f);
  }

  //basic motion, with some damping to slow everything down
  void update() {
      velocity.add(acceleration);
      velocity.mult(.98);
      velocity.limit(topspeed);
      location.add(velocity);
      acceleration.mult(0);
  } 

  void display() {
    //they'll fade as they die!
      float opacity = map(lifespan,400,0,200,80);
      fill(particleColor,opacity);
      noStroke();
      rect(location.x, location.y, particleSize, particleSize);
  }
  
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }

}

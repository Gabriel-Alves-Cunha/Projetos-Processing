class Sistema_de_Particulas {
  ArrayList<Particula> particulas;
  PVector origem;
  PImage img;

  Sistema_de_Particulas(int num, PVector v, PImage imagem) {
    origem = v.get();
    particulas = new ArrayList();
    img = imagem;
    for(int i = 0; i < num; i++){
      particulas.add(new Particula(origem, img));
    }
  }

  void applyForce(PVector force) {
    for (Particula p : particulas) {
      p.applyForce(force);
    }
  }

 // void applyRepeller(Repeller r) {
 //   PVector force;
  //  for (Particula p : particulas) {
 //     force = r.repel(p);
  //    p.applyForce(force);
 //   }
 // }

 // void addParticula() {
//    float r = random(1);
 //   if (r < .4) {
 //     particulas.add(new StarParticula(origem));
  //  } else {
  //    particulas.add(new Particula(origem));
 //   }
 // }


  void run() {
   // Iterator<Particula> it = particulas.iterator();
  //  while(it.hasNext()){
    
  //  }
    for (int i = particulas.size()-1; i >= 0; i--) {
      Particula p = particulas.get(i);
      p.run();

      if (p.isDead()) {
        particulas.remove(i);
      }
    }
  }
  
  void addParticula(){
    particulas.add(new Particula(origem, img));
  }
}

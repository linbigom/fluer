ArrayList<Flue> flueListe = new ArrayList<Flue>();

void setup(){
  size(500,500);
}

void draw(){
  background(219,112,147);
  for(int i=0; i<flueListe.size(); i++){
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
      }
    }

void keyPressed(){
  if (key == 'e') { //hvis e trykkes på tastaturet laves der 5 nye store fluer áf klassen FLue, fordi 5 er sejere end 1
    for(int i = 0; i < 5; i++){flueListe.add(new Flue(random(2,2.5)));}
  } else {
      flueListe.add(new Flue(1)); //alle andre taster vil betyde en lille flue
  }
}

void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY, random(0.5,1.5))); //laver ny flue og adder den til fluelisten, disse er også små, for e eulers tal, og det er cool, og er derfor det eneste der skal være stort
}

//////////////////////////FLUE/////////////////////////////////7
class Flue {
  float positionX, positionY; //fluens egen (x,y)
  float distanceFlyttet; //den distance som fluen flytter hvert frame
  float vinkel = 0; //vinkel man roterer koordinatsystemet
  float size;

  Flue(float s) { 
    positionX  = random(0, height);
    positionY  = random(0, width);
    vinkel     = random(0, 2*PI);
    size = s;
  }

  Flue(float a, float b, float s) {
    positionX = a;
    positionY = b;
    vinkel    = random(0, 2*PI);
    size = s;
  }

  void flyt() { //flytter først fluen, og tjekker så om fluen er ved nogen af kanterne
    distanceFlyttet = distanceFlyttet + 0.5;
    if (positionX + cos(vinkel) * distanceFlyttet < 0) { //hvis fluens x støder ind i venstre kant
      positionX += cos(vinkel) * distanceFlyttet;        //GENERELT FOR FLUEN, positionen (x,y) sættes til det nye nulpunkt på skræmens kant
      positionY += sin(vinkel) * distanceFlyttet ;         Så sættes vinklen til en ny vinkel, således at der er samme indgangs- og udgangsvinklen  
      vinkel = PI - vinkel;                                distancen der forrigt var blevet flyttet, sætte lig nul
      distanceFlyttet = 0;
      
    } else if (positionX + cos(vinkel) * distanceFlyttet > width) { //hvis fluens x støder ind i højre kant
      positionX += cos(vinkel) * distanceFlyttet;
      positionY += sin(vinkel) * distanceFlyttet;
      vinkel = PI - vinkel;
      distanceFlyttet = 0;
      
    } else if (positionY + sin(vinkel) * distanceFlyttet < 0) { //hvis flyens y støder ind i toppen
      positionX += cos(vinkel) * distanceFlyttet;
      positionY += sin(vinkel) * distanceFlyttet ;
      vinkel = 2* PI - vinkel;
      distanceFlyttet = 0;
      
    } else if (positionY + sin(vinkel) * distanceFlyttet > height) { //hvis fluens y støder ind i bunden
      positionX += cos(vinkel) * distanceFlyttet;
      positionY += sin(vinkel) * distanceFlyttet ;
      distanceFlyttet = 0;
      vinkel = 2* PI - vinkel;
    }
  }
  
  void tegnFlue() {
    pushMatrix();
    translate(positionX, positionY);
    rotate(vinkel);
    translate(distanceFlyttet, 0);
    scale(size);
    ellipse(0, 0, 20, 8);
    ellipse(0, 0-8, 15, 10);
    ellipse(0, 0+8, 15, 10);
    ellipse(0+6, 0, 8, 8);
    popMatrix();
  }
}

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
  if (key == 'e') {
    for(int i = 0; i < 5; i++){flueListe.add(new Flue(random(2,2.5)));}
  } else {
      flueListe.add(new Flue(1));
  }
}

void mousePressed(){
  flueListe.add(new Flue(mouseX, mouseY, random(0.5,1.5)));
}

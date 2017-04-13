// Groupe : Notebaert Dorian, Neil Levin, Laetitia Bouchet, Jing Ye
// Tutrice : Elisabeth Brunet

import ddf.minim.*;
import ddf.minim.ugens.*;
import javax.sound.midi.*;
import beads.*;
import java.util.*;


Minim            minim;
AudioPlayer      C2,Db2,D2,Eb2,E2,F2,Gb2,G2,Ab2,A2,Bb2,B2;  //Octave 1
AudioPlayer      C3,Db3,D3,Eb3,E3,F3,Gb3,G3,Ab3,A3,Bb3,B3;  //Octave 2
AudioPlayer      C4,Db4,D4,Eb4,E4,F4,Gb4,G4,Ab4,A4,Bb4,B4;  //Octave 3

/* TEST REPLAY
ArrayList<Character> melodie = new ArrayList<Character>();
ArrayList<int[]> rythm = new ArrayList<int[]>() ;

int[] time0 = {0,1000};int[] time1 = {1000,2000};int[] time2 = {2000,3000};int[] time3 = {3000,4000};
int[] time4 = {4000,5000};int[] time5 = {5000,6000};int[] time6 = {6000,7000};int[] time7 = {7000,8000};
*/

boolean[][] touchesB;
boolean[][] touchesN;

/* Touches blanches et noires par octave, lignes = Octaves, colonnes = Notes */
char[][] blanches = {{'a', 'z', 'e', 'r', 't', 'y','u'},{'i', 'o', 'p', '<', 'w', 'x','c'},{'v','b', 'n', ',', ';', ':', '!'}};
char[][] noires = {{'é', '"', '(', '-', 'è'},{'ç', 'à', 'q', 's', 'd'},{'g', 'h', 'k', 'l', 'm'}};


void setup() {
/*  melodie.add('a');melodie.add('z');melodie.add('e');melodie.add('r');melodie.add('t');melodie.add('y');melodie.add('u');melodie.add('i');
  rythm.add(time0);rythm.add(time1);rythm.add(time2);rythm.add(time3);rythm.add(time4);rythm.add(time5);rythm.add(time6);rythm.add(time7); TEST REPLAY*/
  size(1346, 500, P3D);
  // détermine si les touches sont appuyées ou non
  touchesB = new boolean[3][7];
  touchesN = new boolean[3][5];
  // variable son
  minim = new Minim(this);

// Fichiers Audio par notes
  C2 = minim.loadFile("Do2.wav", 512);  C3 = minim.loadFile("Do3.wav", 512);  C4 = minim.loadFile("Do4.wav", 512);
  D2 = minim.loadFile("Re2.wav", 512);  D3 = minim.loadFile("Re3.wav", 512);  D4 = minim.loadFile("Re4.wav", 512);
  E2 = minim.loadFile("Mi2.wav", 512);  E3 = minim.loadFile("Mi3.wav", 512);  E4 = minim.loadFile("Mi4.wav", 512);
  F2 = minim.loadFile("Fa2.wav", 512);  F3 = minim.loadFile("Fa3.wav", 512);  F4 = minim.loadFile("Fa4.wav", 512);
  G2 = minim.loadFile("Sol2.wav", 512);  G3 = minim.loadFile("Sol3.wav", 512);  G4 = minim.loadFile("Sol4.wav", 512);
  A2 = minim.loadFile("La2.wav", 512);  A3 = minim.loadFile("La3.wav", 512);  A4 = minim.loadFile("La4.wav", 512);
  B2 = minim.loadFile("Si2.wav", 512);  B3 = minim.loadFile("Si3.wav", 512);  B4 = minim.loadFile("Si4.wav", 512);
  Db2 = minim.loadFile("ReB2.wav", 512);  Db3 = minim.loadFile("ReB3.wav", 512);  Db4 = minim.loadFile("ReB4.wav", 512);
  Eb2 = minim.loadFile("MiB2.wav", 512);  Eb3 = minim.loadFile("MiB3.wav", 512);  Eb4 = minim.loadFile("MiB4.wav", 512);
  Gb2 = minim.loadFile("SolB2.wav", 512);  Gb3 = minim.loadFile("SolB3.wav", 512);  Gb4 = minim.loadFile("SolB4.wav", 512);
  Ab2 = minim.loadFile("LaB2.wav", 512);  Ab3 = minim.loadFile("LaB3.wav", 512);  Ab4 = minim.loadFile("LaB4.wav", 512);
  Bb2 = minim.loadFile("SiB2.wav", 512);  Bb3 = minim.loadFile("SiB3.wav", 512);  Bb4 = minim.loadFile("SiB4.wav", 512);
  
}


/* Dessine les touches, blanches et noires, et modifie la couleur si on appuie sur les touche */
void draw() {
    background(200); fill(0) ; rect(95,400,1155,250); //Fond noir derrière les touches
    fill(255);
    rect(95, 100, 1155, 80); //Fond blanc derrière la partition
    line(95, 120, 1250, 120);
    line(95, 140, 1250, 140);
    line(95, 160, 1250, 160);
    clavier();
    /* TEST REPLAY
    replay(melodie, rythm);
    delay(2000);
    */
    if (key == ' '){
      while( key != '$' ){
        clavier();
        record();
      }
    }
}

// Joue la note de musique correspondante
void keyPressed() {
    actionTouche(true);
    playNote(key);
}

void keyReleased() {
    actionTouche(false);
}

/* Simule l'action d'appuyer sur une touche et détermine la touche où on appuie */
void actionTouche(boolean pressed) {
    int ligneB = -1; //Valeur par défaut
    int ligneN = -1;
    int colonneB = -1;
    int colonneN = -1;
  
    for (int i = 0; i<3 ; ++i){ // S'applique aux 3 Octaves
        for (int j = 0; j < 7; ++j) {
            if (key == blanches[i][j]) { // "Si touche correspond au caractère blanches[i][j]"
                ligneB = i; //Détermine l'octave
                colonneB = j; //Détermine la note
            }
  
        }
        if (ligneB != -1) {
            touchesB[ligneB][colonneB] = pressed;
        }
        for (int j = 0; j < 5; ++j) {
            if (key == noires[i][j]) {
                ligneN = i; //Détermine l'octave
                colonneN = j; //Détermine la note
            }
        }
        if (ligneN != -1) {
            touchesN[ligneN][colonneN] = pressed;
        }
    }
}


ArrayList record(){ // A coder
  
  int start = 0, stop = 0;
  ArrayList<Character> melodie = new ArrayList();
  ArrayList<Integer[]> rythm = new ArrayList();
  boolean record = false;
  int i = 1;
  if(true){
    clavier();
    keyPressed();
    start = stop;
    println("key" +i+"'" +key+"'");
    i = i+1;
    delay(1000);
    if ( record == true ){
      stop = second();
      Integer[] st = {start, stop};
      melodie.add(key);
      rythm.add(st);
    }
  }  
  return melodie;
}

void replay(ArrayList<Character> melodie, ArrayList<int[]> rythm){
  for (int i = 0; i < melodie.size() ; i++ ){
    playNote(melodie.get(i));
    delay(rythm.get(i)[1] - rythm.get(i)[0]);
  }
  
}



void playNote(char key){
  switch(key){
        case 'a': //Si 'a' est appuyé, joue Do2 etc...
        C2.play();
        C2.rewind();
        break;
        case 'z':
        D2.play();
        D2.rewind();
        break;
        case 'e':
        E2.play();
        E2.rewind();
        break;
        case 'r':
        F2.play();
        F2.rewind();
        break;
        case 't':
        G2.play();
        G2.rewind();
        break;
        case 'y':
        A2.play();
        A2.rewind();
        break;
        case 'u':
        B2.play();
        B2.rewind();
        break;
        case 'é':
        Db2.play();
        Db2.rewind();
        break;
        case '"':
        Eb2.play();
        Eb2.rewind();
        break;
        case '(':
        Gb2.play();
        Gb2.rewind();
        break;
        case '-':
        Ab2.play();
        Ab2.rewind();
        break;
        case 'è':
        Bb2.play();
        Bb2.rewind();
        break;
        case 'i':
        C3.play();
        C3.rewind();
        break;
        case 'o':
        D3.play();
        D3.rewind();
        break;
        case 'p':
        E3.play();
        E3.rewind();
        break;
        case '<':
        F3.play();
        F3.rewind();
        break;
        case 'w':
        G3.play();
        G3.rewind();
        break;
        case 'x':
        A3.play();
        A3.rewind();
        break;
        case 'c':
        B3.play();
        B3.rewind();
        break;
        case 'ç':
        Db3.play();
        Db3.rewind();
        break;
        case 'à':
        Eb3.play();
        Eb3.rewind();
        break;
        case 'q':
        Gb3.play();
        Gb3.rewind();
        break;
        case 's':
        Ab3.play();
        Ab3.rewind();
        break;
        case 'd':
        Bb3.play();
        Bb3.rewind();
        break;
        case 'v':
        C4.play();
        C4.rewind();
        break;
        case 'b':
        D4.play();
        D4.rewind();
        break;
        case 'n':
        E4.play();
        E4.rewind();
        break;
        case ',':
        F4.play();
        F4.rewind();
        break;
        case ';':
        G4.play();
        G4.rewind();
        break;
        case ':':
        A4.play();
        A4.rewind();
        break;
        case '!':
        B4.play();
        B4.rewind();
        break;
        case 'g':
        Db4.play();
        Db4.rewind();
        break;
        case 'h':
        Eb4.play();
        Eb4.rewind();
        break;
        case 'k':
        Gb4.play();
        Gb4.rewind();
        break;
        case 'l':
        Ab4.play();
        Ab4.rewind();
        break;
        case 'm':
        Bb4.play();
        Bb4.rewind();
        break;
    }  
}

void clavier(){
  for(int i = 0; i<3 ; ++i){ // Dessine 3 Octaves
        for (int j = 0; j < 7; ++j) {
        // Si touche appuyée, allume cette touche sur le piano
            if (touchesB[i][j]) { //Dessine touches blanches
              affichagenoteblanche(i, j);
              fill(0, 0, 255);
              noStroke(); // Enlève les bordures
              rect(96+55*j+7*55*i, 400, 53, 250,5);
          } if (! touchesB[i][j]) {
              fill(255,255,255);
              noStroke();
              rect(96+55*j+7*55*i, 400, 53, 250,5);
          }
      }
      for (int j = 0; j < 5; ++j) { //Dessine touches noires
          if (touchesN[i][j]) {
              affichagenotenoire(i, j);
              fill(0, 255, 0);
              stroke(0);
          } else {
              fill(0, 0, 0);
              stroke(0);
          }
          if ( j<2){
              rect(100+38+55*j+7*55*i, 400, 33, 150,5);
          } else {
              rect(100+92+55*j+7*55*i,400,33,150,5);
        
          }  
      }
   }
}

// Dessine et affiche la note de musique blanche correspondante
void affichagenoteblanche(int i, int j) { // A ajouter un argument de position
  switch(j) {
  case 0: // il s'agit d'un do on cherche donc l'octave correspondante.
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);// lignes supplémentaires
      line(655, 220, 685, 220);
      line(655, 240, 685, 240);
      line(655, 260, 685, 260);
      fill(0, 0, 0, 255);
      ellipse(670, 270, 20, 20);// note en elle-même
      textSize(28);
      fill(0, 0, 255);
      text("do", 550, 280);
    } else {
      if (i==1) {
        stroke(0);
        line(655, 200, 685, 200);
        fill(0, 0, 0, 255);
        ellipse(670, 200, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("do", 700, 210);
      } else {
        fill(0, 0, 0, 255);
        ellipse(670, 130, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("do", 550, 140);
      }
    }
    break;
  case 1:
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      line(655, 220, 685, 220);
      line(655, 240, 685, 240);
      line(655, 260, 685, 260);
      fill(0, 0, 0, 255);
      ellipse(670, 260, 20, 20);
      textSize(28);
      fill(0, 0, 255);
      text("ré", 700, 270);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 190, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("ré", 550, 200);
      } else {
        fill(0, 0, 0, 255);
        ellipse(670, 120, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("ré", 700, 130);
      }
    }
    break;
  case 2:
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      line(655, 220, 685, 220);
      line(655, 240, 685, 240);
      fill(0, 0, 0, 255);
      ellipse(670, 250, 20, 20);
      textSize(28);
      fill(0, 0, 255);
      text("mi", 550, 260);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 180, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("mi", 700, 190);
      } else {
        fill(0, 0, 0, 255);
        ellipse(670, 110, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("mi", 550, 120);
      }
    }
    break;
  case 3:
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      line(655, 220, 685, 220);
      line(655, 240, 685, 240);
      fill(0, 0, 0, 255);
      ellipse(670, 240, 20, 20);
      textSize(28);
      fill(0, 0, 255);
      text("fa", 700, 250);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 170, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("fa", 550, 180);
      } else {
        fill(0, 0, 0, 255);
        ellipse(670, 100, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("fa", 700, 110);
      }
    }
    break;
  case 4:
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      line(655, 220, 685, 220);
      fill(0, 0, 0, 255);
      ellipse(670, 230, 20, 20);
      textSize(28);
      fill(0, 0, 255);
      text("sol", 550, 240);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 160, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("sol", 700, 170);
      } else {
        fill(0, 0, 0, 255);
        ellipse(670, 90, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("sol", 550, 100);
      }
    }
    break;
  case 5:
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      line(655, 220, 685, 220);
      fill(0, 0, 0, 255);
      ellipse(670, 220, 20, 20);
      textSize(28);
      fill(0, 0, 255);
      text("la", 700, 230);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 150, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("la", 550, 160);
      } else {
        stroke(0);
        line(655, 80, 685, 80);
        fill(0, 0, 0, 255);
        ellipse(670, 80, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("la", 700, 90);
      }
    }
    break;
  case 6:
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      fill(0, 0, 0, 255);
      ellipse(670, 210, 20, 20);
      textSize(28);
      fill(0, 0, 255);
      text("si", 550, 220);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 140, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("si", 700, 150);
      } else {
        stroke(0);
        line(655, 80, 685, 80);
        fill(0, 0, 0, 255);
        ellipse(670, 70, 20, 20);
        textSize(28);
        fill(0, 0, 255);
        text("si", 550, 80);
      }
    }
    break;
  }
}

// Dessine et affiche la note de musique noire correspondante
void affichagenotenoire(int i, int j) { // A ajouter un argument de position
  switch(j) {
  case 0: // il s'agit d'un ré bémole on cherche donc l'octave correspondante.
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      line(655, 220, 685, 220);
      line(655, 240, 685, 240);
      line(655, 260, 685, 260);
      fill(0, 0, 0, 255);
      ellipse(670, 260, 20, 20); 
      textSize(12);
      stroke(0);
      text("b", 655, 255); // "b" du bémol
      textSize(28);
      fill(0, 255, 0);
      text("ré b", 750, 270);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 190, 20, 20);
        textSize(12);
        stroke(0);
        text("b", 655, 185);
        textSize(28);
        fill(0, 255, 0);
        text("ré b", 580, 200);
      } else {
        fill(0, 0, 0, 255);
        ellipse(670, 120, 20, 20);       
        textSize(12);
        stroke(0);
        text("b", 655, 115);
        textSize(28);
        fill(0, 255, 0);
        text("ré b", 750, 130);
      }
    }
    break;
  case 1:
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      line(655, 220, 685, 220);
      line(655, 240, 685, 240);
      fill(0, 0, 0, 255);
      ellipse(670, 250, 20, 20);
      textSize(12);
      stroke(0);
      text("b", 655, 245);
      textSize(28);
      fill(0, 255, 0);
      text("mi b", 580, 260);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 180, 20, 20);
        textSize(12);
        stroke(0);
        text("b", 655, 175);
        textSize(28);
        fill(0, 255, 0);
        text("mi b", 750, 190);
      } else {
        fill(0, 0, 0, 255);
        ellipse(670, 110, 20, 20);
        textSize(12);
        stroke(0);
        text("b", 655, 105);
        textSize(28);
        fill(0, 255, 0);
        text("mi b", 580, 120);
      }
    }
    break;
  case 2:
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      line(655, 220, 685, 220);
      fill(0, 0, 0, 255);
      ellipse(670, 230, 20, 20);
      textSize(12);
      stroke(0);
      text("b", 655, 225);
      textSize(28);
      fill(0, 255, 0);
      text("sol b", 580, 240);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 160, 20, 20);
        textSize(12);
        stroke(0);
        text("b", 655, 155);
        textSize(28);
        fill(0, 255, 0);
        text("sol b", 750, 170);
      } else {
        fill(0, 0, 0, 255);
        ellipse(670, 90, 20, 20);
        textSize(12);
        stroke(0);
        text("b", 655, 85);
        textSize(28);
        fill(0, 255, 0);
        text("sol b", 580, 100);
      }
    }
    break;
  case 3:
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      line(655, 220, 685, 220);
      fill(0, 0, 0, 255);
      ellipse(670, 220, 20, 20);
      textSize(12);
      stroke(0);
      text("b", 655, 215);
      textSize(28);
      fill(0, 255, 0);
      text("la b", 750, 230);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 150, 20, 20);
        textSize(12);
        stroke(0);
        text("b", 655, 145);
        textSize(28);
        fill(0, 255, 0);
        text("la b", 580, 160);
      } else {
        stroke(0);
        line(655, 80, 685, 80);
        fill(0, 0, 0, 255);
        ellipse(670, 80, 20, 20);
        textSize(12);
        stroke(0);
        text("b", 655, 75);
        textSize(28);
        fill(0, 255, 0);
        text("la b", 750, 90);
      }
    }
    break;
  case 4:
    if (i==0) {
      stroke(0);
      line(655, 200, 685, 200);
      fill(0, 0, 0, 255);
      ellipse(670, 210, 20, 20);
      textSize(12);
      stroke(0);
      text("b", 655, 205);
      textSize(28);
      fill(0, 255, 0);
      text("si b", 580, 220);
    } else {
      if (i==1) {
        fill(0, 0, 0, 255);
        ellipse(670, 140, 20, 20);
        textSize(12);
        stroke(0);
        text("b", 655, 135);
        textSize(28);
        fill(0, 255, 0);
        text("si b", 750, 150);
      } else {
        stroke(0);
        line(655, 80, 685, 80);
        fill(0, 0, 0, 255);
        ellipse(670, 70, 20, 20);
        textSize(12);
        stroke(0);
        text("b", 655, 75);
        textSize(28);
        fill(0, 255, 0);
        text("si b", 580, 80);
      }
    }
    break;
  }
}

void peripherique() { //permet de connecter un clavier portable à l'appareil
}

void accompagnement() { //Si l'utilisateur décide d'ajouter un accompagnement, des notes sont jouées automatiquement lorsque l'utilisateur joue
//renvoie une série de notes en fonction des notes jouées pas l'utilisateur
}

class Apprentissage{
  void illuminationTouches(){//illumine les touches à appuyer
  }
}

class Jeu {
  void mode(){ //mode Duo ou Solo
  }
  
  int score(){ //affichage du score
    return 0;
  }
}
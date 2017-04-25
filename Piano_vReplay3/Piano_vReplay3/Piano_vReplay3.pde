// Groupe : Notebaert Dorian, Neil Levin, Laetitia Bouchet, Jing Ye
// Tutrice : Elisabeth Brunet

import ddf.minim.*;
import ddf.minim.ugens.*;
import javax.sound.midi.*;
import beads.*;
import java.util.*;




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
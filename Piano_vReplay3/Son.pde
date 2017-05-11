import ddf.minim.*;
import ddf.minim.ugens.*;
import java.util.*;


class Son {
  
  
  Note note;
  long start,stop;
  
  Son(Note not, long start, long stop){
    this.note=not;
    this.start=start;
    this.stop=stop;
  }
  
  ArrayList record(Note note){ // A coder
  
  int start = 0, stop = millis();
  ArrayList<Character> melodie = new ArrayList();
  ArrayList<Integer[]> rythm = new ArrayList();
  boolean record = false;
  if(true){
    clavier();
    keyPressed();
    start = stop;
    if ( record == true ){
      stop = millis();
      Integer[] st = {start, stop};
      melodie.add(note);
      rythm.add(st);
    }
  }  
  return melodie;
}


void replay(ArrayList<Note> melodie, ArrayList<int[]> rythm){
  for (int i = 0; i < melodie.size() ; i++ ){
    playNote(melodie.get(i));
    delay(rythm.get(i)[1] - rythm.get(i)[0]);
  }
  
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}

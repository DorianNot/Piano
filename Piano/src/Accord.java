import java.lang.reflect.Type;
import java.util.ArrayList;

/**
 * Created by ebrunet on 30/04/17.
 */
public class Accord {

    Note note;
    //Accompagnement accompagnement;

    int start;
    int stop;

    public Accord(){
            //notes = new ArrayList<>();
            start = 0;
            stop = 0;
      }

    public void ajouteNote(Note n){
        //notes.add(n);
    }

    public void resetAccord(){
        //notes.clear();
        start = 0;
        stop = 0;
    }
}

import java.util.ArrayList;

/**
 * Created by ebrunet on 30/04/17.
 */
public class Partition {
    ArrayList<Accord> partition;

    Partition(){
        partition = new ArrayList<Accord>();
    }

    public void ajouteAccord(Accord a){
        partition.add(a);
    }

    public void replay(){

    }

}

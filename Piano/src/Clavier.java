import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;

/**
 * Created by ebrunet on 27/04/17.
 */
public class Clavier extends JPanel {
    private ToucheClavier [] clavier;

    Clavier() {
        //clavier = new ToucheClavier[36];
        clavier = new ToucheClavier[2];
        clavier[0] = new ToucheClavier(ToucheClavier.TypeToucheClavier.BlancheGauche,
                0, 0, 'a', Note.doGrave);

        /*
        ActionPlaySon doGraveActionPlay = new ActionPlaySon(Note.doGrave, "Octave1/Do2.wav");
        this.registerKeyboardAction(doGraveActionPlay,
                                    //KeyStroke.getKeyStroke(KeyEvent.VK_A, 0, false),
                                    KeyStroke.getKeyStroke('a'),
                                    JComponent.WHEN_IN_FOCUSED_WINDOW);

        this.registerKeyboardAction(doGraveActionPlay,
                                    KeyStroke.getKeyStroke(KeyEvent.VK_A, 0, true),
                                    JComponent.WHEN_IN_FOCUSED_WINDOW);

        */
        clavier[1] = new ToucheClavier(ToucheClavier.TypeToucheClavier.BlancheGauche,
                clavier[0].largeur(), 0, 'z', Note.reGrave);
        // TODO : initialisation des autres touches
    }

    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;
        for (ToucheClavier t : clavier) {
            //System.out.println("Affiche touche");
            t.afficheTouche(g2d);
        }
    }

    ToucheClavier getTouche(char c){
        for (ToucheClavier t: clavier){
            if(t.getEvtKeyBoard() == c)
                return t;
        }
        return null; // TODO : lever une exception
    }
}

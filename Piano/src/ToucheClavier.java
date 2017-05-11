import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyListener;
import java.awt.geom.GeneralPath;

/**
 * Created by ebrunet on 26/04/17.
 */
public class ToucheClavier {
    public enum TypeToucheClavier {BlancheGauche, BlancheMilieu, BlancheDroite, Noire};
    public enum EtatTouche {Relachee, Appuyee};
    private final static int blancheGaucheOffsetX[] = {0, 20, 20, 40, 40, 0};
    private final static int blancheGaucheOffsetY[] = {0, 0, 50, 50, 100, 100};
    // TODO : revoir les proportions des dimensions de la touche et faire les autres

    TypeToucheClavier type;
    EtatTouche etat;
    Note note;
    int coordX;
    int coordY;
    int[] offsetX;
    int[] offsetY;
    char evtKeyBoard;


    public ToucheClavier(TypeToucheClavier type, int x, int y, char evt, Note n) {
        this.type = type;
        etat = EtatTouche.Relachee;

        this.note = n;

        this.coordX = x;
        this.coordY = y;
        if (type == TypeToucheClavier.BlancheGauche) {
            offsetX = new int[blancheGaucheOffsetX.length];
            offsetY = new int[blancheGaucheOffsetX.length];

            for (int i = 0; i < offsetX.length; i++) {
                offsetX[i] = coordX + blancheGaucheOffsetX[i];
                offsetY[i] = coordY + blancheGaucheOffsetY[i];
            }
        }
        evtKeyBoard = evt;
    }

    public void afficheTouche(Graphics2D g2d) {
        if (type == TypeToucheClavier.BlancheGauche || type == TypeToucheClavier.BlancheMilieu || type == TypeToucheClavier.BlancheDroite) {
            if (etat == EtatTouche.Relachee) {
                g2d.setColor(Color.white);
            } else {
                g2d.setColor(Color.YELLOW);
            }
        } else {
            g2d.setColor(Color.black);
        }
        g2d.fillPolygon(offsetX, offsetY, offsetX.length);
    }

    public int largeur (){
        int max = 0;
        for (int x : offsetX)
            if (x > max) max = x;
        return max;
    }

    public int hauteur (){
        int max = 0;
        for (int y : offsetY)
            if (y > max) max = y;
        return max;
    }

    public Note getNote(){
        return note;
    }

    public char getEvtKeyBoard(){
        return evtKeyBoard;
    }

    public void switchEtat(){
        if(etat == EtatTouche.Relachee)
            etat = EtatTouche.Appuyee;
        else
            etat = EtatTouche.Relachee;
    }
}

import javax.swing.*;
import java.awt.*;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

class Piano extends JFrame {
  private JPanel portee;
  private Sons sons;
  private Clavier clavier;
  private JMenu menu; // pour le replay, l'enregistrement, le chargement

  private Partition partition;
  private Accord accordCourant;

  public Piano() {
    // initialisation du panel de la portee
    sons = new Sons();
    clavier = new Clavier();

    setupFenetrePrincipale();
    this.setVisible(true);

    partition = new Partition();
  }

  private void setupFenetrePrincipale() {
    this.setTitle("Piano hero");
    this.setSize(1346, 500);
    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    this.setLayout(new GridLayout(2, 1));

    // ajouter le panel de la partition
    this.getContentPane().add(clavier);

    this.ajouteKeyListener();

    this.setFocusable(true);
    this.requestFocusInWindow();
  }


  private void ajouteKeyListener() {
    this.addKeyListener(new KeyListener() {
      private boolean playing = false;

      @Override
      public void keyTyped(KeyEvent evt) {
        /*
        char c;

        // prise du timer de début de note

        c = evt.getKeyChar();
        System.out.println("keyTyped ??" + c);

        ToucheClavier t = clavier.getTouche(c);
        if (t.etat == ToucheClavier.EtatTouche.Relachee) {
          System.out.println("keyTyped " + c + "etat touche avant " + t.etat);
          t.switchEtat();
          clavier.repaint(); // marquer la touche comme appuyée pour maj de la couleur
          System.out.println("keyTyped " + c + "etat touche apres " + t.etat);
          sons.play(t.getNote().getValue());
          // affichage dans la partition
          // enregistrement dans l'accord courant de la mélodie
        }
        System.out.println("<--keyTyped");
        */
      }

      @Override
      public void keyPressed(KeyEvent evt) {
        char c;

        // prise du timer de début de note

        c = evt.getKeyChar();
        System.out.println("keyTyped ??" + c);

        ToucheClavier t = clavier.getTouche(c);
        if (t.etat == ToucheClavier.EtatTouche.Relachee) {
          System.out.println("keyTyped " + c + "etat touche avant " + t.etat);
          t.switchEtat();
          clavier.repaint(); // marquer la touche comme appuyée pour maj de la couleur
          System.out.println("keyTyped " + c + "etat touche apres " + t.etat);
          sons.play(t.getNote().getValue());
          // affichage dans la partition
          // enregistrement dans l'accord courant de la mélodie
        }
        System.out.println("<--keyTyped");
      }

      @Override
      public void keyReleased(KeyEvent keyEvent) {
        char c;

        // prise du timer de fin de note

        c = keyEvent.getKeyChar();


        ToucheClavier t = clavier.getTouche(c);
        //if(keyEvent.isActionKey() == true &&  t.etat == ToucheClavier.EtatTouche.Appuyee) {
        System.out.println("keyReleased ??" + c + "etat touche " + t.etat);

        if (t.etat == ToucheClavier.EtatTouche.Appuyee) {
          System.out.println("keyReleased " + c + "etat touche avant " + t.etat);
          sons.stop(t.getNote().getValue());
          t.switchEtat();
          clavier.repaint();// marque la touche comme relachée pour maj de la couleur
          System.out.println("keyReleased " + c + "etat touche apres " + t.etat);
        }
        System.out.println("<--keyReleased");
      }
    });
  }
}

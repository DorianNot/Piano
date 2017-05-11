import sun.audio.AudioPlayer;
import sun.audio.AudioStream;
import sun.audio.ContinuousAudioDataStream;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * Created by ebrunet on 04/05/17.
 */
public class ActionPlaySon extends AbstractAction {
    Note n;
    String wavFile;
    InputStream player;
    AudioStream as;
    ContinuousAudioDataStream loop;
    boolean playing;

    public ActionPlaySon(Note n, String wavFile) {
        try {
            this.n = n;
            this.wavFile = wavFile;
            player = new FileInputStream(wavFile);
            as = new AudioStream(player);
            loop = new ContinuousAudioDataStream(as.getData());
            playing = false;
        } catch (IOException e) {
            System.err.println("Erreur de chargement de fichier wav.");
        }
    }

    public void actionPerformed(ActionEvent e){
        if(playing == false) {
            System.out.println("Dans ActionPlaySon, on joue en continu la note " + n);
            AudioPlayer.player.start(loop);
            playing = true;
        }else{
            System.out.println("Dans ActionPlaySon, on arrete de jouer en continu la note " + n);
            AudioPlayer.player.stop(loop);
            playing = false;
        }
    }
}

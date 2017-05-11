
//import ddf.minim.*;
//import ddf.minim.ugens.*;
import sun.audio.AudioPlayer;
import sun.audio.AudioStream;
import sun.audio.ContinuousAudioDataStream;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

public class Sons {
  //private AudioPlayer[] players;
  //private Minim minim;
    InputStream players;
    AudioStream as;
    ContinuousAudioDataStream loop;

  public Sons(){
      try {
          players = new FileInputStream("Octave1/Do2.wav");
          as = new AudioStream(players);
          loop = new ContinuousAudioDataStream(as.getData());
      }catch(IOException e){
          System.err.println("Erreur de chargement de fichier wav.");
      }
        /*
        minim=new Minim(this);
        players = new AudioPlayer[36];

        // Fichiers Audio par notes
        players[0] = minim.loadFile("Octave1/Do2.wav", 512);
        players[1]= minim.loadFile("ReB2.wav", 512);
	    players[2] = minim.loadFile("Re2.wav", 512);
	    players[3] = minim.loadFile("MiB2.wav", 512);
 	    players[4] = minim.loadFile("Mi2.wav", 512);
        players[5] = minim.loadFile("Fa2.wav", 512);
        players[6] = minim.loadFile("SolB2.wav", 512);
        players[7] = minim.loadFile("Sol2.wav", 512);
        players[8] = minim.loadFile("LaB2.wav", 512);
        players[9] = minim.loadFile("La2.wav", 512);
        players[10] = minim.loadFile("SiB2.wav", 512);
        players[11] = minim.loadFile("Si2.wav", 512);

        players[12] = minim.loadFile("Do3.wav", 512);
        players[13] = minim.loadFile("ReB3.wav", 512);
        players[14] = minim.loadFile("Re3.wav", 512);
	    players[15] = minim.loadFile("MiB3.wav", 512);
 	    players[16] = minim.loadFile("Mi3.wav", 512);
        players[17] = minim.loadFile("Fa3.wav", 512);
        players[18] = minim.loadFile("SolB3.wav", 512);
        players[19] = minim.loadFile("Sol3.wav", 512);
        players[20] = minim.loadFile("LaB3.wav", 512);
        players[21] = minim.loadFile("La3.wav", 512);
        players[22] = minim.loadFile("SiB3.wav", 512);
        players[23] = minim.loadFile("Si3.wav", 512);

	    players[24] = minim.loadFile("Do4.wav", 512);
        players[25] = minim.loadFile("ReB4.wav", 512);
	    players[26] = minim.loadFile("Re4.wav", 512);
	    players[27] = minim.loadFile("MiB4.wav", 512);
 	    players[28] = minim.loadFile("Mi4.wav", 512);
        players[29] = minim.loadFile("Fa4.wav", 512);
        players[30] = minim.loadFile("SolB4.wav", 512);
        players[31] = minim.loadFile("Sol4.wav", 512);
        players[32] = minim.loadFile("LaB4.wav", 512);
        players[33] = minim.loadFile("La4.wav", 512);
        players[34] = minim.loadFile("SiB4.wav", 512);
        players[35] = minim.loadFile("Si4.wav", 512);
        */
  }


    public void playOneTime(int note){
        System.out.println("Dans sons, on joue la note " + note ); //+ " - " + players[note]);
        //players[note].play();
        AudioPlayer.player.start(as);
    }

    public void play(int note){
        System.out.println("Dans sons, on joue en continu la note " + note ); //+ " - " + players[note]);
        AudioPlayer.player.start(loop);
    }

    public void stop(int note){
        System.out.println("Dans sons, on arrete de jouer en continu la note " + note ); //+ " - " + players[note]);
        AudioPlayer.player.stop(loop);
    }
}



class Note {
  import ddf.minim.*;
  import ddf.minim.ugens.*;
  
  
  Minim            minim;
  AudioPlayer      C2,Db2,D2,Eb2,E2,F2,Gb2,G2,Ab2,A2,Bb2,B2;  //Octave 1
  AudioPlayer      C3,Db3,D3,Eb3,E3,F3,Gb3,G3,Ab3,A3,Bb3,B3;  //Octave 2
  AudioPlayer      C4,Db4,D4,Eb4,E4,F4,Gb4,G4,Ab4,A4,Bb4,B4;  //Octave 3
  
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
  
}
//PROTOTIPO PARA JUEGO DE RITMO VAPORWAVE
//Alek Aune && Nicolas Gomez

//se demora al rededor de 20 - 30 segundos cargando


//importar plugin de sonido
import processing.sound.*;
import processing.video.*;

//definir variables de estados
int intro = 1;
int cut = 2;
int n1 = 3;
int goodEnding = 4;
int badEnding = 5;
int fin = 6;
int state = intro;

int startTime;


//definir variables de imagenes
PImage[] alek = new PImage[8];
PImage[] enemigo = new PImage[8];
PImage[] win = new PImage[8];
PImage[] main = new PImage[8]; 
PImage L5, L4, L3, L2, L1, L0, B0, NL, ND, C;


//definir archivos de audio
SoundFile musik, again, menu, yay, hit, die, jump;

//importar el video
Movie cutscene;

//definir y traer otras clases
player p;
backG bk;

//cosas que van en arrays
beat[] b;
piso[] fs;


//funcion que reinicia el juego
void resetGame()
{

  //jugador
  p = new player(100, 290);
  
  //fondo
  bk = new backG();
  
  //enemigo
  b = new beat[59];
  
  //piso
  fs = new piso[112];

  //llamar a la creacion de los enemigos
  b[0] = new beat(3840+120, 300);
  b[1] = new beat(4020+120, 300);
  b[2] = new beat(4320+120, 300);
  b[3] = new beat(4500+120, 300);
  b[4] = new beat(4680+120, 300);
  b[5] = new beat(4800+120, 300);
  b[6] = new beat(4980+120, 300);
  b[7] = new beat(5280+120, 300);
  b[8] = new beat(5460+120, 300);
  b[9] = new beat(5760+120, 300);
  b[10] = new beat(6000+120, 300);
  b[11] = new beat(6420+120, 300);
  b[12] = new beat(6720+120, 300);
  b[13] = new beat(6900+120, 300);
  b[14] = new beat(7020+120, 300);
  b[15] = new beat(7200+120, 300);
  b[16] = new beat(7380+120, 300);
  b[17] = new beat(7560+120, 300);
  b[18] = new beat(7680+120, 300);
  b[19] = new beat(7860+120, 300);
  b[20] = new beat(8160+120, 300);
  b[21] = new beat(8340+120, 300);
  b[22] = new beat(8520+120, 300);
  b[23] = new beat(8640+120, 300);
  b[24] = new beat(8820+120, 300);
  b[25] = new beat(9120+120, 300);
  b[26] = new beat(9300+120, 300);
  b[27] = new beat(9600+120, 300);
  b[28] = new beat(9780+120, 300);
  b[29] = new beat(10080+120, 300);
  b[30] = new beat(10260+120, 300);
  b[31] = new beat(10680+120, 300);
  b[32] = new beat(10800+120, 300);
  b[33] = new beat(10980+120, 300);
  b[34] = new beat(11160+120, 300);
  b[35] = new beat(11280+120, 300);
  b[36] = new beat(11640+120, 300);
  b[37] = new beat(11760+120, 300);
  b[38] = new beat(12048+120, 300);
  b[39] = new beat(12180+120, 300);
  b[40] = new beat(12528+120, 300);
  b[41] = new beat(12660+120, 300);
  b[42] = new beat(13008+120, 300);
  b[43] = new beat(13140+120, 300);
  b[44] = new beat(13488+120, 300);
  b[45] = new beat(13584+120, 300);
  b[46] = new beat(13680+120, 300);
  b[47] = new beat(13800+120, 300);
  b[48] = new beat(13968+120, 300);
  b[49] = new beat(14136+120, 300);
  b[50] = new beat(14220+120, 300);
  b[51] = new beat(14448+120, 300);
  b[52] = new beat(14640+120, 300);
  b[53] = new beat(14928+120, 300);
  b[54] = new beat(15120+120, 300);
  b[55] = new beat(15360+120, 300);
  b[56] = new beat(16320+120, 300);
  b[57] = new beat(17088+120, 300);
  b[58] = new beat(17280+120, 300);

  //crear un indice para los pisos
  int indx = 0;
  //llamar creacion de pisos  
  for (int i=0; i<4; i++)//i = y
  {
    for (int d=0; d<28; d++)//d = x
    {
      fs[indx] = new piso(d, i);
      indx++;
    }
  }
}


//definir el espacio de trabajo
void setup() 
{
  frameRate(24);
  size(800, 400);

  //cargar pelicula
  cutscene = new Movie(this, "cutscene.mov");
  
  //cargar los audios
  musik = new SoundFile(this, "song.wav");
  again = new SoundFile(this, "try_again.mp3");
  menu = new SoundFile(this, "menu.mp3");
  yay = new SoundFile(this, "win.wav");
  hit = new SoundFile(this, "hit.wav");
  die = new SoundFile(this, "death.wav");
  jump = new SoundFile(this, "jump.mp3");

  //quitar el anti aliasing
  noSmooth();

  //cargar las imagenes
  alek[0] = loadImage("sprite_1.png");
  alek[1] = loadImage("sprite_2.png");
  alek[2] = loadImage("sprite_3.png");
  alek[3] = loadImage("sprite_4.png");
  alek[4] = loadImage("sprite_5.png");
  alek[5] = loadImage("sprite_6.png");
  alek[6] = loadImage("sprite_7.png");
  alek[7] = loadImage("sprite_8.png");
  
  //cargar imagenes del enemigo
  enemigo[0] = loadImage("enemy0.png");
  enemigo[1] = loadImage("enemy1.png");
  enemigo[2] = loadImage("enemy2.png");
  enemigo[3] = loadImage("enemy3.png");
  enemigo[4] = loadImage("enemy4.png");
  enemigo[5] = loadImage("enemy5.png");
  enemigo[6] = loadImage("enemy6.png");
  enemigo[7] = loadImage("enemy7.png");
  
  //cargar animación de ganar
  win[0] = loadImage("sprite_7.png");
  win[1] = loadImage("sprite_8.png");
  win[2] = loadImage("win0.png");
  win[3] = loadImage("win1.png");
  win[4] = loadImage("win2.png");
  win[5] = loadImage("win3.png");
  win[6] = loadImage("win4.png");
  win[7] = loadImage("win5.png");
  
  //cargar animacion d emenu principal
  main[0] = loadImage("main_nos.png");
  main[1] = loadImage("main_nos.png");
  main[2] = loadImage("main_nos.png");
  main[3] = loadImage("main_nos.png");
  main[4] = loadImage("main_s.png");
  main[5] = loadImage("main_s.png");
  main[6] = loadImage("main_s.png");
  main[7] = loadImage("main_s.png");
  
  //cargar imagenes de vida
  L5 = loadImage("life5.png");
  L4 = loadImage("life4.png");
  L3 = loadImage("life3.png");
  L2 = loadImage("life2.png");
  L1 = loadImage("life1.png");
  L0 = loadImage("life0.png");
  
  //cargar otras imagenes
  NL = loadImage("next_lvl.png");
  ND = loadImage("nib_ded.png");
  C = loadImage("complete.png");
  
  //cargar los fondos
  B0 = loadImage("mtbg.png");

  //definicion del texto
  textAlign(CENTER);
  textSize(14);
  
  menu.play();

  //llama a funcion que reinicia el juego al morir
  resetGame();
}


//lo que pasa en cada frame
void draw() 
{
  if (state == intro)
  {

    image(main[frameCount%8],0,0);
    
    //background(102, 205, 170);

    //fill(60);
    //text("PANTALLA DE INICIO", width/2, height/2);
    //text("[click para empezar]", width/2, (height/2)+100);
  }

  //CUTSCENE por poner

  else if (state == cut)
  {
    image(cutscene, 0, 0);
    fill(250);
    text("[ENTER] to skip", 70, 20);
  }

  //PRIMER NIVEL (unico nivel?)

  else if (state == n1)
  {


    //colorear el fondo cada vez
    background(44, 53, 82);
    bk.show();
    bk.move();

    for (piso Piso : fs)
    {
      Piso.show();
      Piso.move();
    }

    //mostrar la imagen

    //mostrar al jugador en pantalla
    p.show();
    p.move();
    
    

    //ESTO DEBERIA DEPENDER DE LOS FRAMES 
    for (beat Beat : b)
    {
      if (Beat.x <= 900 && Beat.x >= -100)
      {
        Beat.show();
      }
      Beat.move();

      if (dist(Beat.x, Beat.y, p.x, p.y) < 30 && Beat.doDamage == true)
      {
        hit.play();
        Beat.dealDamage();
        p.damage();
      }
    }
    
    //Contador de vidas, imagenes
    if (p.lives == 5)
    {
      image(L5, 100, 30);
    }else if (p.lives ==4)
    {
      image(L4, 100, 30);
    }else if (p.lives == 3)
    {
      image(L3, 100, 30);
    } else if (p.lives == 2)
    {
      image(L2, 100, 30);
    }else if (p.lives == 1)
    {
      image(L1, 100, 30);
    }
    
    
    if (musik.isPlaying()==false && p.lives > 0)
    {
      state = goodEnding;
      yay.play();
    }
  }
  
  //perder
  
  else if (state == badEnding) 
  {
    image(ND, 0, 0);
    image(L0, 100, 30);
    musik.stop();
  }
  
  //ganar
  
  else if (state == goodEnding)
  {
    image(C, 0, 0);
    p.win();
  }
  
  //final
  else if (state == fin)
  {
    image(NL, 0, 0);
  }
}

//cunado la cancion acaba y el jugador aun tiene vidas se caba


//eventos que pasan cuando se presiona un boton
void keyPressed()
{
  if (keyCode == ENTER && state == cut)
  {
    state = n1;
    musik.play();
    cutscene.stop();
  }
  
  if (keyCode == ENTER && state == badEnding)
  {
    state = intro;
    resetGame();
    menu.play();
  }
  
  if (keyCode == ' ' && state == goodEnding)
  {
    state = fin;
    again.play();
  }

  if (key == ' ' && state == intro)
  {
    state = cut;
    menu.stop();
    cutscene.play();
  }
  
  if (key == ' ' && p.y == 290 && state == n1)
  {
    jump.play();
    p.jump();
  }
  
  if (keyCode == ENTER && state == fin)
  {
    state = intro;
    resetGame();
    menu.play();
  }
}

void movieEvent(Movie m) {
  m.read();
}

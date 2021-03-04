class beat
{
  //variables del jugador
  float x, y, vx;
  color c;
  boolean doDamage=true;
  
  //variables publicas del jugador
  public beat(int x, int y)
  {
    this.x = x;
    this.y = y;
    //tiene que ser igual al bpm de la cancion (ajusta con el bombo)
    vx = -10;
    c = color(102,161,210);
    
  }
  
  //funcion de mostrarlo en la pantalla
  void show()
  {
    if (doDamage == true)
    {
      //noStroke();
      //fill(c);
      //rect(x, y, 30, 30);
      image(enemigo[frameCount%8], x, y, 40, 40);
    }
  }
  
  //funcion default (mueve o deja quieto)
  void move()
  {
   x += vx;
  }
  
  //cambio de color
  void dealDamage()
  {
    doDamage = false;
  }
  
}

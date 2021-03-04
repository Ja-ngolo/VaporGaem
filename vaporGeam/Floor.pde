//BACKGROUND ISOMETRICO, Ilusión de 3d

class piso
{
  //variables del piso
  float x, y, vx, sz;
  
  //variables publicas del jugador
  public piso(int x, int y)
  {
    this.x = x;
    this.y = y;
    //tiene que ser igual al bpm de la cancion (ajusta con el bombo)
    vx = -0.1;
    sz = 30;
    
  }
  
  //funcion de mostrarlo en la pantalla
  void show()
  {
    stroke(178,34,34);
    noFill();
    
    beginShape();
    vertex(x*sz, (y*sz)+280);
    vertex((x*sz)+sz, (y*sz)+280);
    vertex(x*sz, (y*sz)+sz+280);
    vertex((x*sz)-sz, (y*sz)+sz+280);
    endShape(CLOSE);
  }
  
  //funcion default (mueve o deja quieto)
  void move()
  {
   x += vx;
   
   //condicional para reaparecer al otro lado de la pantalla
   if (x <= -1)
   {
     x = 27;
   }
  }
}

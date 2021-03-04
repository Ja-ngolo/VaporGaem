//EL FONDO DE MONTAÑAS

class backG
{
  float x, y, v;
  
  public backG()
  {
    x = 0;
    y = -2;
    v = -1;
  }
  
  void show()
  {
    image(B0, x, y);
    image(B0, x+1212, y);
  }
  
  void move()
  {
    x += v;
    
    if (x < x-1212)
    {
      x = x + 1212;
    }
  }

}

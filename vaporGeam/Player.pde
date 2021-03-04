class player
{
  //variables del jugador
  float x, y, g, vy;
  int lives;
  
  //variables publicas del jugador
  public player(int x, int y)
  {
    this.x = x;
    this.y = y;
    g = 5.5;
    vy = 0;
    lives = 5;
    
  }
  
  //funcion de mostrarlo en la pantalla
  void show()
  {
    //noStroke();
    //fill(178,82,161);
    //rect(x, y, 100, 100);
    image(alek[frameCount%8], x, y, 60, 60);
  }
  
  //funcion default (mueve o deja quieto)
  void move()
  {
    y += vy;
    //siempre lo afecta la gravedad para que vuelva a caer
    vy += g;
    
    //evitar que salga de la pantalla
    if (y >= 290)
    {
      y = 290;
    }
    
  }
  
  //funcion de saltar (acelera en y)
  void jump()
  {
    vy = -30;
  }
  
  void damage() 
  {
    if (lives <= 1)
    {
      die.play();
      state = badEnding;
    }else
    {
      lives--;
    }
    
  }
  
  //de mover al centro y cambiar animación al ganar
  void win()
  {
    image(win[frameCount%8], x, y, 60, 60);
    
    if (x < 360)
    {
      x += 5;
    }
  
  }
  
}

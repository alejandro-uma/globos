class Globo
{
  float x, y, vx, vy;
  Globo (float _x, float _y)
  {
    x = _x;
    y = _y; 
    vx = random(-0.25, 0.25);
    vy = random(-2, -0.5);
  }

  void update()
  {
    y += vy;
    x += vx;
  }

  void dibujate()
  {
    fill(255, 80, 80); // Modificación: color rojo para los globos
    ellipse(x, y, 80, 100);
    // Nudo inferior del globo
    triangle(x, y + 50, x - 8, y + 60, x + 8, y + 60);
  }
}

ArrayList<Globo> globos;

void setup()
{
  size(640, 480);
  globos = new ArrayList<Globo>();  
}

void draw()
{
  background(0);
  for(int i = 0; i < globos.size(); i++)
  {
    globos.get(i).update();
    globos.get(i).dibujate();
  }
}

void mousePressed()
{
  globos.add(new Globo(mouseX, mouseY));
}

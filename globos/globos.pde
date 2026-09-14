class Globo
{
  float x, y, vx, vy;
  color col;
  
  Globo (float _x, float _y)
  {
    x = _x;
    y = _y; 
    vx = random(-0.25, 0.25);
    vy = random(-2, -0.5);
    col = color(random(50, 255), random(50, 255), random(50, 255)); // 2. Color aleatorio
  }

  void update()
  {
    y += vy;
    x += vx;
  }

  void dibujate()
  {
    fill(col); // 3. Usar el color propio
    ellipse(x, y, 80, 100);
    // Nudo inferior del globo
    triangle(x, y + 50, x - 8, y + 60, x + 8, y + 60);
    
    // Cuerda del globo
    stroke(200);
    line(x, y + 60, x, y + 110);
    noStroke();
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

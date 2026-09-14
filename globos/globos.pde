// 1. Variable global para la imagen del gato
PImage imgGato;

class Globo
{
  float x, y, vx, vy;
  color col;
  boolean esGato; // Bandera para saber si este globo lleva cara de gato
  
  Globo (float _x, float _y)
  {
    x = _x;
    y = _y; 
    vx = random(-0.25, 0.25);
    vy = random(-2, -0.5);
    col = color(random(50, 255), random(50, 255), random(50, 255));
    
    // Probabilidad alta (80%): random(1) devuelve entre 0.0 y 1.0
    esGato = random(1.0) < 0.8;
  }

  void update()
  {
    y += vy;
    x += vx;
  }

  void dibujate()
  {
    fill(col);
    ellipse(x, y, 80, 100);
    // Nudo inferior del globo
    triangle(x, y + 50, x - 8, y + 60, x + 8, y + 60);
    
    // Cuerda del globo
    stroke(200);
    line(x, y + 60, x, y + 110);
    noStroke();

    // Si tiene la cara de gato, se dibuja centrada sobre el globo
    if (esGato && imgGato != null)
    {
      imageMode(CENTER);
      image(imgGato, x, y, 60, 60);
      imageMode(CORNER); // Restaurar el modo por defecto de Processing
    }
  }
}

ArrayList<Globo> globos;

void setup()
{
  size(640, 480);
  globos = new ArrayList<Globo>();  
  
  // 2. Carga única en memoria (ajusta el nombre y extensión si difiere)
  imgGato = loadImage("gato.jpg");
}

void draw()
{
  background(0);
  for (int i = globos.size() - 1; i >= 0; i--)
  {
    Globo g = globos.get(i);
    g.update();
    g.dibujate();

    // Si desaparece por arriba, lo sacamos de la lista
    if (g.y < -120) {
      globos.remove(i);
    }
  }
}

void mousePressed()
{
  globos.add(new Globo(mouseX, mouseY));
}

class dotFrame extends Frame
{
  float t = 0;
  
  void draw()
  {
    // line color (off-white)
    stroke(220, 220, 220);
    noFill();
    // scatterplot border
    rect(u0, v0, w, h);
    // ellipse outline (aqua)
    stroke(0, 200, 120);
    // ellipse color (lavender)
    fill(240, 150, 200);
    // t has something to do with the position of the ellipses
    ellipse(u0 + t, v0 + t, 20, 20);
  
    t += 5;
    
    if( t > w ) 
      t = 0;
  }
}
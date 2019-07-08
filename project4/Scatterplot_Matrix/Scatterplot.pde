class Scatterplot extends Frame
{
  float minX, maxX;
  float minY, maxY;
  int idx0, idx1;
  int border = 40;
  boolean drawLabels = true;
  float spacer = 20;
  
  Scatterplot(Table data, int idx0, int idx1)
  {
    this.idx0 = idx0;
    this.idx1 = idx1;
     
    minX = min(data.getFloatColumn(idx0));
    maxX = max(data.getFloatColumn(idx0));
     
    minY = min(data.getFloatColumn(idx1));
    maxY = max(data.getFloatColumn(idx1));
  }
  
  void updateIndicies(int idx0, int idx1)
  {
    this.idx0 = idx0;
    this.idx1 = idx1;
     
    minX = min(table.getFloatColumn(idx0));
    maxX = max(table.getFloatColumn(idx0));
     
    minY = min(table.getFloatColumn(idx1));
    maxY = max(table.getFloatColumn(idx1));
  }
  
  // inherited from Scatterplot_Matrix tab
  void draw()
  {
    for (int i = 0; i < table.getRowCount(); i++)
    {
      TableRow r = table.getRow(i);
      
      float x = map(r.getFloat(idx0), minX, maxX, u0 + border + spacer, u0 + w - border - spacer);
      float y = map(r.getFloat(idx1), minY, maxY, v0 + h - border - spacer, v0 + border + spacer);
      
      stroke(0, 200, 120);
      fill(240, 150, 200);
      ellipse(x, y, 3, 3);
    }
    
    stroke(220, 220, 220);
    noFill();
    // scatterplot border
    rect(u0 + border, v0 + border, w - (2 * border), h - (2 * border));
    
    // big scatterplot border
    stroke(0, 200, 120);
    rect(bigPlotX, bigPlotY, bigPlotW, bigPlotH);
    
    if(drawLabels)
    {
      fill(220, 220, 220);
      text(table.getColumnTitle(idx0), u0 + (w / 2), v0 + h + (width * 0.003));
      pushMatrix();
      translate(u0 - (width * 0.001) , v0 + (h / 2));
      rotate(PI / 2);
      text(table.getColumnTitle(idx1), 0, 0);
      popMatrix();
    }
  }
}
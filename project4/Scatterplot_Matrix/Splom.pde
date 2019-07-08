class Splom extends Frame 
{  
  ArrayList<Scatterplot> plots = new ArrayList<Scatterplot>();
  int colCount;
  Table data;
  float border = 40;
  Scatterplot bsp;
   
  Splom(Table data, ArrayList<Integer> useColumns)
  {
    this.data = data;
    colCount = useColumns.size();
    
    bsp = new Scatterplot(table, useColumns.get(0), useColumns.get(1));
    
    for(int j = 0; j < colCount - 1; j++)
    {
       for(int i = j + 1; i < colCount; i++)
       {
         Scatterplot sp = new Scatterplot(table, useColumns.get(j), useColumns.get(i));
         plots.add(sp);
       }
    }
  }
  
  void setPosition(int u0, int v0, int w, int h)
  {
    super.setPosition(u0, v0, w, h);

    int curPlot = 0;
    
    for(int j = 0; j < colCount - 1; j++)
    {
       for(int i = j + 1; i < colCount; i++)
       {
         Scatterplot sp = plots.get(curPlot++);
         int su0 = (int)map(i, 1, colCount, u0 + border, u0 + w - border);
         int sv0 = (int)map(j, 0, colCount - 1, v0 + border, v0 + h - border);
         // changes size of scatterplot
         sp.setPosition(su0, sv0, (int)(w - (2 * border)) / (colCount - 1), (int)(h - (2 * border)) / (colCount - 1));
         sp.drawLabels = true;
         // spaces out scatterplots
         sp.border = 11;
       }
    }
    bsp.setPosition((int)(width * 0.01), (int)(height * 0.52), (int)(width * 0.38), (int)((height * 0.42) + (height * 0.05)));
  }
 
  void draw() 
  {
    for(Scatterplot s : plots)
      s.draw();
    stroke(0, 200, 120);
    fill(240, 150, 200);
    bsp.draw();
  }
   
  void mousePressed()
  {
    for(Scatterplot sp : plots)
    {
       if(sp.mouseInside())
       {
         // do something!!!
         println(sp.idx0 + " " + sp.idx1);
         bsp.updateIndicies(sp.idx0, sp.idx1);
       }  
    }
  }
}
void paraDrawTick(float x, float y1, float y2, int cNum)
{
  // saves all values of selected column in tickVals
  for (int i = 0; i < table.getRowCount(); i++)
    tickVals[i] = table.getFloat(i, cNum);
  
  // find min and max of the selected column
  min = min(tickVals);
  max = max(tickVals);
  
  // dividing value for y values
  float tickInc = (max - min) / 8;
  
  // dividing value for ticks
  float tickYPos = y1;
  float lineLength = y1 - y2;
  float tickSpace = lineLength / 9;
  
  pCVal1 = new float[table.getRowCount()];
  pCVal2 = new float[table.getRowCount()];
  pCVal3 = new float[table.getRowCount()];
  pCVal4 = new float[table.getRowCount()];
  
  pCX1Val = new float[table.getRowCount()];
  pCX2Val = new float[table.getRowCount()];
  pCX3Val = new float[table.getRowCount()];
  pCX4Val = new float[table.getRowCount()];
  
  pCY1Val = new float[table.getRowCount()];
  pCY2Val = new float[table.getRowCount()];
  pCY3Val = new float[table.getRowCount()];
  pCY4Val = new float[table.getRowCount()];
  
  // plot points on line
  for (int i = 0; i < table.getRowCount(); i++)
  {
    float xMap = map(i, 0, table.getRowCount(), x, x);
    if (cNum == 0)
      x1Storage[i] = xMap;
    else if (cNum == 1)
      x2Storage[i] = xMap;
    else if (cNum == 2)
      x3Storage[i] = xMap;
    else if (cNum == 3)
      x4Storage[i] = xMap;
    
    float yMap = map(tickVals[i], min, max, y1Pos, y2Pos + tickSpace);
    if (cNum == 0)
    {
      y1Storage[i] = yMap;
      tickVals1[i] = tickVals[i];
    }
    else if (cNum == 1)
    {
      y2Storage[i] = yMap;
      tickVals2[i] = tickVals[i];
    }
    else if (cNum == 2)
    {
      y3Storage[i] = yMap;
      tickVals3[i] = tickVals[i];
    }
    else if (cNum == 3)
    {
      y4Storage[i] = yMap;
      tickVals4[i] = tickVals[i];
    }
    
    stroke (255, 110, 0);
    
    if (cNum == 0)
      ellipse(x1Storage[i], y1Storage[i], width * 0.005, height * 0.005);
    else if (cNum == 1)
      ellipse(x2Storage[i], y2Storage[i], width * 0.005, height * 0.005);  
    else if(cNum == 2)
      ellipse(x3Storage[i], y3Storage[i], width * 0.005, height * 0.005);
    else if(cNum == 3)
      ellipse(x4Storage[i], y4Storage[i], width * 0.005, height * 0.005);
    
    if (fileName.equals("Test Scores.csv"))
    {
      strokeWeight(0.01);
      stroke(0, 200, 120);
    }
    else if (fileName.equals("Iris.csv"))
    {
      strokeWeight(0.01);
      if (table.getString(i, table.getColumnCount() - 1).equals("Iris-setosa"))
        stroke(0, 200, 120);
      else if (table.getString(i, table.getColumnCount() - 1).equals("Iris-versicolor"))
        stroke (70, 0, 220);
      else if (table.getString(i, table.getColumnCount() - 1).equals("Iris-virginica"))
        stroke (210, 0, 55);
    }
    
    pCVal1[i] = tickVals1[i];
    pCVal2[i] = tickVals2[i];
    pCVal3[i] = tickVals3[i];
    pCVal4[i] = tickVals4[i];
    if (keyCount2 == 0)
    {
      line(x1Storage[i], y1Storage[i], x2Storage[i], y2Storage[i]);
      line(x2Storage[i], y2Storage[i], x3Storage[i], y3Storage[i]);
      line(x3Storage[i], y3Storage[i], x4Storage[i], y4Storage[i]);
      
      pCX1Val[i] = x1Storage[i];
      pCX2Val[i] = x2Storage[i];
      pCX3Val[i] = x3Storage[i];
      pCX4Val[i] = x4Storage[i];
      
      pCY1Val[i] = y1Storage[i];
      pCY2Val[i] = y2Storage[i];
      pCY3Val[i] = y3Storage[i];
      pCY4Val[i] = y4Storage[i];
    }
    else if (keyCount2 == 1)
    {
      line(x2Storage[i], y2Storage[i], x1Storage[i], y1Storage[i]);
      line(x1Storage[i], y1Storage[i], x3Storage[i], y3Storage[i]);
      line(x3Storage[i], y3Storage[i], x4Storage[i], y4Storage[i]);
      
      pCX1Val[i] = x2Storage[i];
      pCX2Val[i] = x1Storage[i];
      pCX3Val[i] = x3Storage[i];
      pCX4Val[i] = x4Storage[i];
      
      pCY1Val[i] = y2Storage[i];
      pCY2Val[i] = y1Storage[i];
      pCY3Val[i] = y3Storage[i];
      pCY4Val[i] = y4Storage[i];
    }
    else if (keyCount2 == 2)
    {
      line(x3Storage[i], y3Storage[i], x2Storage[i], y2Storage[i]);
      line(x2Storage[i], y2Storage[i], x1Storage[i], y1Storage[i]);
      line(x1Storage[i], y1Storage[i], x4Storage[i], y4Storage[i]);
      
      pCX1Val[i] = x3Storage[i];
      pCX2Val[i] = x2Storage[i];
      pCX3Val[i] = x1Storage[i];
      pCX4Val[i] = x4Storage[i];
      
      pCY1Val[i] = y3Storage[i];
      pCY2Val[i] = y2Storage[i];
      pCY3Val[i] = y1Storage[i];
      pCY4Val[i] = y4Storage[i];
    }
    else if (keyCount2 == 3)
    {
      line(x4Storage[i], y4Storage[i], x2Storage[i], y2Storage[i]);
      line(x2Storage[i], y2Storage[i], x3Storage[i], y3Storage[i]);
      line(x3Storage[i], y3Storage[i], x1Storage[i], y1Storage[i]);
      
      pCX1Val[i] = x4Storage[i];
      pCX2Val[i] = x2Storage[i];
      pCX3Val[i] = x3Storage[i];
      pCX4Val[i] = x1Storage[i];
      
      pCY1Val[i] = y4Storage[i];
      pCY2Val[i] = y2Storage[i];
      pCY3Val[i] = y3Storage[i];
      pCY4Val[i] = y1Storage[i];
    }
    else if (keyCount2 == 4)
    {
      line(x1Storage[i], y1Storage[i], x3Storage[i], y3Storage[i]);
      line(x3Storage[i], y3Storage[i], x2Storage[i], y2Storage[i]);
      line(x2Storage[i], y2Storage[i], x4Storage[i], y4Storage[i]);
      
      pCX1Val[i] = x1Storage[i];
      pCX2Val[i] = x3Storage[i];
      pCX3Val[i] = x2Storage[i];
      pCX4Val[i] = x4Storage[i];
      
      pCY1Val[i] = y1Storage[i];
      pCY2Val[i] = y3Storage[i];
      pCY3Val[i] = y2Storage[i];
      pCY4Val[i] = y4Storage[i];
    }
    else if (keyCount2 == 5)
    {
      line(x1Storage[i], y1Storage[i], x4Storage[i], y4Storage[i]);
      line(x4Storage[i], y4Storage[i], x3Storage[i], y3Storage[i]);
      line(x3Storage[i], y3Storage[i], x2Storage[i], y2Storage[i]);
      
      pCX1Val[i] = x1Storage[i];
      pCX2Val[i] = x4Storage[i];
      pCX3Val[i] = x3Storage[i];
      pCX4Val[i] = x2Storage[i];
      
      pCY1Val[i] = y1Storage[i];
      pCY2Val[i] = y4Storage[i];
      pCY3Val[i] = y3Storage[i];
      pCY4Val[i] = y2Storage[i];
    }
    else if (keyCount2 == 6)
    {
      line(x1Storage[i], y1Storage[i], x2Storage[i], y2Storage[i]);
      line(x2Storage[i], y2Storage[i], x4Storage[i], y4Storage[i]);
      line(x4Storage[i], y4Storage[i], x3Storage[i], y3Storage[i]);
      
      pCX1Val[i] = x1Storage[i];
      pCX2Val[i] = x2Storage[i];
      pCX3Val[i] = x4Storage[i];
      pCX4Val[i] = x3Storage[i];
      
      pCY1Val[i] = y1Storage[i];
      pCY2Val[i] = y2Storage[i];
      pCY3Val[i] = y4Storage[i];
      pCY4Val[i] = y3Storage[i];
    }
    
    stroke(220, 220, 220);
  }
  
  // draws ticks and their vals
  for (int i = 0; i < 9; i++)
  {
    strokeWeight(1);
    line(x - (width * 0.005), tickYPos, x + (width * 0.005), tickYPos);
    fill(220, 220, 220);
    text(min, x - (width * 0.025), tickYPos);
    tickYPos -= tickSpace;
    min += tickInc;
  }
  fill(240, 150, 200);
}
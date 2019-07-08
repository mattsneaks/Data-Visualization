void drawTick(float x, float y1, float y2, int cNum)
{
  for (int i = 0; i < table.getRowCount(); i++)
    tickVals[i] = table.getFloat(i, cNum);
  min = min(tickVals);
  max = max(tickVals);
  float tickInc = max / 9;
  float tmpTickInc = tickInc;
  
  float tickYPos = y1;
  float lineLength = y1 - y2;
  float tickSpace = lineLength / 9;
  
  barVal1 = new float[table.getRowCount()];
  barVal2 = new float[table.getRowCount()];
  barVal3 = new float[table.getRowCount()];
  barVal4 = new float[table.getRowCount()];
  
  barX1Val = new float[table.getRowCount()];
  barX2Val = new float[table.getRowCount()];
  barX3Val = new float[table.getRowCount()];
  barX4Val = new float[table.getRowCount()];
  
  barY1Val = new float[table.getRowCount()];
  barY2Val = new float[table.getRowCount()];
  barY3Val = new float[table.getRowCount()];
  barY4Val = new float[table.getRowCount()];
  
  tickVals1 = new float[table.getRowCount()];
  tickVals2 = new float[table.getRowCount()];
  tickVals3 = new float[table.getRowCount()];
  tickVals4 = new float[table.getRowCount()];
  
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
      ellipse(x1Storage[i], y1Storage[i], width * 0.01, height * 0.01);
    else if (cNum == 1)
      ellipse(x2Storage[i], y2Storage[i], width * 0.01, height * 0.01);  
    else if(cNum == 2)
      ellipse(x3Storage[i], y3Storage[i], width * 0.01, height * 0.01);
    else if(cNum == 3)
      ellipse(x4Storage[i], y4Storage[i], width * 0.01, height * 0.01);
    
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
    
    if (keyCount == 0)
    {
      line(x1Storage[i], y1Storage[i], x2Storage[i], y2Storage[i]);
      line(x2Storage[i], y2Storage[i], x3Storage[i], y3Storage[i]);
      line(x3Storage[i], y3Storage[i], x4Storage[i], y4Storage[i]);
      
      barX1Val[i] = x1Storage[i];
      barX2Val[i] = x2Storage[i];
      barX3Val[i] = x3Storage[i];
      barX4Val[i] = x4Storage[i];
      
      barY1Val[i] = y1Storage[i];
      barY2Val[i] = y2Storage[i];
      barY3Val[i] = y3Storage[i];
      barY4Val[i] = y4Storage[i];
      
      barVal1[i] = tickVals1[i];
      barVal2[i] = tickVals2[i];
      barVal3[i] = tickVals3[i];
      barVal4[i] = tickVals4[i];
    }
    else if (keyCount == 1)
    {
      line(x2Storage[i], y2Storage[i], x1Storage[i], y1Storage[i]);
      line(x1Storage[i], y1Storage[i], x3Storage[i], y3Storage[i]);
      line(x3Storage[i], y3Storage[i], x4Storage[i], y4Storage[i]);
      
      barX1Val[i] = x2Storage[i];
      barX2Val[i] = x1Storage[i];
      barX3Val[i] = x3Storage[i];
      barX4Val[i] = x4Storage[i];
      
      barY1Val[i] = y2Storage[i];
      barY2Val[i] = y1Storage[i];
      barY3Val[i] = y3Storage[i];
      barY4Val[i] = y4Storage[i];
      
      barVal1[i] = tickVals1[i];
      barVal2[i] = tickVals2[i];
      barVal3[i] = tickVals3[i];
      barVal4[i] = tickVals4[i];
    }
    else if (keyCount == 2)
    {
      line(x3Storage[i], y3Storage[i], x2Storage[i], y2Storage[i]);
      line(x2Storage[i], y2Storage[i], x1Storage[i], y1Storage[i]);
      line(x1Storage[i], y1Storage[i], x4Storage[i], y4Storage[i]);
      
      barX1Val[i] = x3Storage[i];
      barX2Val[i] = x2Storage[i];
      barX3Val[i] = x1Storage[i];
      barX4Val[i] = x4Storage[i];
      
      barY1Val[i] = y3Storage[i];
      barY2Val[i] = y2Storage[i];
      barY3Val[i] = y1Storage[i];
      barY4Val[i] = y4Storage[i];
      
      barVal1[i] = tickVals1[i];
      barVal2[i] = tickVals2[i];
      barVal3[i] = tickVals3[i];
      barVal4[i] = tickVals4[i];
    }
    else if (keyCount == 3)
    {
      line(x4Storage[i], y4Storage[i], x2Storage[i], y2Storage[i]);
      line(x2Storage[i], y2Storage[i], x3Storage[i], y3Storage[i]);
      line(x3Storage[i], y3Storage[i], x1Storage[i], y1Storage[i]);
      
      barX1Val[i] = x4Storage[i];
      barX2Val[i] = x2Storage[i];
      barX3Val[i] = x3Storage[i];
      barX4Val[i] = x1Storage[i];
      
      barY1Val[i] = y4Storage[i];
      barY2Val[i] = y2Storage[i];
      barY3Val[i] = y3Storage[i];
      barY4Val[i] = y1Storage[i];
      
      barVal1[i] = tickVals1[i];
      barVal2[i] = tickVals2[i];
      barVal3[i] = tickVals3[i];
      barVal4[i] = tickVals4[i];
    }
    else if (keyCount == 4)
    {
      line(x1Storage[i], y1Storage[i], x3Storage[i], y3Storage[i]);
      line(x3Storage[i], y3Storage[i], x2Storage[i], y2Storage[i]);
      line(x2Storage[i], y2Storage[i], x4Storage[i], y4Storage[i]);
      
      barX1Val[i] = x1Storage[i];
      barX2Val[i] = x3Storage[i];
      barX3Val[i] = x2Storage[i];
      barX4Val[i] = x4Storage[i];
      
      barY1Val[i] = y1Storage[i];
      barY2Val[i] = y3Storage[i];
      barY3Val[i] = y2Storage[i];
      barY4Val[i] = y4Storage[i];
      
      barVal1[i] = tickVals1[i];
      barVal2[i] = tickVals2[i];
      barVal3[i] = tickVals3[i];
      barVal4[i] = tickVals4[i];
    }
    else if (keyCount == 5)
    {
      line(x1Storage[i], y1Storage[i], x4Storage[i], y4Storage[i]);
      line(x4Storage[i], y4Storage[i], x3Storage[i], y3Storage[i]);
      line(x3Storage[i], y3Storage[i], x2Storage[i], y2Storage[i]);
      
      barX1Val[i] = x1Storage[i];
      barX2Val[i] = x4Storage[i];
      barX3Val[i] = x3Storage[i];
      barX4Val[i] = x2Storage[i];
      
      barY1Val[i] = y1Storage[i];
      barY2Val[i] = y4Storage[i];
      barY3Val[i] = y3Storage[i];
      barY4Val[i] = y2Storage[i];
      
      barVal1[i] = tickVals1[i];
      barVal2[i] = tickVals2[i];
      barVal3[i] = tickVals3[i];
      barVal4[i] = tickVals4[i];
    }
    else if (keyCount == 6)
    {
      line(x1Storage[i], y1Storage[i], x2Storage[i], y2Storage[i]);
      line(x2Storage[i], y2Storage[i], x4Storage[i], y4Storage[i]);
      line(x4Storage[i], y4Storage[i], x3Storage[i], y3Storage[i]);
      
      barX1Val[i] = x1Storage[i];
      barX2Val[i] = x2Storage[i];
      barX3Val[i] = x4Storage[i];
      barX4Val[i] = x3Storage[i];
      
      barY1Val[i] = y1Storage[i];
      barY2Val[i] = y2Storage[i];
      barY3Val[i] = y4Storage[i];
      barY4Val[i] = y3Storage[i];
      
      barVal1[i] = tickVals1[i];
      barVal2[i] = tickVals2[i];
      barVal3[i] = tickVals3[i];
      barVal4[i] = tickVals4[i];
    }
    
    stroke(220, 220, 220);
  }
  
  // draws ticks and their vals
  for (int i = 0; i < 9; i++)
  {
    strokeWeight(1);
    line(x - (width * 0.01), tickYPos, x + (width * 0.01), tickYPos);
    text(tickInc, x - (width * 0.05), tickYPos);
    tickYPos -= tickSpace;
    tickInc += tmpTickInc;
  }
}
  
  
  
  
  
void axesAndLines()
{
  //axes color (off-white)
  stroke(220, 220, 220);
  
  // line aspects
  y1Pos = height * 0.85;
  y2Pos = height * 0.095;
  
  // keeps iris file from making unecessary line
  int lineCount = 0;
  if (fileName.equals("Test Scores.csv"))
    lineCount = table.getColumnCount();
  else if (fileName.equals("Iris.csv"))
    lineCount = table.getColumnCount() - 1;
  
  // calculate number of lines and space them accordingly
  lineSpace = width / (lineCount + 1);
  float tmpLineSpace = lineSpace;
  
  // array to hold x values of lines
  lineXVals = new float[lineCount];
  
  int j = 0;
  for (int i = 0; i < lineCount; i++)
  { 
    if (keyCount == 0)
    {
      lineXVals[i] = tmpLineSpace;
      tmpLineSpace = lineSpace + (lineSpace * (i + 1));
      line(lineXVals[i], y1Pos, lineXVals[i], y2Pos);
      text(table.getColumnTitle(i), lineXVals[i], y1Pos + (width * 0.025));
      drawTick(lineXVals[i], y1Pos, y2Pos, i);
    }
    
    else if (keyCount == 1)
    {
      if (i == 0)
        i = 1;
      else if (i == 1)
        i = 0;
      lineXVals[i] = tmpLineSpace;
      tmpLineSpace = lineSpace + (lineSpace * (j + 1));
      line(lineXVals[i], y1Pos, lineXVals[i], y2Pos);
      text(table.getColumnTitle(i), lineXVals[i], y1Pos + (width * 0.025));
      drawTick(lineXVals[i], y1Pos, y2Pos, i);
      if (i == 1)
        i = 0;
      else if (i == 0)
        i = 1;
    }
    
    else if (keyCount == 2)
    {
      if (i == 0)
        i = 2;
      else if (i == 2)
        i = 0;
      lineXVals[i] = tmpLineSpace;
      tmpLineSpace = lineSpace + (lineSpace * (j + 1));
      line(lineXVals[i], y1Pos, lineXVals[i], y2Pos);
      text(table.getColumnTitle(i), lineXVals[i], y1Pos + (width * 0.025));
      drawTick(lineXVals[i], y1Pos, y2Pos, i);
      if (i == 2)
        i = 0;
      else if (i == 0)
        i = 2;
    }
    
    else if (keyCount == 3)
    {
      if (i == 0)
        i = 3;
      else if (i == 3)
        i = 0;
      lineXVals[i] = tmpLineSpace;
      tmpLineSpace = lineSpace + (lineSpace * (j + 1));
      line(lineXVals[i], y1Pos, lineXVals[i], y2Pos);
      text(table.getColumnTitle(i), lineXVals[i], y1Pos + (width * 0.025));
      drawTick(lineXVals[i], y1Pos, y2Pos, i);
      if (i == 3)
        i = 0;
      else if (i == 0)
        i = 3;
    }
    
    else if (keyCount == 4)
    {
      if (i == 1)
        i = 2;
      else if (i == 2)
        i = 1;
      lineXVals[i] = tmpLineSpace;
      tmpLineSpace = lineSpace + (lineSpace * (j + 1));
      line(lineXVals[i], y1Pos, lineXVals[i], y2Pos);
      text(table.getColumnTitle(i), lineXVals[i], y1Pos + (width * 0.025));
      drawTick(lineXVals[i], y1Pos, y2Pos, i);
      if (i == 2)
        i = 1;
      else if (i == 1)
        i = 2;
    }
    
    else if (keyCount == 5)
    {
      if (i == 1)
        i = 3;
      else if (i == 3)
        i = 1;
      lineXVals[i] = tmpLineSpace;
      tmpLineSpace = lineSpace + (lineSpace * (j + 1));
      line(lineXVals[i], y1Pos, lineXVals[i], y2Pos);
      text(table.getColumnTitle(i), lineXVals[i], y1Pos + (width * 0.025));
      drawTick(lineXVals[i], y1Pos, y2Pos, i);
      if (i == 3)
        i = 1;
      else if (i == 1)
        i = 3;
    }
    
    else if (keyCount == 6)
    {
      if (i == 2)
        i = 3;
      else if (i == 3)
        i = 2;
      lineXVals[i] = tmpLineSpace;
      tmpLineSpace = lineSpace + (lineSpace * (j + 1));
      line(lineXVals[i], y1Pos, lineXVals[i], y2Pos);
      text(table.getColumnTitle(i), lineXVals[i], y1Pos + (width * 0.025));
      drawTick(lineXVals[i], y1Pos, y2Pos, i);
      if (i == 3)
        i = 2;
      else if (i == 2)
        i = 3;
    }
    
    j++;
  }
}
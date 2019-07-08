void paraAxesAndLines()
{
  //axes color (off-white)
  stroke(220, 220, 220);
  
  // line aspects
  y1Pos = height * 0.56;
  y2Pos = height * 0.32;
  
  // keeps iris file from making unecessary line
  int lineCount = 0;
  if (fileName.equals("Test Scores.csv"))
    lineCount = table.getColumnCount();
  else if (fileName.equals("Iris.csv"))
    lineCount = table.getColumnCount() - 1;
  
  // calculate number of lines and space them accordingly
  lineSpace = width * 0.55;
  float tmpLineSpace = lineSpace;
  
  // array to hold x values of lines
  lineXVals = new float[lineCount];
  
  // draws axes and their names
  int j = 0;
  for (int i = 0; i < lineCount; i++)
  {
      if (keyCount2 == 1)
      {
        if (i == 0)
          i = 1;
        else if (i == 1)
          i = 0;
      }
      else if (keyCount2 == 2)
      {
        if (i == 0)
          i = 2;
        else if (i == 2)
          i = 0;
      }
      else if (keyCount2 == 3)
      {
        if (i == 0)
          i = 3;
        else if (i == 3)
          i = 0;
      }
      else if (keyCount2 == 4)
      {
        if (i == 1)
          i = 2;
        else if (i == 2)
          i = 1;
      }
      else if (keyCount2 == 5)
      {
        if (i == 1)
          i = 3;
        else if (i == 3)
          i = 1;
      }
      else if (keyCount2 == 6)
      {
        if (i == 2)
          i = 3;
        else if (i == 3)
          i = 2;
      }
      
      lineXVals[i] = tmpLineSpace;
      tmpLineSpace = lineSpace + ((j + 1) * width * 0.14);
      line(lineXVals[i], y1Pos, lineXVals[i], y2Pos);
      text(table.getColumnTitle(i), lineXVals[i], y1Pos + (width * 0.015));
      paraDrawTick(lineXVals[i], y1Pos, y2Pos, i);
      
      if (keyCount2 == 1)
      {
        if (i == 1)
          i = 0;
        else if (i == 0)
          i = 1;
      }
      else if (keyCount2 == 2)
      {
        if (i == 2)
          i = 0;
        else if (i == 0)
          i = 2;
      }
      else if (keyCount2 == 3)
      {
        if (i == 3)
          i = 0;
        else if (i == 0)
          i = 3;
      }
      else if (keyCount2 == 4)
      {
        if (i == 2)
          i = 1;
        else if (i == 1)
          i = 2;
      }
      else if (keyCount2 == 5)
      {
        if (i == 3)
          i = 1;
        else if (i == 1)
          i = 3;
      }
      else if (keyCount2 == 6)
      {
        if (i == 3)
          i = 2;
        else if (i == 2)
          i = 3;
      }
      
    j++;
  }
}
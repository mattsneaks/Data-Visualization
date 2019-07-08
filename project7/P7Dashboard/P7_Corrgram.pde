float Average(int col)
{
  float sum = 0, avg = 0;
  for (int i = 0; i < table.getRowCount(); i++)
    sum += table.getFloat(i, col);
  avg = sum / table.getRowCount();
  return avg;
}



float StandDev(int col)
{
  float dev = 0, stdDev = 0;
  for (int i = 0; i < table.getRowCount(); i++)
    dev += sq(table.getFloat(i, col) - Average(col));
  stdDev = sqrt(dev / (table.getRowCount() - 1));
  return stdDev;
}



float Covariance(int col1, int col2)
{
  float cov = 0, covar = 0;
  for (int i = 0; i < table.getRowCount(); i++)
    cov += ((table.getFloat(i, col1) - Average(col1)) * (table.getFloat(i, col2) - Average(col2)));
  covar = cov / (table.getRowCount() - 1);
  return covar;
}



float Pearson(int col1, int col2)
{
  float pear = 0;
  pear = Covariance(col1, col2) / (StandDev(col1) * StandDev(col2));
  return pear;
}



float Spearman(int col1, int col2)
{
  float spear = 0, n = 0, d1 = 0, d2 = 0;
  for (int i = 0; i < table.getRowCount(); i++)
  {
    n += ((table.getFloat(i, col1) - Average(col1)) * (table.getFloat(i, col2) - Average(col2)));
    d1 += sq(table.getFloat(i, col1) - Average(col1));
    d2 += sq(table.getFloat(i, col2) - Average(col2));
  }
  spear = (n / (d1 * d2));
  return spear;
}



void CorrValues()
{
  int colAvail = 0;
  
  if (fileName.equals("Test Scores.csv"))
    colAvail = table.getColumnCount();
  else if (fileName.equals("Iris.csv"))
    colAvail = table.getColumnCount() - 1;
  
  int nextCount = 1;
  for (int i = 0; i < colAvail * 4; i++)
  {
    if (i % 5 == 0)
      corrVals[i] = 1;
    else if (i % 4 == 0)
    {
      corrVals[i] = Pearson(nextCount, 0);
      nextCount++;
    }
    else
    {
      if (i == 1)
        corrVals[i] = Spearman(0, 1);
      else if (i == 2)
        corrVals[i] = Spearman(0, 1);
      else if (i == 3)
        corrVals[i] = Spearman(0, 3);
      else if (i == 6)
        corrVals[i] = Spearman(1, 2);
      else if (i == 7)
        corrVals[i] = Spearman(1, 3);
      else if (i == 9)
        corrVals[i] = Pearson(2, 1);
      else if (i == 11)
        corrVals[i] = Spearman(2, 3);
      else if (i == 13)
        corrVals[i] = Pearson(3, 1);
      else if (i == 14)
        corrVals[i] = Pearson(3, 2); 
    }
  }
}



void CorrPlot()
{
  float xLen1 = width * 0.05, xLen2 = width * 0.48;
  float xDivSpace = (xLen2 - xLen1) / 4;
  float yHei1 = height * 0.97, yHei2 = height * 0.62;
  float yDivSpace = (yHei1 - yHei2) / 4;
  float curX = xLen1, curY = yHei2 + yDivSpace;
  int colAv = 0;
  int xLabelCount = 0, yLabelCount = 0;
  
  /*line(xLen1, yHei1, xLen2, yHei1);
  line(xLen1, yHei2, xLen2, yHei2);
  line(xLen1, yHei1, xLen1, yHei2);
  line(xLen2, yHei1, xLen2, yHei2);*/
  
  if (fileName.equals("Test Scores.csv"))
    colAv = table.getColumnCount();
  else if (fileName.equals("Iris.csv"))
    colAv = table.getColumnCount() - 1;
  
  CorrValues();
  
  for (int i = 0; i < colAv * 4; i++)
  {
    if (xLabelCount < 4)
    {
      fill(250);
      text(table.getColumnTitle(xLabelCount), curX + (xDivSpace / 2), yHei2 - (height * 0.01));
      xLabelCount++;
    }
    
    if (i == 4 || i == 8 || i == 12)
    {
      curX = xLen1;
      curY += yDivSpace;
    }
    
    if (i == 0 || i == 4 || i == 8 || i == 12)
    {
      textSize(9);
      text(table.getColumnTitle(yLabelCount), curX - (width * 0.023), curY - (yDivSpace / 2));
      yLabelCount++;
      textSize(10);
    }
    
    if (corrVals[i] >= -1 && corrVals[i] <= -0.75)
    {
      fill(255, 255, 0);
      ellipse(curX + (xDivSpace / 2), curY - (yDivSpace / 2), width * 0.1, height * 0.075);
    }
    else if (corrVals[i] >= -0.75 && corrVals[i] <= -0.5)
    {
      fill(255, 255, 20);
      ellipse(curX + (xDivSpace / 2), curY - (yDivSpace / 2), width * 0.1, height * 0.06);
    }
    else if (corrVals[i] >= -0.5 && corrVals[i] <= -0.25)
    {
      fill(255, 255, 60);
      ellipse(curX + (xDivSpace / 2), curY - (yDivSpace / 2), width * 0.1, height * 0.045);
    }
    else if (corrVals[i] >= -0.25 && corrVals[i] < 0)
    {
      fill(255, 255, 120);
      ellipse(curX + (xDivSpace / 2), curY - (yDivSpace / 2), width * 0.1, height * 0.03);
    }
    else if (corrVals[i] == 0)
    {
      fill(255);
      ellipse(curX + (xDivSpace / 2), curY - (yDivSpace / 2), width * 0.1, height * 0.015);
    }
    else if (corrVals[i] > 0 && corrVals[i] <= 0.25)
    {
      fill(120, 255, 120);
      ellipse(curX + (xDivSpace / 2), curY - (yDivSpace / 2), width * 0.1, height * 0.03);
    }
    else if (corrVals[i] >= 0.25 && corrVals[i] <= 0.5)
    {
      fill(60, 255, 60);
      ellipse(curX + (xDivSpace / 2), curY - (yDivSpace / 2), width * 0.1, height * 0.045);
    }
    else if (corrVals[i] >= 0.5 && corrVals[i] <= 0.75)
    {
      fill(20, 255, 20);
      ellipse(curX + (xDivSpace / 2), curY - (yDivSpace / 2), width * 0.1, height * 0.06);
    }
    else if (corrVals[i] >= 0.75 && corrVals[i] <= 1)
    {
      fill(0, 255, 0);
      ellipse(curX + (xDivSpace / 2), curY - (yDivSpace / 2), width * 0.1, height * 0.075);
    }
    
    //line(curX, curY, curX + xDivSpace, curY);
    //line(curX, curY, curX, curY - yDivSpace);
    fill(0);
    textSize(12);
    text(corrVals[i], curX + (xDivSpace / 2), curY - (yDivSpace / 2));
    
    curX += xDivSpace;
    textSize(10);
    fill(250);
  }
}
void hist()
{
  // calculate the working area (length & width)
  float workLenMin = width * 0.5, workLenMax = width * 0.99;
  float workHeiMin = height * 0.97, workHeiMax = height * 0.59;
  float workLenDiv = (workLenMin + workLenMax) / 2.05, workHeiDiv = (workHeiMax + workHeiMin) / 2.05;
  float utmpLen1 = width * 0.51, utmpLen2 = workLenDiv;
  float ltmpLen1 = utmpLen1, ltmpLen2 = utmpLen2;
  float utmpHei1 = workHeiDiv, utmpHei2 = workHeiMax;
  float ltmpHei1 = workHeiMin - (width * 0.005), ltmpHei2 = workHeiDiv + (width * 0.02);
  
  // sets necessary column count
  if (fileName.equals("Test Scores.csv"))
  {
    colCount = table.getColumnCount();
    denominator = 271;
  }
  else if (fileName.equals("Iris.csv"))
  {
    colCount = table.getColumnCount() - 1;
    denominator = 150;
  }
  
  // creates storage for each column and counts their min and max values
  for (int j = 0; j < colCount; j++)
  {
    for (int i = 0; i < table.getRowCount(); i++)
    {
      if (j == 0)
        col1Store[i] = table.getFloat(i, j);
      else if (j == 1)
        col2Store[i] = table.getFloat(i, j);
      else if (j == 2)
        col3Store[i] = table.getFloat(i, j);
      else if (j == 3)
        col4Store[i] = table.getFloat(i, j);
      
      if (j == colCount - 1)
      {
        xMin1 = min(col1Store);
        xMax1 = max(col1Store);
        xMin2 = min(col2Store);
        xMax2 = max(col2Store);
        xMin3 = min(col3Store);
        xMax3 = max(col3Store);
        xMin4 = min(col4Store);
        xMax4 = max(col4Store);
      }
    }
  }
  
  for (int j = 0; j < colCount; j++)
  {
    // -------------------------------------------------- histogram lower half ------------------------------------------------
    if (j > 1)
    {
      // x and y axis lines
      line(ltmpLen1, ltmpHei1, ltmpLen2, ltmpHei1);
      line(ltmpLen1, ltmpHei1, ltmpLen1, ltmpHei2);
      
      // x and y tick space
      xDiv = (ltmpLen2 - ltmpLen1 + (width * 0.01)) / 8;
      yDiv = (ltmpHei1 - ltmpHei2) / 8;
      
      if (j == 2)
      {
        tmpXTickVal = xMin3;
        tmpXDivVal = xMax3;
        if (fileName.equals("Test Scores.csv"))
        {
          tmpYTickVal = 0;
          tmpYDivVal = 80;
        }
        else if (fileName.equals("Iris.csv"))
        {
          tmpYTickVal = 0;
          tmpYDivVal = 50;
        }
        minX = tmpXTickVal;
        maxX = tmpXDivVal;
        minY = tmpYTickVal;
        maxY = tmpYDivVal;
      }  
      else if (j == 3)
      {
        tmpXTickVal = xMin4;
        tmpXDivVal = xMax4;
        if (fileName.equals("Test Scores.csv"))
        {
          tmpYTickVal = 0;
          tmpYDivVal = 90;
        }
        else if (fileName.equals("Iris.csv"))
        {
          tmpYTickVal = 0;
          tmpYDivVal = 50;
        }
        minX = tmpXTickVal;
        maxX = tmpXDivVal;
        minY = tmpYTickVal;
        maxY = tmpYDivVal;
      }
      
      // x and y tick increments
      xDivAm = (tmpXDivVal - tmpXTickVal) / 7;
      yDivAm = (tmpYDivVal - tmpYTickVal) / 7;
      
      // x-axis ticks and values
      int count = 0;
      for(float tx = ltmpLen1 + (width * 0.01); tx < ltmpLen2; tx += xDiv)
      {
        line(tx, ltmpHei1 - (height * 0.004), tx, ltmpHei1 + (height * 0.004));
        textSize(8);
        fill(255);
        text(tmpXTickVal, tx, ltmpHei1 + (height * 0.015));
        
        // store x tick val
        xTickVals[count] = tmpXTickVal;
        
        if (count != 0)
        {
          for (int i = 0; i < table.getRowCount(); i++)
          {
            if (j == 2)
            {
              if ((col3Store[i] >= xTickVals[count - 1]) && (col3Store[i] <= xTickVals[count]))
                frequency++;
            }
            else if (j == 3)
            {
              if ((col4Store[i] >= xTickVals[count - 1]) && (col4Store[i] <= xTickVals[count]))
                frequency++;
            }
          }
          histStore[count] = frequency;
          if (j == 2)
            histStore3[count] = frequency;
          else if (j == 3)
            histStore4[count] = frequency;
        }
        frequency = 0;
        
        tmpXTickVal += xDivAm;
        count++;
      }
      // x-axes titles
      textSize(10);
      fill(240, 150, 200);
      text("H" + (j + 1) + ": " + table.getColumnTitle(j), (ltmpLen1 + ltmpLen2) / 2, ltmpHei1 + (height * 0.03));
      
      // y-axis ticks and values
      for(float ty = ltmpHei1; ty > ltmpHei2; ty -= yDiv)
      {
        line(ltmpLen1 - (width * 0.004), ty, ltmpLen1 + (width * 0.004), ty);
        textSize(8);
        fill(255);
        text(tmpYTickVal, ltmpLen1 - (width * 0.009), ty);
        tmpYTickVal += yDivAm;
      }
      // y-axis titles
      rotate(-PI / 2);
      textSize(10);
      fill(240, 150, 200);
      text("Frequency", -workHeiDiv + (width * 0.05), ltmpLen1 - (width * 0.02));
      rotate(PI / 2);
      
      // draws bars
      for (int i = 1; i < 8; i++)
      {
        float xMap = map(xTickVals[i], minX, maxX, ltmpLen1 - (width * 0.018), ltmpLen2 - (width * 0.037));
        float yMap = map(histStore[i], minY, maxY, ltmpHei1, ltmpHei2 + yDivAm);
        
        if (j == 2)
        {
          mean3 += (xTickVals[i - 1] * histStore[i]);
          m3 += histStore3[i];
        }
        else if (j == 3)
        {
          mean4 += (xTickVals[i - 1] * histStore[i]);
          m4 += histStore4[i];
        }
        
        if (i == 7)
        {
          if (j == 2)
          {
            m3 /= 7;
            mean3 = mean3 / denominator;
            for (int k = 1; k < 8; k++)
              dev3 += sq(xTickVals[k - 1] - mean3);
            dev3 = sqrt(dev3 / 6);
            sdev3 = String.format("%.1f", dev3);
          }
          else if (j == 3)
          {
            m4 /= 7;
            mean4 = mean4 / denominator;
            for (int k = 1; k < 8; k++)
              dev4 += sq(xTickVals[k - 1] - mean4);
            dev4 = sqrt(dev4 / 6);
            sdev4 = String.format("%.1f", dev4);
          }
        }
        
        noStroke();
        fill(0, 200, 120);
        rect(xMap, yMap, xDiv, ltmpHei1 - yMap);
        fill(240, 150, 200);
        stroke(220, 220, 220);
      }
      fill(255);
    }
    // -------------------------------------------------- histogram upper half ------------------------------------------------
    else
    {
      // x and y axis lines
      line(utmpLen1, utmpHei1, utmpLen2, utmpHei1);
      line(utmpLen1, utmpHei1, utmpLen1, utmpHei2);
      
      // x and y tick space
      xDiv = (utmpLen2 - utmpLen1 + (width * 0.01)) / 8;
      yDiv = (utmpHei1 - utmpHei2) / 8;
      
      if (j == 0)
      {
        tmpXTickVal = xMin1;
        tmpXDivVal = xMax1;
        if (fileName.equals("Test Scores.csv"))
        {
          tmpYTickVal = 0;
          tmpYDivVal = 65;
        }
        else if (fileName.equals("Iris.csv"))
        {
          tmpYTickVal = 0;
          tmpYDivVal = 60;
        }
        minX = tmpXTickVal;
        maxX = tmpXDivVal;
        minY = tmpYTickVal;
        maxY = tmpYDivVal;
      }
      else if (j == 1)
      {
        tmpXTickVal = xMin2;
        tmpXDivVal = xMax2;
        if (fileName.equals("Test Scores.csv"))
        {
          tmpYTickVal = 0;
          tmpYDivVal = 90;
        }
        else if (fileName.equals("Iris.csv"))
        {
          tmpYTickVal = 0;
          tmpYDivVal = 60;
        }
        minX = tmpXTickVal;
        maxX = tmpXDivVal;
        minY = tmpYTickVal;
        maxY = tmpYDivVal;
      }
      
      // x and y tick increments
      xDivAm = (tmpXDivVal - tmpXTickVal) / 7;
      yDivAm = (tmpYDivVal - tmpYTickVal) / 7;
      
      // x-axis ticks and values
      int count = 0;
      for(float tx = utmpLen1 + (width * 0.01); tx < utmpLen2; tx += xDiv)
      {
        line(tx, utmpHei1 - (height * 0.004), tx, utmpHei1 + (height * 0.004));
        textSize(8);
        fill(255);
        text(tmpXTickVal, tx, utmpHei1 + (height * 0.015));
        
        // store x tick val
        xTickVals[count] = tmpXTickVal;
        
        if (count != 0)
        {
          for (int i = 0; i < table.getRowCount(); i++)
          {
            if (j == 0)
            {
              if (col1Store[i] >= xTickVals[count - 1] && col1Store[i] <= xTickVals[count])
                frequency++;
            }
            else if (j == 1)
            {
              if (col2Store[i] >= xTickVals[count - 1] && col2Store[i] <= xTickVals[count])
                frequency++;
            }
          }
          histStore[count] = frequency;
          if (j == 0)
            histStore1[count] = frequency;
          else if (j == 1)
            histStore2[count] = frequency;
        }
        frequency = 0;
        
        tmpXTickVal += xDivAm;
        count++;
      }
      // x-axes titles
      textSize(10);
      fill(240, 150, 200);
      text("H" + (j + 1)  + ": " + table.getColumnTitle(j), (utmpLen1 + utmpLen2) / 2, utmpHei1 + (height * 0.03));
      
      // y-axis ticks and values
      for(float ty = utmpHei1; ty > utmpHei2; ty -= yDiv)
      {
        line(utmpLen1 - (width * 0.004), ty, utmpLen1 + (width * 0.004), ty);
        textSize(8);
        fill(255);
        text(tmpYTickVal, utmpLen1 - (width * 0.009), ty);
        tmpYTickVal += yDivAm;
      }
      // y-axis titles
      rotate(-PI / 2);
      textSize(10);
      fill(240, 150, 200);
      text("Frequency", -workHeiMin + (width * 0.06), utmpLen1 - (width * 0.02));
      rotate(PI / 2);
      
      // draws bars
      for (int i = 1; i < 8; i++)
      {
        float xMap = map(xTickVals[i], minX, maxX, utmpLen1 - (width * 0.018), utmpLen2 - (width * 0.037));
        float yMap = map(histStore[i], minY, maxY, utmpHei1, utmpHei2 + yDivAm);
        
        if (j == 0)
        {
          mean1 += (xTickVals[i - 1] * histStore[i]);
          m1 += histStore1[i];
        }
        else if (j == 1)
        {
          mean2 += (xTickVals[i - 1] * histStore[i]);
          m2 += histStore2[i];
        }
        
        if (i == 7)
        {
          if (j == 0)
          {
            m1 /= 7;
            mean1 = mean1 / denominator;
            for (int k = 1; k < 8; k++)
              dev1 += sq(xTickVals[k - 1] - mean1);
            dev1 = sqrt(dev1 / 6);
            sdev1 = String.format("%.2f", dev1);
          }
          else if (j == 1)
          {
            m2 /= 7;
            mean2 = mean2 / denominator;
            for (int k = 1; k < 8; k++)
              dev2 += sq(xTickVals[k - 1] - mean2);
            dev2 = sqrt(dev2 / 6);
            sdev2 = String.format("%.2f", dev2);
          }
        }
        
        noStroke();
        fill(0, 200, 120);
        rect(xMap, yMap, xDiv, utmpHei1 - yMap);
        fill(240, 150, 200);
        stroke(220, 220, 220);
      }
      fill(255);
    }
    
    // -------------------------------------------------- incrementing values ------------------------------------------------
    if (j > 1)
    {
      ltmpLen1 = ltmpLen2 + (width * 0.04);
      ltmpLen2 = workLenMax;
    }
    else
    {
      utmpLen1 = utmpLen2 + (width * 0.04);
      utmpLen2 = workLenMax;
    }
  }
}
void splom()
{
  // calculate the working area (length & width)
  float workLenMin = width * 0.05, workLenMax = width * 0.99;
  float workHeiMin = height * 0.97, workHeiMax = height * 0.59;
  float workLen = workLenMax - workLenMin;
  float workLenDiv = workLen / 6, workHeiDiv = (workHeiMax + workHeiMin) / 2.05;
  float tmpLen = width * 0.02, tmpLen2 = tmpLen;
  
  // calculate the total number of sploms
  if (fileName.equals("Test Scores.csv"))
  {
    totalSploms = table.getColumnCount() * (table.getColumnCount() - 1);
    colCount = table.getColumnCount();
    labels = new String[colCount];
    
  }
  else if (fileName.equals("Iris.csv"))
  {
    totalSploms = (table.getColumnCount() - 1) * (table.getColumnCount() - 2);
    colCount = table.getColumnCount() - 1;
    labels = new String[colCount];
  }
  
  // creates array that holds column names
  for (int i = 0; i < colCount; i++)
  {
    labels[i] = table.getColumnTitle(i);
  }
  
  // saves all the values in each column into separate storage arrays
  for (int j = 0; j < colCount; j++)
  {
    for (int i = 0; i < table.getRowCount(); i++)
    {
      if (j == 0)
        col1Storage[i] = table.getFloat(i, j);
      else if (j == 1)
        col2Storage[i] = table.getFloat(i, j);
      else if (j == 2)
        col3Storage[i] = table.getFloat(i, j);
      else if (j == 3)
        col4Storage[i] = table.getFloat(i, j);
    }
  }
  
  min1 = min(col1Storage);
  text(min1, width / 2, height / 2);
  max1 = max(col1Storage);
  text(max1, width / 2, height / 3);
  min2 = min(col2Storage);
  max2 = max(col2Storage);
  min3 = min(col3Storage);
  max3 = max(col3Storage);
  min4 = min(col4Storage);
  max4 = max(col4Storage);
  
  // create x and y storage arrays based off the number of sploms
  sX1Storage = new float[table.getRowCount()];
  sX2Storage = new float[table.getRowCount()];
  sX3Storage = new float[table.getRowCount()];
  sX4Storage = new float[table.getRowCount()];
  sX5Storage = new float[table.getRowCount()];
  sX6Storage = new float[table.getRowCount()];
  sX7Storage = new float[table.getRowCount()];
  sX8Storage = new float[table.getRowCount()];
  sX9Storage = new float[table.getRowCount()];
  sX10Storage = new float[table.getRowCount()];
  sX11Storage = new float[table.getRowCount()];
  sX12Storage = new float[table.getRowCount()];
  
  sY1Storage = new float[table.getRowCount()];
  sY2Storage = new float[table.getRowCount()];
  sY3Storage = new float[table.getRowCount()];
  sY4Storage = new float[table.getRowCount()];
  sY5Storage = new float[table.getRowCount()];
  sY6Storage = new float[table.getRowCount()];
  sY7Storage = new float[table.getRowCount()];
  sY8Storage = new float[table.getRowCount()];
  sY9Storage = new float[table.getRowCount()];
  sY10Storage = new float[table.getRowCount()];
  sY11Storage = new float[table.getRowCount()];
  sY12Storage = new float[table.getRowCount()];
  
  x1Val = new float[table.getRowCount()];
  x2Val = new float[table.getRowCount()];
  x3Val = new float[table.getRowCount()];
  x4Val = new float[table.getRowCount()];
  x5Val = new float[table.getRowCount()];
  x6Val = new float[table.getRowCount()];
  x7Val = new float[table.getRowCount()];
  x8Val = new float[table.getRowCount()];
  x9Val = new float[table.getRowCount()];
  x10Val = new float[table.getRowCount()];
  x11Val = new float[table.getRowCount()];
  x12Val = new float[table.getRowCount()];
  
  y1Val = new float[table.getRowCount()];
  y2Val = new float[table.getRowCount()];
  y3Val = new float[table.getRowCount()];
  y4Val = new float[table.getRowCount()];
  y5Val = new float[table.getRowCount()];
  y6Val = new float[table.getRowCount()];
  y7Val = new float[table.getRowCount()];
  y8Val = new float[table.getRowCount()];
  y9Val = new float[table.getRowCount()];
  y10Val = new float[table.getRowCount()];
  y11Val = new float[table.getRowCount()];
  y12Val = new float[table.getRowCount()];
  
  sW1 = new float[table.getRowCount()];
  sW2 = new float[table.getRowCount()];
  sW3 = new float[table.getRowCount()];
  sW4 = new float[table.getRowCount()];
  sW5 = new float[table.getRowCount()];
  sW6 = new float[table.getRowCount()];
  sW7 = new float[table.getRowCount()];
  sW8 = new float[table.getRowCount()];
  sW9 = new float[table.getRowCount()];
  sW10 = new float[table.getRowCount()];
  sW11 = new float[table.getRowCount()];
  sW12 = new float[table.getRowCount()];
  
  sH1 = new float[table.getRowCount()];
  sH2 = new float[table.getRowCount()];
  sH3 = new float[table.getRowCount()];
  sH4 = new float[table.getRowCount()];
  sH5 = new float[table.getRowCount()];
  sH6 = new float[table.getRowCount()];
  sH7 = new float[table.getRowCount()];
  sH8 = new float[table.getRowCount()];
  sH9 = new float[table.getRowCount()];
  sH10 = new float[table.getRowCount()];
  sH11 = new float[table.getRowCount()];
  sH12 = new float[table.getRowCount()];
  
  // write a for loop that creates rectangle spaces for each splom
  int i2 = 0;
  for (int i = 0; i < totalSploms; i++)
  {
    if (i < totalSploms / 2)
    {
      // y-axis
      line(tmpLen, workHeiDiv, tmpLen, workHeiMax);
      if (i == 0)
        yLabel = labels[1];
      else if (i == 1)
        yLabel = labels[2];
      else if (i == 2)
        yLabel = labels[3];
      else if (i == 3)
        yLabel = labels[0];
      else if (i == 4)
        yLabel = labels[2];
      else if (i == 5)
        yLabel = labels[3];
      
      // y-axis label
      rotate(-PI / 2);
      text(yLabel, -workHeiDiv + (width * 0.05), tmpLen - (width * 0.01));
      rotate(PI / 2);
      
      // x-axis
      line(tmpLen, workHeiDiv, (i + 1.15) * workLenDiv, workHeiDiv);
      if (i == 0 || i == 1 || i == 2)
        xLabel = labels[0];
      else if (i == 3 || i == 4 || i == 5)
        xLabel = labels[1];
      else if (i == 6 || i == 7 || i == 8)
        xLabel = labels[2];
      else if (i == 9 || i == 10 || i == 11)
        xLabel = labels[3];
      
      // x-axis label
      text(xLabel, tmpLen + (width * 0.07), workHeiDiv + (height * 0.02));
      
      for (int j = 0; j < table.getRowCount(); j++)
      {
        if (i == 0)
        {
          float xMap = map(col1Storage[j], min1, max1, tmpLen, (i + 1.15) * workLenDiv);
          float yMap = map(col2Storage[j], min2, max2, workHeiDiv, workHeiMax);
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x1Val[j] = col1Storage[j];
          y1Val[j] = col2Storage[j];
          sX1Storage[j] = xMap;
          sY1Storage[j] = yMap;
          sW1[j] = width * 0.00001;
          sH1[j] = workHeiDiv - yMap;
        }
        else if (i == 1)
        {
          float xMap = map(col1Storage[j], min1, max1, tmpLen, (i + 1.15) * workLenDiv);
          float yMap = map(col3Storage[j], min3, max3, workHeiDiv, workHeiMax);
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x2Val[j] = col1Storage[j];
          y2Val[j] = col3Storage[j];
          sX2Storage[j] = xMap;
          sY2Storage[j] = yMap;
          sW2[j] = width * 0.00001;
          sH2[j] = workHeiDiv - yMap;
        }
        else if (i == 2)
        {
          float xMap = map(col1Storage[j], min1, max1, tmpLen, (i + 1.15) * workLenDiv);
          float yMap = map(col4Storage[j], min4, max4, workHeiDiv, workHeiMax);
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x3Val[j] = col1Storage[j];
          y3Val[j] = col4Storage[j];
          sX3Storage[j] = xMap;
          sY3Storage[j] = yMap;
          sW3[j] = width * 0.00001;
          sH3[j] = workHeiDiv - yMap;
        }
        else if (i == 3)
        {
          float xMap = map(col2Storage[j], min2, max2, tmpLen, (i + 1.15) * workLenDiv);
          float yMap = map(col1Storage[j], min1, max1, workHeiDiv, workHeiMax);
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x4Val[j] = col2Storage[j];
          y4Val[j] = col1Storage[j];
          sX4Storage[j] = xMap;
          sY4Storage[j] = yMap;
          sW4[j] = width * 0.00001;
          sH4[j] = workHeiDiv - yMap;
        }
        else if (i == 4)
        {
          float xMap = map(col2Storage[j], min2, max2, tmpLen, (i + 1.15) * workLenDiv);
          float yMap = map(col3Storage[j], min3, max3, workHeiDiv, workHeiMax);
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x5Val[j] = col2Storage[j];
          y5Val[j] = col3Storage[j];
          sX5Storage[j] = xMap;
          sY5Storage[j] = yMap;
          sW5[j] = width * 0.00001;
          sH5[j] = workHeiDiv - yMap;
        }
        else if (i == 5)
        {
          float xMap = map(col2Storage[j], min2, max2, tmpLen, (i + 1.15) * workLenDiv);
          float yMap = map(col4Storage[j], min4, max4, workHeiDiv, workHeiMax);
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x6Val[j] = col2Storage[j];
          y6Val[j] = col4Storage[j];
          sX6Storage[j] = xMap;
          sY6Storage[j] = yMap;
          sW6[j] = width * 0.00001;
          sH6[j] = workHeiDiv - yMap;
        }
      }
      
      tmpLen = (i + 1.3) * workLenDiv;
    }
    else if (i >= totalSploms / 2)
    {
      // y-axis
      line(tmpLen2, workHeiMin, tmpLen2, workHeiDiv + (width * 0.02));
      if (i == 6)
        yLabel = labels[0];
      else if (i == 7)
        yLabel = labels[1];
      else if (i == 8)
        yLabel = labels[3];
      else if (i == 9)
        yLabel = labels[0];
      else if (i == 10)
        yLabel = labels[1];
      else if (i == 11)
        yLabel = labels[2];
      
      // y-axis label
      rotate(-PI / 2);
      text(yLabel, -workHeiMin + (width * 0.05), tmpLen2 - (width * 0.01));
      rotate(PI / 2);
      
      // x-axis
      line(tmpLen2, workHeiMin, (i2 + 1.15) * workLenDiv, workHeiMin);
      if (i == 0 || i == 1 || i == 2)
        xLabel = labels[0];
      else if (i == 3 || i == 4 || i == 5)
        xLabel = labels[1];
      else if (i == 6 || i == 7 || i == 8)
        xLabel = labels[2];
      else if (i == 9 || i == 10 || i == 11)
        xLabel = labels[3];
      
      // x-axis label
      text(xLabel, tmpLen2 + (width * 0.07), workHeiMin + (height * 0.02));
      
      for (int j = 0; j < table.getRowCount(); j++)
      {
        if (i == 6)
        {
          float xMap = map(col3Storage[j], min3, max3, tmpLen2, (i2 + 1.15) * workLenDiv);
          float yMap = map(col1Storage[j], min1, max1, workHeiMin, workHeiDiv + (width * 0.02));
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x7Val[j] = col3Storage[j];
          y7Val[j] = col1Storage[j];
          sX7Storage[j] = xMap;
          sY7Storage[j] = yMap;
          sW7[j] = width * 0.00001;
          sH7[j] = workHeiMin - yMap;
        }
        else if (i == 7)
        {
          float xMap = map(col3Storage[j], min3, max3, tmpLen2, (i2 + 1.15) * workLenDiv);
          float yMap = map(col2Storage[j], min2, max2, workHeiMin, workHeiDiv + (width * 0.02));
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x8Val[j] = col3Storage[j];
          y8Val[j] = col2Storage[j];
          sX8Storage[j] = xMap;
          sY8Storage[j] = yMap;
          sW8[j] = width * 0.00001;
          sH8[j] = workHeiMin - yMap;
        }
        else if (i == 8)
        {
          float xMap = map(col3Storage[j], min3, max3, tmpLen2, (i2 + 1.15) * workLenDiv);
          float yMap = map(col4Storage[j], min4, max4, workHeiMin, workHeiDiv + (width * 0.02));
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x9Val[j] = col3Storage[j];
          y9Val[j] = col4Storage[j];
          sX9Storage[j] = xMap;
          sY9Storage[j] = yMap;
          sW9[j] = width * 0.00001;
          sH9[j] = workHeiMin - yMap;
        }
        else if (i == 9)
        {
          float xMap = map(col4Storage[j], min4, max4, tmpLen2, (i2 + 1.15) * workLenDiv);
          float yMap = map(col1Storage[j], min1, max1, workHeiMin, workHeiDiv + (width * 0.02));
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x10Val[j] = col4Storage[j];
          y10Val[j] = col1Storage[j];
          sX10Storage[j] = xMap;
          sY10Storage[j] = yMap;
          sW10[j] = width * 0.00001;
          sH10[j] = workHeiMin - yMap;
        }
        else if (i == 10)
        {
          float xMap = map(col4Storage[j], min4, max4, tmpLen2, (i2 + 1.15) * workLenDiv);
          float yMap = map(col2Storage[j], min2, max2, workHeiMin, workHeiDiv + (width * 0.02));
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x11Val[j] = col4Storage[j];
          y11Val[j] = col2Storage[j];
          sX11Storage[j] = xMap;
          sY11Storage[j] = yMap;
          sW11[j] = width * 0.00001;
          sH11[j] = workHeiMin - yMap;
        }
        else if (i == 11)
        {
          float xMap = map(col4Storage[j], min4, max4, tmpLen2, (i2 + 1.15) * workLenDiv);
          float yMap = map(col3Storage[j], min3, max3, workHeiMin, workHeiDiv + (width * 0.02));
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.003, height * 0.003);
          stroke(220, 220, 220);
          
          x12Val[j] = col4Storage[j];
          y12Val[j] = col3Storage[j];
          sX12Storage[j] = xMap;
          sY12Storage[j] = yMap;
          sW12[j] = width * 0.00001;
          sH12[j] = workHeiMin - yMap;
        }
      }
      
      tmpLen2 = (i2 + 1.3) * workLenDiv;
      i2++;
    }
  }
}
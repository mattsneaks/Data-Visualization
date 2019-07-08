void axesAndDots()
{ 
  // axes color (off-white)
  stroke(220, 220, 220);
  
  // x-axis line
  float xAxisX1Val = width * 0.075;
  float xAxisY1Val = height * 0.9;
  float xAxisX2Val = width * 0.99;
  float xAxisY2Val = xAxisY1Val;
  line (xAxisX1Val, xAxisY1Val, xAxisX2Val, xAxisY2Val);
  
  
  // y-axis line
  float yAxisX1Val = width * 0.075;
  float yAxisY1Val = height * 0.9;
  float yAxisX2Val = yAxisX1Val;
  float yAxisY2Val = height * 0.1;
  float yAxisLength = yAxisY1Val - yAxisY2Val;
  float yAxisDivision = yAxisLength / 9;
  line (yAxisX1Val, yAxisY1Val, yAxisX2Val, yAxisY2Val);
  
  // y-axis ticks
  float tickYAxisX1Val = yAxisX1Val - (width * 0.01);
  float tickYAxisX2Val = yAxisX1Val + (width * 0.01);
  float tickYAxisXVal = tickYAxisX1Val - (width * 0.05);
  float tickYValDivision = (maxVal - minVal) / 8;
  
  barVal = new float[table.getRowCount()];
  barXVal = new float[table.getRowCount()];
  barYVal = new float[table.getRowCount()];
  barW = new float[table.getRowCount()];
  barH = new float[table.getRowCount()];
  barNum = new int[table.getRowCount()];
  
  // y-axis tick values
  for (float i = yAxisY1Val; i > yAxisY2Val; i -= yAxisDivision)
  {
    line(tickYAxisX1Val, i, tickYAxisX2Val, i);
    fill(220, 220, 220);
    text(minVal, tickYAxisXVal, i);
    minVal += tickYValDivision;
  } 
  
  // lavender
  fill(240, 150, 200);
  
  // column 1 ---------------------------------------------------------------------------------
  if (keyCount == 0)
  {
    int col = keyCount;
    // x-axis label
    text(table.getColumnTitle(col), width / 2, height * 0.93);
    // y-axis label
    rotate(-PI / 2);
    text("Value", -height / 2, height * 0.023);
    rotate(PI / 2);
    
    //initially set min and max vals
    minVal = table.getFloat(1, col);
    maxVal = table.getFloat(1, col);
    
    float[] vals = new float[table.getRowCount()];
    
    for (int row = 0; row < table.getRowCount(); row++)
    {
      vals[row] = table.getFloat(row, col);
      if (table.getFloat(row, col) < minVal)
        minVal = table.getFloat(row, col);
      else if (table.getFloat(row, col) > maxVal)
        maxVal = table.getFloat(row, col);
      
      if (row + 1 == table.getRowCount())
      { 
        // graph vals
        for (int i = 0; i < table.getRowCount(); i++)
        {
          float xMap = map(i, 0, table.getRowCount(), xAxisX1Val, xAxisX2Val);
          float yMap = map(vals[i], minVal, maxVal, yAxisY1Val, yAxisY2Val + yAxisDivision);
          // aqua
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.01, height * 0.01);
          
          barVal[i] = vals[i];
          barXVal[i] = xMap;
          barYVal[i] = yMap;
          barW[i] = width * 0.00001;
          barH[i] = yAxisY1Val - yMap;
          barNum[i] = i;
        }
      }
    }
  }
  // ------------------------------------------------------------------------------------------
  
  // column 2 ---------------------------------------------------------------------------------
  if (keyCount == 1)
  {
    int col = keyCount;
    // x-axis label
    text(table.getColumnTitle(col), width / 2, height * 0.93);
    // y-axis label
    rotate(-PI / 2);
    text("Value", -height / 2, height * 0.023);
    rotate(PI / 2);
    
    //initially set min and max vals
    minVal = table.getFloat(1, col);
    maxVal = table.getFloat(1, col);
    
    float[] vals = new float[table.getRowCount()];
    
    for (int row = 0; row < table.getRowCount(); row++)
    {
      vals[row] = table.getFloat(row, col);
      if (table.getFloat(row, col) < minVal)
        minVal = table.getFloat(row, col);
      else if (table.getFloat(row, col) > maxVal)
        maxVal = table.getFloat(row, col);
      
      if (row + 1 == table.getRowCount())
      { 
        // graph vals
        for (int i = 0; i < table.getRowCount(); i++)
        {
          float xMap = map(i, 0, table.getRowCount(), xAxisX1Val, xAxisX2Val);
          float yMap = map(vals[i], minVal, maxVal, yAxisY1Val, yAxisY2Val + yAxisDivision);
          // aqua
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.01, height * 0.01);
          
          barVal[i] = vals[i];
          barXVal[i] = xMap;
          barYVal[i] = yMap;
          barW[i] = width * 0.00001;
          barH[i] = yAxisY1Val - yMap;
          barNum[i] = i;
        }
      }
    }
  }
  // ------------------------------------------------------------------------------------------
  
  // column 3 ---------------------------------------------------------------------------------
  if (keyCount == 2)
  {
    int col = keyCount;
    // x-axis label
    text(table.getColumnTitle(col), width / 2, height * 0.93);
    // y-axis label
    rotate(-PI / 2);
    text("Value", -height / 2, height * 0.023);
    rotate(PI / 2);
    
    //initially set min and max vals
    minVal = table.getFloat(1, col);
    maxVal = table.getFloat(1, col);
    
    float[] vals = new float[table.getRowCount()];
    
    for (int row = 0; row < table.getRowCount(); row++)
    {
      vals[row] = table.getFloat(row, col);
      if (table.getFloat(row, col) < minVal)
        minVal = table.getFloat(row, col);
      else if (table.getFloat(row, col) > maxVal)
        maxVal = table.getFloat(row, col);
      
      if (row + 1 == table.getRowCount())
      { 
        // graph vals
        for (int i = 0; i < table.getRowCount(); i++)
        {
          float xMap = map(i, 0, table.getRowCount(), xAxisX1Val, xAxisX2Val);
          float yMap = map(vals[i], minVal, maxVal, yAxisY1Val, yAxisY2Val + yAxisDivision);
          // aqua
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.01, height * 0.01);
          
          barVal[i] = vals[i];
          barXVal[i] = xMap;
          barYVal[i] = yMap;
          barW[i] = width * 0.00001;
          barH[i] = yAxisY1Val - yMap;
          barNum[i] = i;
        }
      }
    }
  }
  // ------------------------------------------------------------------------------------------
  
  // column 4 ---------------------------------------------------------------------------------
  if (keyCount == 3)
  {
    int col = keyCount;
    // x-axis label
    text(table.getColumnTitle(col), width / 2, height * 0.93);
    // y-axis label
    rotate(-PI / 2);
    text("Value", -height / 2, height * 0.023);
    rotate(PI / 2);
    
    //initially set min and max vals
    minVal = table.getFloat(1, col);
    maxVal = table.getFloat(1, col);
    
    float[] vals = new float[table.getRowCount()];
    
    for (int row = 0; row < table.getRowCount(); row++)
    {
      vals[row] = table.getFloat(row, col);
      if (table.getFloat(row, col) < minVal)
        minVal = table.getFloat(row, col);
      else if (table.getFloat(row, col) > maxVal)
        maxVal = table.getFloat(row, col);
      
      if (row + 1 == table.getRowCount())
      { 
        // graph vals
        for (int i = 0; i < table.getRowCount(); i++)
        {
          float xMap = map(i, 0, table.getRowCount(), xAxisX1Val, xAxisX2Val);
          float yMap = map(vals[i], minVal, maxVal, yAxisY1Val, yAxisY2Val + yAxisDivision);
          // aqua
          stroke(0, 200, 120);
          ellipse(xMap, yMap, width * 0.01, height * 0.01);
          
          barVal[i] = vals[i];
          barXVal[i] = xMap;
          barYVal[i] = yMap;
          barW[i] = width * 0.00001;
          barH[i] = yAxisY1Val - yMap;
          barNum[i] = i;
        }
      }
    }
  }
  // ------------------------------------------------------------------------------------------
}
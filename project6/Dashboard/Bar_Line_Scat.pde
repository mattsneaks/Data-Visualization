void barLineScat()
{ 
  // axes color (off-white)
  stroke(220, 220, 220);
  
  // x-axis lines ---------------------------------------------
  // bar
  float bXAxisX1Val = width * 0.05;
  float bXAxisX2Val = width * 0.5;
  float bXAxisYVal = height * 0.3;
  line (bXAxisX1Val, bXAxisYVal, bXAxisX2Val, bXAxisYVal);
  
  // line
  float lXAxisX1Val = width * 0.55;
  float lXAxisX2Val = width * 0.99;
  line (lXAxisX1Val, bXAxisYVal, lXAxisX2Val, bXAxisYVal);
  
  // scatterplot
  float sXAxisYVal = height * 0.56;
  line (bXAxisX1Val, sXAxisYVal, bXAxisX2Val, sXAxisYVal);
  // ----------------------------------------------------------
  
  // y-axis lines ---------------------------------------------
  // bar
  float bYAxisYVal = height * 0.06;
  float bYAxisLength = bXAxisYVal - bYAxisYVal;
  float bYAxisDivision = bYAxisLength / 9;
  line (bXAxisX1Val, bXAxisYVal, bXAxisX1Val, bYAxisYVal);
  
  // line
  line (lXAxisX1Val, bXAxisYVal, lXAxisX1Val, bYAxisYVal);
  
  // scatterplot
  float sYAxisYVal = height * 0.32;
  line (bXAxisX1Val, sXAxisYVal, bXAxisX1Val, sYAxisYVal);
  // ----------------------------------------------------------
  
  // y-axis ticks ---------------------------------------------
  // bar
  float bTickYAxisX1Val = bXAxisX1Val - (width * 0.005);
  float bTickYAxisX2Val = bXAxisX1Val + (width * 0.005);
  float bTickYAxisXVal = bTickYAxisX1Val - (width * 0.02);
  float bTickYValDivision = (maxVal - minVal) / 8;
  
  // line
  float lTickYAxisX1Val = lXAxisX1Val - (width * 0.005);
  float lTickYAxisX2Val = lXAxisX1Val + (width * 0.005);
  float lTickYAxisXVal = lTickYAxisX1Val - (width * 0.02);
  // ----------------------------------------------------------
  
  // y-axis tick values --------------------------------------------
  float j = sXAxisYVal;
  for (float i = bXAxisYVal; i > bYAxisYVal; i -= bYAxisDivision)
  {
    line(bTickYAxisX1Val, i, bTickYAxisX2Val, i);
    line(lTickYAxisX1Val, i, lTickYAxisX2Val, i);
    line(bTickYAxisX1Val, j, bTickYAxisX2Val, j);
    fill(250);
    // this will change the size of all tick values
    textSize(12);
    text(minVal, bTickYAxisXVal, i);
    text(minVal, lTickYAxisXVal, i);
    text(minVal, bTickYAxisXVal, j);
    minVal += bTickYValDivision;
    j -= bYAxisDivision;
  }
  // ---------------------------------------------------------------
  
  // keep track of chart data ---------------------------------
  // bar
  barVal = new float[table.getRowCount()];
  barXVal = new float[table.getRowCount()];
  barYVal = new float[table.getRowCount()];
  barW = new float[table.getRowCount()];
  barH = new float[table.getRowCount()];
  
  // line
  lineVal = new float[table.getRowCount()];
  lineXVal = new float[table.getRowCount()];
  lineYVal = new float[table.getRowCount()];
  lineW = new float[table.getRowCount()];
  lineH = new float[table.getRowCount()];
  
  // scatter
  scatVal = new float[table.getRowCount()];
  scatXVal = new float[table.getRowCount()];
  scatYVal = new float[table.getRowCount()];
  scatW = new float[table.getRowCount()];
  scatH = new float[table.getRowCount()];
  // ----------------------------------------------------------
  
  // stores values for line chart's connecting lines -----
  float[] lXStorage = new float[table.getRowCount()];
  float[] lYStorage = new float[table.getRowCount()];
  // -----------------------------------------------------
  
  // lavender
  fill(240, 150, 200);
  
  int col = keyCount1;
  // x-axis label
  // this will change the size of all axis labels
  textSize(12);
  text(table.getColumnTitle(col), width * 0.27, height * 0.32);
  text(table.getColumnTitle(col), width * 0.76, height * 0.32);
  text(table.getColumnTitle(col), width * 0.27, height * 0.58);
  
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
        float bXMap = map(i, 0, table.getRowCount(), bXAxisX1Val, bXAxisX2Val);
        float lXMap = map(i, 0, table.getRowCount(), lXAxisX1Val, lXAxisX2Val);
        lXStorage[i] = lXMap;
        float bYMap = map(vals[i], minVal, maxVal, bXAxisYVal, bYAxisYVal + bYAxisDivision);
        float lYMap = map(vals[i], minVal, maxVal, bXAxisYVal, bYAxisYVal + bYAxisDivision);
        lYStorage[i] = lYMap;
        float sYMap = map(vals[i], minVal, maxVal, sXAxisYVal, sYAxisYVal + bYAxisDivision);
        
        // aqua
        stroke(0, 200, 120);
        rect(bXMap, bYMap, width * 0.00001, bXAxisYVal - bYMap);
        ellipse(lXMap, lYMap, width * 0.005, height * 0.005);
        ellipse(bXMap, sYMap, width * 0.005, height * 0.005);
        
        if (i > 0)
          line(lXStorage[i - 1], lYStorage[i - 1], lXStorage[i], lYStorage[i]);
        
        barVal[i] = vals[i];
        barXVal[i] = bXMap;
        barYVal[i] = bYMap;
        barW[i] = width * 0.00001;
        barH[i] = bXAxisYVal - bYMap;
        
        lineVal[i] = vals[i];
        lineXVal[i] = lXMap;
        lineYVal[i] = lYMap;
        lineW[i] = width * 0.00001;
        lineH[i] = bXAxisYVal - lYMap;
        
        scatVal[i] = vals[i];
        scatXVal[i] = bXMap;
        scatYVal[i] = sYMap;
        scatW[i] = width * 0.00001;
        scatH[i] = bXAxisYVal - bYMap;
      }
    }
  }
}
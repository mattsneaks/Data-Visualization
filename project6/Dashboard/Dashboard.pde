Table table;
String fileName;
float min, max, xPos, y1Pos, y2Pos, lineSpace;
float minVal, maxVal;
int keyCount1 = 0, keyCount2 = 0, keyStop1 = 0, keyStop2 = 0;

float barVal[], barXVal[], barYVal[], barW[], barH[];
float lineVal[], lineXVal[], lineYVal[], lineW[], lineH[];
float scatVal[], scatXVal[], scatYVal[], scatW[], scatH[];
float pCVal1[], pCVal2[], pCVal3[], pCVal4[];
float pCX1Val[], pCX2Val[], pCX3Val[], pCX4Val[];
float pCY1Val[], pCY2Val[], pCY3Val[], pCY4Val[];

float barValue, barXValue, barYValue, barWidth, barHeight;
float lineValue, lineXValue, lineYValue, lineWidth, lineHeight;
float scatValue, scatXValue, scatYValue, scatWidth, scatHeight;
float pCValue1, pCValue2, pCValue3, pCValue4;
float pCX1Value, pCX2Value, pCX3Value, pCX4Value;
float pCY1Value, pCY2Value, pCY3Value, pCY4Value;

float col1Pos, col2Pos, col3Pos, col4Pos, tmpPos;
float tickVals1[], tickVals2[], tickVals3[], tickVals4[];
float lineXVals[], tickVals[];
float x1Storage[], x2Storage[], x3Storage[], x4Storage[];
float y1Storage[], y2Storage[], y3Storage[], y4Storage[];

int totalSploms, colCount;
float col1Storage[], col2Storage[], col3Storage[], col4Storage[];
float sX1Storage[], sX2Storage[], sX3Storage[], sX4Storage[], sX5Storage[], sX6Storage[], 
      sX7Storage[], sX8Storage[], sX9Storage[], sX10Storage[], sX11Storage[], sX12Storage[];
float sY1Storage[], sY2Storage[], sY3Storage[], sY4Storage[], sY5Storage[], sY6Storage[], 
      sY7Storage[], sY8Storage[], sY9Storage[], sY10Storage[], sY11Storage[], sY12Storage[];
String labels[];
String xLabel, yLabel;
float min1, max1, min2, max2, min3, max3, min4, max4;
float sW1[], sW2[], sW3[], sW4[], sW5[], sW6[], sW7[], sW8[], sW9[], sW10[], sW11[], sW12[]; 
float sH1[], sH2[], sH3[], sH4[], sH5[], sH6[], sH7[], sH8[], sH9[], sH10[], sH11[], sH12[];
float sWidth1, sWidth2, sWidth3, sWidth4, sWidth5, sWidth6, sWidth7, sWidth8, sWidth9, sWidth10, sWidth11, sWidth12;
float sHeight1, sHeight2, sHeight3, sHeight4, sHeight5, sHeight6, sHeight7, sHeight8, sHeight9, sHeight10, sHeight11, sHeight12;
float x1Val[], x2Val[], x3Val[], x4Val[], x5Val[], x6Val[], x7Val[], x8Val[], x9Val[], x10Val[], x11Val[], x12Val[]; 
float y1Val[], y2Val[], y3Val[], y4Val[], y5Val[], y6Val[], y7Val[], y8Val[], y9Val[], y10Val[], y11Val[], y12Val[];
float x1Value, x2Value, x3Value, x4Value, x5Value, x6Value, x7Value, x8Value, x9Value, x10Value, x11Value, x12Value; 
float y1Value, y2Value, y3Value, y4Value, y5Value, y6Value, y7Value, y8Value, y9Value, y10Value, y11Value, y12Value;
float sX1Value, sX2Value, sX3Value, sX4Value, sX5Value, sX6Value, sX7Value, sX8Value, sX9Value, sX10Value, sX11Value, sX12Value; 
float sY1Value, sY2Value, sY3Value, sY4Value, sY5Value, sY6Value, sY7Value, sY8Value, sY9Value, sY10Value, sY11Value, sY12Value;


void setup()
{
  size(1200, 800);
  selectInput("Select a file to process:", "fileSelected");
}


// still need to put stuff in here
void fileSelected(File selection)
{
  if (selection == null) 
    println("Window was closed or the user hit cancel.");
  else
  {
    println("User selected " + selection.getAbsolutePath());
    table = loadTable(selection.getAbsolutePath(), "header");
    
    // gets actual name of csv file
    fileName = selection.getAbsolutePath();
    File file = new File(fileName);
    fileName = file.getName();
    
    tickVals = new float[table.getRowCount()];
    
    x1Storage = new float[table.getRowCount()];
    y1Storage = new float[table.getRowCount()];
    x2Storage = new float[table.getRowCount()];
    y2Storage = new float[table.getRowCount()];
    x3Storage = new float[table.getRowCount()];
    y3Storage = new float[table.getRowCount()];
    x4Storage = new float[table.getRowCount()];
    y4Storage = new float[table.getRowCount()];
    
    tickVals1 = new float[table.getRowCount()];
    tickVals2 = new float[table.getRowCount()];
    tickVals3 = new float[table.getRowCount()];
    tickVals4 = new float[table.getRowCount()];
    
    col1Storage = new float[table.getRowCount()];
    col2Storage = new float[table.getRowCount()];
    col3Storage = new float[table.getRowCount()];
    col4Storage = new float[table.getRowCount()];
  }
}


void keyPressed()
{
  // for bar, line, and scatterplot -------------------------------------
  if (key == 's' || key == 'S')
    ++keyCount1;
  
  if (fileName.equals("Test Scores.csv"))
    keyStop1 = table.getColumnCount();
  else if (fileName.equals("Iris.csv"))
    keyStop1 = table.getColumnCount() - 1;
  
  if (keyCount1 == keyStop1)
  {
    println("Going back to first attribute.");
    keyCount1 = 0;
  }
  // --------------------------------------------------------------------
  
  // for parallel coordinates -------------------------------------------
  if (key == 'd' || key == 'D')
    ++keyCount2;
    
  keyStop2 = 7;
  
  if (keyCount2 == keyStop2)
  {
    println("Looping back.");
    keyCount2 = 0;
  }
  // --------------------------------------------------------------------
}


void mouseClicked()
{
  for (int i = 0; i < table.getRowCount(); i++)
  {
    if ((mouseX > (barXVal[i] - 10) && mouseX < (barXVal[i] + barW[i] + 10) && mouseY > (barYVal[i] - 10) && mouseY < (barYVal[i] + barH[i] + 10))
       || (mouseX > (lineXVal[i] - 10) && mouseX < (lineXVal[i] + lineW[i] + 10) && mouseY > (lineYVal[i] - 10) && mouseY < (lineYVal[i] + lineH[i] + 10))
       || (mouseX > (scatXVal[i] - 10) && mouseX < (scatXVal[i] + scatW[i] + 10) && mouseY > (scatYVal[i] - 10) && mouseY < (scatYVal[i] + scatH[i] + 10))
       || (mouseX > (x1Storage[i]) && mouseX < (x4Storage[i]) && mouseY > (y1Storage[i]) && mouseY < (y4Storage[i]))
       || (mouseX > (sX1Storage[i] - 10) && mouseX < (sX1Storage[i] + sW1[i] + 10) && mouseY > (sY1Storage[i] - 10) && mouseY < (sY1Storage[i] + sH1[i] + 10))
       || (mouseX > (sX2Storage[i] - 10) && mouseX < (sX2Storage[i] + sW2[i] + 10) && mouseY > (sY2Storage[i] - 10) && mouseY < (sY2Storage[i] + sH2[i] + 10))
       || (mouseX > (sX3Storage[i] - 10) && mouseX < (sX3Storage[i] + sW3[i] + 10) && mouseY > (sY3Storage[i] - 10) && mouseY < (sY3Storage[i] + sH3[i] + 10))
       || (mouseX > (sX4Storage[i] - 10) && mouseX < (sX4Storage[i] + sW4[i] + 10) && mouseY > (sY4Storage[i] - 10) && mouseY < (sY4Storage[i] + sH4[i] + 10))
       || (mouseX > (sX5Storage[i] - 10) && mouseX < (sX5Storage[i] + sW5[i] + 10) && mouseY > (sY5Storage[i] - 10) && mouseY < (sY5Storage[i] + sH5[i] + 10))
       || (mouseX > (sX6Storage[i] - 10) && mouseX < (sX6Storage[i] + sW6[i] + 10) && mouseY > (sY6Storage[i] - 10) && mouseY < (sY6Storage[i] + sH6[i] + 10))
       || (mouseX > (sX7Storage[i] - 10) && mouseX < (sX7Storage[i] + sW7[i] + 10) && mouseY > (sY7Storage[i] - 10) && mouseY < (sY7Storage[i] + sH7[i] + 10))
       || (mouseX > (sX8Storage[i] - 10) && mouseX < (sX8Storage[i] + sW8[i] + 10) && mouseY > (sY8Storage[i] - 10) && mouseY < (sY8Storage[i] + sH8[i] + 10))
       || (mouseX > (sX9Storage[i] - 10) && mouseX < (sX9Storage[i] + sW9[i] + 10) && mouseY > (sY9Storage[i] - 10) && mouseY < (sY9Storage[i] + sH9[i] + 10))
       || (mouseX > (sX10Storage[i] - 10) && mouseX < (sX10Storage[i] + sW10[i] + 10) && mouseY > (sY10Storage[i] - 10) && mouseY < (sY10Storage[i] + sH10[i] + 10))
       || (mouseX > (sX11Storage[i] - 10) && mouseX < (sX11Storage[i] + sW11[i] + 10) && mouseY > (sY11Storage[i] - 10) && mouseY < (sY11Storage[i] + sH11[i] + 10))
       || (mouseX > (sX12Storage[i] - 10) && mouseX < (sX12Storage[i] + sW12[i] + 10) && mouseY > (sY12Storage[i] - 10) && mouseY < (sY12Storage[i] + sH12[i] + 10)))
    { 
      barValue = barVal[i];
      barXValue = barXVal[i];
      barYValue = barYVal[i];
      barWidth = barW[i];
      barHeight = barH[i];
      
      lineValue = lineVal[i];
      lineXValue = lineXVal[i];
      lineYValue = lineYVal[i];
      lineWidth = lineW[i];
      lineHeight = lineH[i];
      
      scatValue = scatVal[i];
      scatXValue = scatXVal[i];
      scatYValue = scatYVal[i];
      scatWidth = scatW[i];
      scatHeight = scatH[i];
      
      pCValue1 = pCVal1[i];
      pCValue2 = pCVal2[i];
      pCValue3 = pCVal3[i];
      pCValue4 = pCVal4[i];
      pCX1Value = pCX1Val[i];
      pCX2Value = pCX2Val[i];
      pCX3Value = pCX3Val[i];
      pCX4Value = pCX4Val[i];
      pCY1Value = pCY1Val[i];
      pCY2Value = pCY2Val[i];
      pCY3Value = pCY3Val[i];
      pCY4Value = pCY4Val[i];
      
      sX1Value = sX1Storage[i];
      sY1Value = sY1Storage[i];
      x1Value = x1Val[i];
      y1Value = y1Val[i];
      sWidth1 = sW1[i];
      sHeight1 = sH1[i];
      
      sX2Value = sX2Storage[i];
      sY2Value = sY2Storage[i];
      x2Value = x2Val[i];
      y2Value = y2Val[i];
      sWidth2 = sW2[i];
      sHeight2 = sH2[i];
      
      sX3Value = sX3Storage[i];
      sY3Value = sY3Storage[i];
      x3Value = x3Val[i];
      y3Value = y3Val[i];
      sWidth3 = sW3[i];
      sHeight3 = sH3[i];
      
      sX4Value = sX4Storage[i];
      sY4Value = sY4Storage[i];
      x4Value = x4Val[i];
      y4Value = y4Val[i];
      sWidth4 = sW4[i];
      sHeight4 = sH4[i];
      
      sX5Value = sX5Storage[i];
      sY5Value = sY5Storage[i];
      x5Value = x5Val[i];
      y5Value = y5Val[i];
      sWidth5 = sW5[i];
      sHeight5 = sH5[i];
      
      sX6Value = sX6Storage[i];
      sY6Value = sY6Storage[i];
      x6Value = x6Val[i];
      y6Value = y6Val[i];
      sWidth6 = sW6[i];
      sHeight6 = sH6[i];
      
      sX7Value = sX7Storage[i];
      sY7Value = sY7Storage[i];
      x7Value = x7Val[i];
      y7Value = y7Val[i];
      sWidth7 = sW7[i];
      sHeight7 = sH7[i];
      
      sX8Value = sX8Storage[i];
      sY8Value = sY8Storage[i];
      x8Value = x8Val[i];
      y8Value = y8Val[i];
      sWidth8 = sW8[i];
      sHeight8 = sH8[i];
      
      sX9Value = sX9Storage[i];
      sY9Value = sY9Storage[i];
      x9Value = x9Val[i];
      y9Value = y9Val[i];
      sWidth9 = sW9[i];
      sHeight9 = sH9[i];
      
      sX10Value = sX10Storage[i];
      sY10Value = sY10Storage[i];
      x10Value = x10Val[i];
      y10Value = y10Val[i];
      sWidth10 = sW10[i];
      sHeight10 = sH10[i];
      
      sX11Value = sX11Storage[i];
      sY11Value = sY11Storage[i];
      x11Value = x11Val[i];
      y11Value = y11Val[i];
      sWidth11 = sW11[i];
      sHeight11 = sH11[i];
      
      sX12Value = sX12Storage[i];
      sY12Value = sY12Storage[i];
      x12Value = x12Val[i];
      y12Value = y12Val[i];
      sWidth12 = sW12[i];
      sHeight12 = sH12[i];
    }
  }
}


void draw()
{
  if (table == null)
    return;
    
  background(0);
  textAlign(CENTER);
  
  // draws axes, labels, and bars
  if (fileName.equals("Test Scores.csv"))
  {
    textSize(15);
    // lemon
    fill(255, 230, 0);
    text("TEST SCORES CSV", width * 0.5, height * 0.05);
    
    barLineScat();
    paraAxesAndLines();
    splom();
  }
  else if (fileName.equals("Iris.csv"))
  {
    textSize(15);
    fill(255, 230, 0);
    text("IRIS CSV", width * 0.17, height * 0.05);
    
    // spring green
    fill(0, 255, 63);
    // draws legend
    text("Legend (parallel only): ", width * 0.35, height * 0.05);
    textSize(14);
    fill(255);
    text("Iris-setosa", width * 0.47, height * 0.05);
    // aqua
    fill(0, 200, 120);
    rect(width * 0.51, height * 0.03, width * 0.015, height * 0.02);
    fill (220, 220, 220);
    text("Iris-versicolor", width * 0.61, height * 0.05);
    // violet
    fill(70, 0, 220);
    rect(width * 0.66, height * 0.03, width * 0.015, height * 0.02);
    fill (220, 220, 220);
    text("Iris-virginica", width * 0.76, height * 0.05);
    // berry
    fill(210, 0, 55);
    rect(width * 0.81, height * 0.03, width * 0.015, height * 0.02);
    fill (220, 220, 220);
    
    barLineScat();
    paraAxesAndLines();
    splom();
  }
  
  textAlign(CENTER);
  textSize(14);
  // electric blue
  fill(0, 135, 255);
  text("Press left mouse button to view values.", width * 0.12, height * 0.02);
  text(" Press 's' to swap for bar, line, & scatter, 'd' for parallel.", width * 0.39, height * 0.02);
  // burnt orange
  fill(255, 110, 0);
  stroke(255, 110, 0);
  text("Value = " + barValue, width * 0.59, height * 0.02);
  text("Splom: (" + x1Value + ", " + y1Value + ")", width * 0.7, height * 0.02);
  text("Parallel: " + pCValue1 + ", " + pCValue2 + ", " + pCValue3 + ", " + pCValue4, width * 0.87, height * 0.02);
  
  // linked views
  strokeWeight(5);
  rect(barXValue, barYValue, barWidth, barHeight);
  ellipse(lineXValue, lineYValue, width * 0.007, height * 0.007);
  ellipse(scatXValue, scatYValue, width * 0.007, height * 0.007);
  line(pCX1Value, pCY1Value, pCX2Value, pCY2Value);
  line(pCX2Value, pCY2Value, pCX3Value, pCY3Value);
  line(pCX3Value, pCY3Value, pCX4Value, pCY4Value);
  ellipse(sX1Value, sY1Value, width * 0.005, height * 0.005);
  ellipse(sX2Value, sY2Value, width * 0.005, height * 0.005);
  ellipse(sX3Value, sY3Value, width * 0.005, height * 0.005);
  ellipse(sX4Value, sY4Value, width * 0.005, height * 0.005);
  ellipse(sX5Value, sY5Value, width * 0.005, height * 0.005);
  ellipse(sX6Value, sY6Value, width * 0.005, height * 0.005);
  ellipse(sX7Value, sY7Value, width * 0.005, height * 0.005);
  ellipse(sX8Value, sY8Value, width * 0.005, height * 0.005);
  ellipse(sX9Value, sY9Value, width * 0.005, height * 0.005);
  ellipse(sX10Value, sY10Value, width * 0.005, height * 0.005);
  ellipse(sX11Value, sY11Value, width * 0.005, height * 0.005);
  ellipse(sX12Value, sY12Value, width * 0.005, height * 0.005);
  
  strokeWeight(1);
  noStroke();
}
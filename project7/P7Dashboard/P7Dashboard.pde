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

int colCount;
float xDiv, yDiv;
float xDivAm, yDivAm;
float col1Store[], col2Store[], col3Store[], col4Store[];
float xMin1, xMax1, xMin2, xMax2, xMin3, xMax3, xMin4, xMax4;
float yMin1, yMax1, yMin2, yMax2, yMin3, yMax3, yMin4, yMax4;
float tmpXTickVal, tmpXDivVal;
float tmpYTickMin, tmpYTickMax;
int tmpYTickVal, tmpYDivVal;
int frequency;
int histStore[];
int histStore1[], histStore2[], histStore3[], histStore4[];
float minX, maxX;
float minY, maxY;
float xTickVals[];
int mean1 = 0, mean2 = 0, mean3 = 0, mean4 = 0;
String smean1, smean2, smean3, smean4;
int m1 = 0, m2 = 0, m3 = 0, m4 = 0;
int denominator;
float dev1 = 0, dev2 = 0, dev3 = 0, dev4 = 0;
String sdev1, sdev2, sdev3, sdev4;
float stdDev1 = 0, stdDev2 = 0, stdDev3 = 0, stdDev4 = 0;

float corrVals[];

void setup()
{
  size(1200, 800);
  selectInput("Select a file to process:", "fileSelected");
}


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
    
    col1Store = new float[table.getRowCount()];
    col2Store = new float[table.getRowCount()];
    col3Store = new float[table.getRowCount()];
    col4Store = new float[table.getRowCount()];
    
    histStore = new int[8];
    histStore1 = new int[8];
    histStore2 = new int[8];
    histStore3 = new int[8];
    histStore4 = new int[8];
    
    xTickVals = new float[8];
    
    corrVals = new float[16];
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
       || (mouseX > (x1Storage[i]) && mouseX < (x4Storage[i]) && mouseY > (y1Storage[i]) && mouseY < (y4Storage[i])))
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
    text("TEST SCORES CSV", width * 0.2, height * 0.05);
    
    barLineScat();
    paraAxesAndLines();
    hist();
    CorrPlot();
  }
  else if (fileName.equals("Iris.csv"))
  {
    textSize(15);
    fill(255, 230, 0);
    text("IRIS CSV", width * 0.04, height * 0.05);
    
    // spring green
    fill(0, 255, 63);
    // draws legend
    text("Legend (parallel only): ", width * 0.16, height * 0.05);
    textSize(14);
    fill(255);
    text("Iris-setosa", width * 0.26, height * 0.05);
    // aqua
    fill(0, 200, 120);
    rect(width * 0.3, height * 0.03, width * 0.015, height * 0.02);
    fill (220, 220, 220);
    text("Iris-versicolor", width * 0.37, height * 0.05);
    // violet
    fill(70, 0, 220);
    rect(width * 0.42, height * 0.03, width * 0.015, height * 0.02);
    fill (220, 220, 220);
    text("Iris-virginica", width * 0.49, height * 0.05);
    // berry
    fill(210, 0, 55);
    rect(width * 0.54, height * 0.03, width * 0.015, height * 0.02);
    fill (220, 220, 220);
    
    barLineScat();
    paraAxesAndLines();
    hist();
    CorrPlot();
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
  text("Parallel: " + pCValue1 + ", " + pCValue2 + ", " + pCValue3 + ", " + pCValue4, width * 0.64, height * 0.05);
  
  // linked views
  strokeWeight(5);
  rect(barXValue, barYValue, barWidth, barHeight);
  ellipse(lineXValue, lineYValue, width * 0.007, height * 0.007);
  ellipse(scatXValue, scatYValue, width * 0.007, height * 0.007);
  line(pCX1Value, pCY1Value, pCX2Value, pCY2Value);
  line(pCX2Value, pCY2Value, pCX3Value, pCY3Value);
  line(pCX3Value, pCY3Value, pCX4Value, pCY4Value);
  
  text("H1: M= " + m1 + ", S = " + sdev1, width * 0.78 , height * 0.02);
  text("H2: M= " + m2 + ", S = " + sdev2, width * 0.92 , height * 0.02);
  text("H3: M= " + m3 + ", S = " + sdev3, width * 0.81 , height * 0.05);
  text("H4: M= " + m4 + ", S = " + sdev4, width * 0.93 , height * 0.05);
  
  strokeWeight(1);
  noStroke();
}
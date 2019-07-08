Table table;
String fileName;
float min, max, xPos, y1Pos, y2Pos, lineSpace;
int keyCount = 0, keyStop = 0;
float col1Pos, col2Pos, col3Pos, col4Pos, tmpPos;

// variables and arrays for pin-pointing graphed values
float barValue1, barValue2, barValue3, barValue4;
float barX1Value, barX2Value, barX3Value, barX4Value;
float barY1Value, barY2Value, barY3Value, barY4Value;
float barVal1[], barVal2[], barVal3[], barVal4[];
float barX1Val[], barX2Val[], barX3Val[], barX4Val[];
float barY1Val[], barY2Val[], barY3Val[], barY4Val[];
float tickVals1[], tickVals2[], tickVals3[], tickVals4[];

// array to hold x values of lines
float[] lineXVals;

// array to hold tick values
float[] tickVals;

// stores x and y values of points on current line
float x1Storage[], x2Storage[], x3Storage[], x4Storage[];
float y1Storage[], y2Storage[], y3Storage[], y4Storage[];

void setup()
{
  size(800, 400);
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
    
    println("Press 's' to swap lines, be sure to click within the sketch first!");
    println("Press the left mouse button over a point to highlight and view its value.");
  }
}

// used for axis swapping
void keyPressed()
{
  if (key == 's' || key == 'S')
    ++keyCount;
    
  keyStop = 7;
  
  if (keyCount == keyStop)
  {
    println("Looping back.");
    keyCount = 0;
  }
}

void mouseClicked()
{
  for (int i = 0; i < table.getRowCount(); i++)
  {
    if (mouseX > (x1Storage[i]) && mouseX < (x4Storage[i]) && mouseY > (y1Storage[i]) && mouseY < (y4Storage[i]))
    { 
      barValue1 = barVal1[i];
      barValue2 = barVal2[i];
      barValue3 = barVal3[i];
      barValue4 = barVal4[i];
      
      barX1Value = barX1Val[i];
      barX2Value = barX2Val[i];
      barX3Value = barX3Val[i];
      barX4Value = barX4Val[i];
      
      barY1Value = barY1Val[i];
      barY2Value = barY2Val[i];
      barY3Value = barY3Val[i];
      barY4Value = barY4Val[i];
    }
  }
}

void draw()
{
  if (table == null)
    return;
  
  // background color (black)
  background(0);
  
  // draws axes, labels, and bars
  if (fileName.equals("Test Scores.csv"))
  {
    // center aligns all text
    textAlign(CENTER);
    textSize(17);
    text("Test Scores", width / 2, height * 0.05);
    axesAndLines();
    textSize(12);
  }
  else if (fileName.equals("Iris.csv"))
  {
    // center aligns all text
    textAlign(CENTER);
    textSize(17);
    text("Iris", width / 2, height * 0.05);
    
    // draws legend
    text("Legend: ", width * 0.05, height * 0.96);
    text("Iris-setosa", width * 0.18, height * 0.96);
    // aqua
    fill(0, 200, 120);
    rect(width * 0.25, height * 0.92, width * 0.03, height * 0.06);
    fill (220, 220, 220);
    text("Iris-versicolor", width * 0.47, height * 0.96);
    // violet
    fill(70, 0, 220);
    rect(width * 0.55, height * 0.92, width * 0.03, height * 0.06);
    fill (220, 220, 220);
    text("Iris-virginica", width * 0.78, height * 0.96);
    // berry
    fill(210, 0, 55);
    rect(width * 0.85, height * 0.92, width * 0.03, height * 0.06);
    fill (220, 220, 220);
    
    axesAndLines();
    
    textSize(12);
  }
  
  textSize(15);
  // electric blue
  fill(0, 135, 255);
  text("Press 's' to swap lines", width * 0.15, height * 0.09);
  text("Press left mouse button line to view values", width * 0.5, height * 0.09);
  //text("Value = " + barValue, width * 0.85, height * 0.09);
  text("Value = " + barValue1 + ", " + barValue2 + ", " + barValue3 + ", " + barValue4, width * 0.85, height * 0.09);
  textSize(12);
  
  // burnt orange
  fill(255, 110, 0);
  stroke(255, 110, 0);
  
  //ellipse(barXValue, barYValue, width * 0.01, height * 0.01);
  strokeWeight(3);
  line(barX1Value, barY1Value, barX2Value, barY2Value);
  line(barX2Value, barY2Value, barX3Value, barY3Value);
  line(barX3Value, barY3Value, barX4Value, barY4Value);
  
  strokeWeight(1);
  noStroke();
  fill(220, 220, 220);
}
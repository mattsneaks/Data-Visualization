Table table;
String fileName;
float minVal, maxVal;
int keyCount = 0;
int keyStop = 0;
float barVal[];
float barValue;
float barXVal[];
float barXValue;
float barYVal[];
float barYValue;
float barW[];
float barWidth;
float barH[];
float barHeight;
int barNum[];
int barNumber;

void setup()
{
  size(800, 600);
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
    println("Press 's' to change attribute, be sure to click within the sketch first!");
    println("Press the left mouse button over a point to view its value.");
  }
}

void keyPressed()
{
  if (key == 's' || key == 'S')
    ++keyCount;
  
  if (fileName.equals("Test Scores.csv"))
    keyStop = table.getColumnCount();
  else if (fileName.equals("Iris.csv") || fileName.equals("Auto.csv"))
    keyStop = table.getColumnCount() - 1;
  
  if (keyCount == keyStop)
  {
    println("Going back to first attribute.");
    keyCount = 0;
  }
}

void mouseClicked()
{
  for (int i = 0; i < table.getRowCount(); i++)
  {
    if (mouseX > (barXVal[i] - 10) && mouseX < (barXVal[i] + barW[i] + 10) && mouseY > (barYVal[i] - 10) && mouseY < (barYVal[i] + barH[i] + 10))
    {
      println("Value of Point "  + barNum[i] + " = " + barVal[i]);
      
      barValue = barVal[i];
      barXValue = barXVal[i];
      barYValue = barYVal[i];
      barWidth = barW[i];
      barHeight = barH[i];
      barNumber = barNum[i];
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
    text("Test Scores", width / 2, height * 0.05);
    axesAndLines();
  }
  else if (fileName.equals("Iris.csv"))
  {
    text("Iris", width / 2, height * 0.05);
    axesAndLines();
  }
  else if (fileName.equals("Auto.csv"))
  {
    text("Auto", width / 2, height * 0.05);
    axesAndLines();
  }
  
  text("Value = " + barValue, width * 0.1, height * 0.09);
}
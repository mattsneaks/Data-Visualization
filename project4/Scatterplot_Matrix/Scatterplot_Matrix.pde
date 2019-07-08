Frame myFrame = null;
Table table;
float bigPlotX;
float bigPlotY;
float bigPlotW;
float bigPlotH;

void setup()
{
  size (800, 600);
  selectInput("Select a file to process: " , "fileSelected");
}

void fileSelected(File selection)
{
  if (selection == null)
    println("Window was closed or user hit cancel.");
  else
  {
    println("User selected " + selection.getAbsolutePath());
    table = loadTable(selection.getAbsolutePath(), "header");
  }  
  
  ArrayList<Integer> useColumns = new ArrayList<Integer>();
  
  // reads the type of each column in csv file (only important part is add surrounded by if statement)
  for (int i = 0; i < table.getColumnCount(); i++)
  {
    if (!Float.isNaN(table.getRow(0).getFloat(i)))
    {
      println(i + " - type float");
      useColumns.add(i);
    }
    else
      println(i + " - type string");
  }
  
  myFrame = new Splom(table, useColumns);
}

void draw()
{
  // background color (black)
  background(0);
  
  if(table == null) 
    return;
  
  if(myFrame != null)
  {
    // encloses the entire window
    myFrame.setPosition(0, 0, width, height);
    myFrame.draw();
  }
}

void mousePressed()
{
  myFrame.mousePressed();
}

abstract class Frame
{
  int u0, v0, w, h;
  int clickBuffer = 2;
  
  // sets position of scatterplot
  void setPosition(int u0, int v0, int w, int h )
  {
    this.u0 = u0;
    this.v0 = v0;
    this.w = w;
    this.h = h;
  }
  
  // inherited in Scatterplot tab
  abstract void draw();
  
  void mousePressed(){};
  
  boolean mouseInside()
  {
    return (u0 - clickBuffer < mouseX) && (u0 + w + clickBuffer > mouseX) && (v0 - clickBuffer < mouseY) && (v0 + w + clickBuffer > mouseY);
  }
}
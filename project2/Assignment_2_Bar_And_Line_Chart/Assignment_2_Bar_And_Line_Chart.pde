Table table;

void setup()
{
  size(600, 600);
  
  selectInput("Select a file to process:", "fileSelected");
  
  // loadTable function
  table = loadTable("project 2 data file.csv", "header");
}


void fileSelected(File selection)
{
  if (selection == null) 
  {
    println("Window was closed or the user hit cancel.");
  } 
  else 
  {
    println("User selected " + selection.getAbsolutePath());
  }
}


void draw()
{
  if (table == null)
    return;
  
  // background color (white)
  background(255);
  
  // axes color (black)
  stroke(0);
  
  // x-axis line
  float x_axis_x1_val = width * 0.1;
  float x_axis_y1_val = height * 0.9;
  float x_axis_x2_val = width * 0.9;
  float x_axis_y2_val = height * 0.9;
  line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
  
  // y-axis line
  float y_axis_x1_val = width * 0.1;
  float y_axis_y1_val = height * 0.9;
  float y_axis_x2_val = width * 0.1;
  float y_axis_y2_val = height * 0.1;
  line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);

  // center aligns all text
  textAlign(CENTER);
  
  // title
  text("Political Party Values", width / 2, height * 0.02);
  
  //x-axis label
  //text("Year", ,);
  text("Year", width / 2, height * 0.99);
  
  // y-axis label
  rotate(-PI / 2);
  text("VALUE", width * -0.5, height * 0.023);
  rotate(PI / 2);
  
  // x-axis length
  float x_axis_length = x_axis_x2_val - x_axis_x1_val;
  
  // y-axis length
  float y_axis_length = y_axis_y1_val - y_axis_y2_val;
  
  // x-axis divisions
  float x_axis_division = x_axis_length / (table.getRowCount() + 1);
  
  // x-axis tick
  float tick_x_axis_x_val = x_axis_x1_val + x_axis_division;
  // USEFUL FOR LATER PROJECTS
  //float tick_x_axis_y1_val = height * 0.89;
  //float tick_x_axis_y2_val = height * 0.91;
  
  // y-axis tick
  //float tick_y_axis_y_val = y_axis_y2_val + y_axis_division;
  float tick_y_axis_x1_val = width * 0.09;
  float tick_y_axis_x2_val = width * 0.11;
  
  // x-axis tick location
  float tick_x_axis_y_num = height * 0.95;
  
  // y-axis tick location
  float tick_y_axis_x_num = width * 0.06;
  
  float[] x_vals = new float[7];
  float[] y_vals = new float[7];
  int count = 0;
  
  float[] other_y_vals = new float[7];
  int y_counter = 0;
  
  for (TableRow row : table.rows())
  {
    int year = row.getInt("YEAR");
    float value0 = row.getFloat("VALUE0");
    int value1 = row.getInt("VALUE1");
    String party = row.getString("PARTY");
    
    // draw x-axis tick mark
    // USEFUL FOR LATER PROJECTS
    //line(tick_x_axis_x_val, tick_x_axis_y1_val, tick_x_axis_x_val, tick_x_axis_y2_val);
    // show year
    text(year, tick_x_axis_x_val, tick_x_axis_y_num);
    
    // color bar
    if (party.equals("DEM"))
      fill(0, 0, 255);
    else if (party.equals("REP"))
      fill(255, 0, 0);
    
    // draw bar
    rect(tick_x_axis_x_val - (0.25 * x_axis_division), y_axis_y1_val - (value0 * height * 0.01), x_axis_division / 2, (value0 * height * 0.01));
    //text(value0, tick_x_axis_x_val - (0.01 * x_axis_division), (y_axis_y1_val - (value0 * height * 0.0105)));
    
    // draw point
    float x_point = tick_x_axis_x_val - (0.05 * x_axis_division);
    x_vals[count] = x_point;
    float y_point = y_axis_y1_val - (value1 * 4.5);
    y_vals[count] = y_point;
    ellipse(x_point, y_point, width * 0.015, height * 0.015);
    
    fill(0);
    text(value0, tick_x_axis_x_val - (0.01 * x_axis_division), (y_axis_y1_val - (value0 * height * 0.0105)));
    
    if (count - 1 < 0)
      line(x_point, y_point, x_point, y_point);
    else
      line(x_vals[count - 1], y_vals[count - 1], x_point, y_point);
    
    count++;
    
    // draw corresponding tick
    //line(tick_y_axis_x1_val, y_axis_y1_val - (value0 * height * 0.01), tick_y_axis_x2_val, y_axis_y1_val - (value0 * height * 0.01));
    //line(tick_y_axis_x1_val, y_axis_y1_val - (value1 * 5), tick_y_axis_x2_val, y_axis_y1_val - (value1 * 5));
    // draw corresponding value
    //text(value0, tick_y_axis_x_num, (y_axis_y1_val - (value0 * height * 0.01) + (height * 0.005)));
    //text(value1, tick_y_axis_x_num, (y_axis_y1_val - (value1 * 5) + (height * 0.005)));
    
    // increment x-axis ticks
    tick_x_axis_x_val += x_axis_division;
    
    // create array to store y-axis values
    other_y_vals[y_counter] = value1;
    
    y_counter++;
    
    // create y-axis tick marks and values based off max value
    if (y_counter == table.getRowCount())
    {
      float max_y_value = round(max(other_y_vals));
      float y_axis_division = y_axis_length / (table.getRowCount() + 1);
      //float y_axis_division = y_axis_length / max_y_value;
      float tick_y_axis_y_val = y_axis_y2_val + y_axis_division;
      float current_val = max_y_value;
      
      //for (float i = tick_y_axis_y_val; i < y_axis_length; i += y_axis_division) 
      for (int i = 0; i < y_counter + 1; i++) 
      {
        line(tick_y_axis_x1_val, tick_y_axis_y_val, tick_y_axis_x2_val, tick_y_axis_y_val);
        text(current_val, tick_y_axis_x_num, tick_y_axis_y_val);
        current_val = current_val - (max_y_value / y_counter);
        tick_y_axis_y_val += y_axis_division;
      }
    }
  }
  
  // drawing the legend
  text("Legend:", width / 1.5, height * 0.06);
  
  fill(0, 0, 255);
  rect(width / 1.4, height * 0.045, width * 0.02, height * 0.02);
  fill(0);
  text("= DEM", width / 1.3, height * 0.06);
  
  fill(255, 0, 0);
  rect(width / 1.21, height * 0.045, width * 0.02, height * 0.02);
  fill(0);
  text("= REP", width / 1.14, height * 0.06);
  
  fill(0);
  stroke(0);
}
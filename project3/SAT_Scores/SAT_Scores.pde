Table table;



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
    println("User selected " + selection.getAbsolutePath());
    
  // loadTable function
  table = loadTable(selection.getAbsolutePath(), "header");
}



void draw()
{
  // TABLE CHECKING SECTION
  if (table == null)
    return; 
    
  
  // BASIC PARTS COLORS SECTION
  // background color (white)
  background(255);
  // axes color (black)
  stroke(0);
  // font color (black)
  fill(0);
  
  
  // AXIS LINES SECTION
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
  
  if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
  {
    // TEXT SECTION
    // center aligns all text
    textAlign(CENTER);
    // title
    text("SATM VS SATV TEST SCORES", width / 2, height * 0.02);
    //x-axis label
    text("SATM", width / 2, height * 0.99);
    // y-axis label
    rotate(-PI / 2);
    text("SATV", width / -2.5, height * 0.023);
    rotate(PI / 2);
  }
  else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
  {
    // TEXT SECTION
    // center aligns all text
    textAlign(CENTER);
    // title
    text("YEAR VS HORSEPOWER", width / 2, height * 0.02);
    //x-axis label
    text("YEAR", width / 2, height * 0.99);
    // y-axis label
    rotate(-PI / 2);
    text("HORSEPOWER", width / -2.5, height * 0.023);
    rotate(PI / 2);
  }
  
  
  // AXIS LENGTHS SECTION
  // x-axis length
  float x_axis_length = x_axis_x2_val - x_axis_x1_val;
  // y-axis length
  float y_axis_length = y_axis_y1_val - y_axis_y2_val;
  
  
  // AXIS TICKS SECTION
  // x-axis tick
  float tick_x_axis_y1_val = height * 0.89;
  float tick_x_axis_y2_val = height * 0.91;
  // y-axis tick
  float tick_y_axis_x1_val = width * 0.09;
  float tick_y_axis_x2_val = width * 0.11;
  // x-axis tick value location
  float tick_x_axis_y_val = height * 0.95;
  // y-axis tick value location
  float tick_y_axis_x_val = width * 0.06;
  
  
  // ---------------------------------------------------------------------------- FOR FIRST DATA FILE --------------------------------------------------------------
  // ARRAY-STORED DATA SECTION
  if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
  {
    int[] x_vals = new int[271];
    int[] y_vals = new int[271];
    int count = 0;
  
  
    // DATA GATHERING SECTION
    for (TableRow row : table.rows())
    {
      // csv data values sub-section
      int SATM = row.getInt("SATM");
      int SATV = row.getInt("SATV");
      
      // building and incrementing array sub-section
      x_vals[count] = SATM;
      y_vals[count] = SATV;
      count++;
    
      // tick and value-plotting sub-section
      // create x and y-axis tick marks and values based off csv file values
      if (count == table.getRowCount())
      {
        // 0 value sub-section
        int zero_x_value = min(x_vals);
        float zero_x_value_x_location = x_axis_x1_val;
        line(zero_x_value_x_location, tick_x_axis_y1_val, zero_x_value_x_location, tick_x_axis_y2_val);
        text(zero_x_value, zero_x_value_x_location, tick_x_axis_y_val);
        int zero_y_value = min(y_vals);
        float zero_y_value_y_location = y_axis_y1_val;
        line(tick_y_axis_x1_val, zero_y_value_y_location, tick_y_axis_x2_val, zero_y_value_y_location);
        text(zero_y_value, tick_y_axis_x_val, zero_y_value_y_location);
      
        // max value sub-section
        int max_x_value = max(x_vals);
        float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
        line(max_x_value_x_location, tick_x_axis_y1_val, max_x_value_x_location, tick_x_axis_y2_val);
        text(max_x_value, max_x_value_x_location, tick_x_axis_y_val);
        int max_y_value = max(y_vals);
        float max_y_value_y_location = y_axis_length - (height * 0.68); 
        line(tick_y_axis_x1_val, max_y_value_y_location, tick_y_axis_x2_val, max_y_value_y_location);
        text(max_y_value, tick_y_axis_x_val, max_y_value_y_location);
      
        // mid value sub-section
        int mid_x_value = (zero_x_value + max_x_value) / 2;
        float mid_x_value_x_location = zero_x_value_x_location + (x_axis_length / 2);
        line(mid_x_value_x_location, tick_x_axis_y1_val, mid_x_value_x_location, tick_x_axis_y2_val);
        text(mid_x_value, mid_x_value_x_location, tick_x_axis_y_val);
        int mid_y_value = (zero_y_value + max_y_value) / 2;
        float mid_y_value_y_location = zero_y_value_y_location - (y_axis_length / 2);
        line(tick_y_axis_x1_val, mid_y_value_y_location, tick_y_axis_x2_val, mid_y_value_y_location);
        text(mid_y_value, tick_y_axis_x_val, mid_y_value_y_location);
      
        // first quarter sub-section
        int first_quarter_x_value = (zero_x_value + mid_x_value) / 2;
        float first_quarter_x_value_x_location = (zero_x_value_x_location + mid_x_value_x_location) / 2;
        line(first_quarter_x_value_x_location, tick_x_axis_y1_val, first_quarter_x_value_x_location, tick_x_axis_y2_val);
        text(first_quarter_x_value, first_quarter_x_value_x_location, tick_x_axis_y_val);
        int first_quarter_y_value = (zero_y_value + mid_y_value) / 2;
        float first_quarter_y_value_y_location = (zero_y_value_y_location + mid_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, first_quarter_y_value_y_location, tick_y_axis_x2_val, first_quarter_y_value_y_location);
        text(first_quarter_y_value, tick_y_axis_x_val, first_quarter_y_value_y_location);
      
        // third quarter sub-section
        int third_quarter_x_value = (mid_x_value + max_x_value) / 2;
        float third_quarter_x_value_x_location = (mid_x_value_x_location + max_x_value_x_location) / 2;
        line(third_quarter_x_value_x_location, tick_x_axis_y1_val, third_quarter_x_value_x_location, tick_x_axis_y2_val);
        text(third_quarter_x_value, third_quarter_x_value_x_location, tick_x_axis_y_val);
        int third_quarter_y_value = (mid_y_value + max_y_value) / 2;
        float third_quarter_y_value_y_location = (mid_y_value_y_location + max_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, third_quarter_y_value_y_location, tick_y_axis_x2_val, third_quarter_y_value_y_location);
        text(third_quarter_y_value, tick_y_axis_x_val, third_quarter_y_value_y_location);
        
        // first eighth value sub-section
        int first_eighth_x_value = (zero_x_value + first_quarter_x_value) / 2;
        float first_eighth_x_value_x_location = (zero_x_value_x_location + first_quarter_x_value_x_location) / 2;
        line(first_eighth_x_value_x_location, tick_x_axis_y1_val, first_eighth_x_value_x_location, tick_x_axis_y2_val);
        text(first_eighth_x_value, first_eighth_x_value_x_location, tick_x_axis_y_val);
        int first_eighth_y_value = (zero_y_value + first_quarter_y_value) / 2;
        float first_eighth_y_value_y_location = (zero_y_value_y_location + first_quarter_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, first_eighth_y_value_y_location, tick_y_axis_x2_val, first_eighth_y_value_y_location);
        text(first_eighth_y_value, tick_y_axis_x_val, first_eighth_y_value_y_location);
      
        // second eighth value sub-section
        int second_eighth_x_value = (first_quarter_x_value + mid_x_value) / 2;
        float second_eighth_x_value_x_location = (first_quarter_x_value_x_location + mid_x_value_x_location) / 2;
        line(second_eighth_x_value_x_location, tick_x_axis_y1_val, second_eighth_x_value_x_location, tick_x_axis_y2_val);
        text(second_eighth_x_value, second_eighth_x_value_x_location, tick_x_axis_y_val);
        int second_eighth_y_value = (first_quarter_y_value + mid_y_value) / 2;
        float second_eighth_y_value_y_location = (first_quarter_y_value_y_location + mid_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, second_eighth_y_value_y_location, tick_y_axis_x2_val, second_eighth_y_value_y_location);
        text(second_eighth_y_value, tick_y_axis_x_val, second_eighth_y_value_y_location);
        
        // third eighth value sub-section
        int third_eighth_x_value = (mid_x_value + third_quarter_x_value) / 2;
        float third_eighth_x_value_x_location = (mid_x_value_x_location + third_quarter_x_value_x_location) / 2;
        line(third_eighth_x_value_x_location, tick_x_axis_y1_val, third_eighth_x_value_x_location, tick_x_axis_y2_val);
        text(third_eighth_x_value, third_eighth_x_value_x_location, tick_x_axis_y_val);
        int third_eighth_y_value = (mid_y_value + third_quarter_y_value) / 2;
        float third_eighth_y_value_y_location = (mid_y_value_y_location + third_quarter_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, third_eighth_y_value_y_location, tick_y_axis_x2_val, third_eighth_y_value_y_location);
        text(third_eighth_y_value, tick_y_axis_x_val, third_eighth_y_value_y_location);
      
        // fourth eighth value sub-section
        int fourth_eighth_x_value = (third_quarter_x_value + max_x_value) / 2;
        float fourth_eighth_x_value_x_location = (third_quarter_x_value_x_location + max_x_value_x_location) / 2;
        line(fourth_eighth_x_value_x_location, tick_x_axis_y1_val, fourth_eighth_x_value_x_location, tick_x_axis_y2_val);
        text(fourth_eighth_x_value, fourth_eighth_x_value_x_location, tick_x_axis_y_val);
        int fourth_eighth_y_value = (third_quarter_y_value + max_y_value) / 2;
        float fourth_eighth_y_value_y_location = (third_quarter_y_value_y_location + max_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, fourth_eighth_y_value_y_location, tick_y_axis_x2_val, fourth_eighth_y_value_y_location);
        text(fourth_eighth_y_value, tick_y_axis_x_val, fourth_eighth_y_value_y_location);
      
        for (int i = 0; i < count; i++) 
        {
          float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
          float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
          ellipse(x_map, y_map, width * 0.007, height * 0.007);
        }
      }
    }
  }
  
  
  // ---------------------------------------------------------------------------- FOR SECOND DATA FILE --------------------------------------------------------------
  // ARRAY-STORED DATA SECTION
  else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
  {
    int[] x_vals = new int[255];
    int[] y_vals = new int[255];
    int count = 0;
  
  
    // DATA GATHERING SECTION
    for (TableRow row : table.rows())
    {
      // csv data values sub-section
      int year = row.getInt("Year");
      int horsepower = row.getInt("Horsepower");
      
      // building and incrementing array sub-section
      x_vals[count] = year;
      y_vals[count] = horsepower;
      count++;
    
      // tick and value-plotting sub-section
      // create x and y-axis tick marks and values based off csv file values
      if (count == table.getRowCount())
      {
        // 0 value sub-section
        int zero_x_value = min(x_vals);
        float zero_x_value_x_location = x_axis_x1_val;
        line(zero_x_value_x_location, tick_x_axis_y1_val, zero_x_value_x_location, tick_x_axis_y2_val);
        text(zero_x_value, zero_x_value_x_location, tick_x_axis_y_val);
        int zero_y_value = min(y_vals);
        float zero_y_value_y_location = y_axis_y1_val;
        line(tick_y_axis_x1_val, zero_y_value_y_location, tick_y_axis_x2_val, zero_y_value_y_location);
        text(zero_y_value, tick_y_axis_x_val, zero_y_value_y_location);
      
        // max value sub-section
        int max_x_value = max(x_vals);
        float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
        line(max_x_value_x_location, tick_x_axis_y1_val, max_x_value_x_location, tick_x_axis_y2_val);
        text(max_x_value, max_x_value_x_location, tick_x_axis_y_val);
        int max_y_value = max(y_vals);
        float max_y_value_y_location = y_axis_length - (height * 0.68); 
        line(tick_y_axis_x1_val, max_y_value_y_location, tick_y_axis_x2_val, max_y_value_y_location);
        text(max_y_value, tick_y_axis_x_val, max_y_value_y_location);
      
        // mid value sub-section
        int mid_x_value = (zero_x_value + max_x_value) / 2;
        float mid_x_value_x_location = zero_x_value_x_location + (x_axis_length / 2);
        line(mid_x_value_x_location, tick_x_axis_y1_val, mid_x_value_x_location, tick_x_axis_y2_val);
        text(mid_x_value, mid_x_value_x_location, tick_x_axis_y_val);
        int mid_y_value = (zero_y_value + max_y_value) / 2;
        float mid_y_value_y_location = zero_y_value_y_location - (y_axis_length / 2);
        line(tick_y_axis_x1_val, mid_y_value_y_location, tick_y_axis_x2_val, mid_y_value_y_location);
        text(mid_y_value, tick_y_axis_x_val, mid_y_value_y_location);
      
        // first quarter sub-section
        int first_quarter_x_value = (zero_x_value + mid_x_value) / 2;
        float first_quarter_x_value_x_location = (zero_x_value_x_location + mid_x_value_x_location) / 2;
        line(first_quarter_x_value_x_location, tick_x_axis_y1_val, first_quarter_x_value_x_location, tick_x_axis_y2_val);
        text(first_quarter_x_value, first_quarter_x_value_x_location, tick_x_axis_y_val);
        int first_quarter_y_value = (zero_y_value + mid_y_value) / 2;
        float first_quarter_y_value_y_location = (zero_y_value_y_location + mid_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, first_quarter_y_value_y_location, tick_y_axis_x2_val, first_quarter_y_value_y_location);
        text(first_quarter_y_value, tick_y_axis_x_val, first_quarter_y_value_y_location);
      
        // third quarter sub-section
        int third_quarter_x_value = (mid_x_value + max_x_value) / 2;
        float third_quarter_x_value_x_location = (mid_x_value_x_location + max_x_value_x_location) / 2;
        line(third_quarter_x_value_x_location, tick_x_axis_y1_val, third_quarter_x_value_x_location, tick_x_axis_y2_val);
        text(third_quarter_x_value, third_quarter_x_value_x_location, tick_x_axis_y_val);
        int third_quarter_y_value = (mid_y_value + max_y_value) / 2;
        float third_quarter_y_value_y_location = (mid_y_value_y_location + max_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, third_quarter_y_value_y_location, tick_y_axis_x2_val, third_quarter_y_value_y_location);
        text(third_quarter_y_value, tick_y_axis_x_val, third_quarter_y_value_y_location);
        
        // first eighth value sub-section
        int first_eighth_x_value = (zero_x_value + first_quarter_x_value) / 2;
        float first_eighth_x_value_x_location = (zero_x_value_x_location + first_quarter_x_value_x_location) / 2;
        line(first_eighth_x_value_x_location, tick_x_axis_y1_val, first_eighth_x_value_x_location, tick_x_axis_y2_val);
        text(first_eighth_x_value, first_eighth_x_value_x_location, tick_x_axis_y_val);
        int first_eighth_y_value = (zero_y_value + first_quarter_y_value) / 2;
        float first_eighth_y_value_y_location = (zero_y_value_y_location + first_quarter_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, first_eighth_y_value_y_location, tick_y_axis_x2_val, first_eighth_y_value_y_location);
        text(first_eighth_y_value, tick_y_axis_x_val, first_eighth_y_value_y_location);
      
        // second eighth value sub-section
        int second_eighth_x_value = (first_quarter_x_value + mid_x_value) / 2;
        float second_eighth_x_value_x_location = (first_quarter_x_value_x_location + mid_x_value_x_location) / 2;
        line(second_eighth_x_value_x_location, tick_x_axis_y1_val, second_eighth_x_value_x_location, tick_x_axis_y2_val);
        text(second_eighth_x_value, second_eighth_x_value_x_location, tick_x_axis_y_val);
        int second_eighth_y_value = (first_quarter_y_value + mid_y_value) / 2;
        float second_eighth_y_value_y_location = (first_quarter_y_value_y_location + mid_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, second_eighth_y_value_y_location, tick_y_axis_x2_val, second_eighth_y_value_y_location);
        text(second_eighth_y_value, tick_y_axis_x_val, second_eighth_y_value_y_location);
        
        // third eighth value sub-section
        int third_eighth_x_value = (mid_x_value + third_quarter_x_value) / 2;
        float third_eighth_x_value_x_location = (mid_x_value_x_location + third_quarter_x_value_x_location) / 2;
        line(third_eighth_x_value_x_location, tick_x_axis_y1_val, third_eighth_x_value_x_location, tick_x_axis_y2_val);
        text(third_eighth_x_value, third_eighth_x_value_x_location, tick_x_axis_y_val);
        int third_eighth_y_value = (mid_y_value + third_quarter_y_value) / 2;
        float third_eighth_y_value_y_location = (mid_y_value_y_location + third_quarter_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, third_eighth_y_value_y_location, tick_y_axis_x2_val, third_eighth_y_value_y_location);
        text(third_eighth_y_value, tick_y_axis_x_val, third_eighth_y_value_y_location);
      
        // fourth eighth value sub-section
        int fourth_eighth_x_value = (third_quarter_x_value + max_x_value) / 2;
        float fourth_eighth_x_value_x_location = (third_quarter_x_value_x_location + max_x_value_x_location) / 2;
        line(fourth_eighth_x_value_x_location, tick_x_axis_y1_val, fourth_eighth_x_value_x_location, tick_x_axis_y2_val);
        text(fourth_eighth_x_value, fourth_eighth_x_value_x_location, tick_x_axis_y_val);
        int fourth_eighth_y_value = (third_quarter_y_value + max_y_value) / 2;
        float fourth_eighth_y_value_y_location = (third_quarter_y_value_y_location + max_y_value_y_location) / 2;
        line(tick_y_axis_x1_val, fourth_eighth_y_value_y_location, tick_y_axis_x2_val, fourth_eighth_y_value_y_location);
        text(fourth_eighth_y_value, tick_y_axis_x_val, fourth_eighth_y_value_y_location);
      
        for (int i = 0; i < count; i++) 
        {
          float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
          float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
          ellipse(x_map, y_map, width * 0.007, height * 0.007);
        }
      }
    }
  }
}
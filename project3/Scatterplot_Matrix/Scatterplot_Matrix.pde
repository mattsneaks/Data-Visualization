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
  int plot_counter = 0;
  
  
  
  
  
  
  // -------------------------------------------------------------------- LEFT UPPER (SATM & SATV) OR (YEAR & HORSEPOWER) ----------------------------------------------------------------------
  if (plot_counter == 0)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.05;
    float x_axis_y1_val = height * 0.21;
    float x_axis_x2_val = width * 0.3;
    float x_axis_y2_val = height * 0.21;
    line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.05;
    float y_axis_y1_val = height * 0.21;
    float y_axis_x2_val = width * 0.05;
    float y_axis_y2_val = height * 0.005;
    line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 1A ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        //x-axis label
        text("SATM", width / 6, height * 0.23);
        // y-axis label
        rotate(-PI / 2);
        text("SATV", width / -12, height * 0.05);
        rotate(PI / 2);
    }
    else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
    {
      // TEXT SECTION
      // center aligns all text
      textAlign(CENTER);
      //x-axis label
      text("YEAR", width / 6, height * 0.23);
      // y-axis label
      rotate(-PI / 2);
      text("HORSEPOWER", width / -12, height * 0.05);
      rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
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
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          int max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015); 
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
    
    ///////////////////////////////////////////////////////////////////// DATASET 1B ///////////////////////////////////////////////////////////
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
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
        
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          int max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015); 
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
  }
  ++plot_counter;
  
    
    
    
    
  // -------------------------------------------------------------------- LEFT UPPER MIDDLE (SATV & SATM) OR (HORSEPOWER & YEAR) ----------------------------------------------------------------------
  if (plot_counter == 1)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.05;
    float x_axis_y1_val = height * 0.44;
    float x_axis_x2_val = width * 0.3;
    float x_axis_y2_val = height * 0.44;
    line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.05;
    float y_axis_y1_val = height * 0.44;
    float y_axis_x2_val = width * 0.05;
    float y_axis_y2_val = height * 0.25;
    line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 2A ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        //x-axis label
        text("SATV", width / 6, height * 0.46);
        // y-axis label
        rotate(-PI / 2);
        text("SATM", width / -4, height * 0.05);
        rotate(PI / 2);
    }
    else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
    {
      // TEXT SECTION
      // center aligns all text
      textAlign(CENTER);
      //x-axis label
      text("HORSEPOWER", width / 6, height * 0.46);
      // y-axis label
      rotate(-PI / 2);
      text("YEAR", width / -4, height * 0.05);
      rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      int[] x_vals = new int[271];
      int[] y_vals = new int[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int SATV = row.getInt("SATV");
        int SATM = row.getInt("SATM");
      
        // building and incrementing array sub-section
        x_vals[count] = SATV;
        y_vals[count] = SATM;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(x_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          int max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015); 
          
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
    
    ///////////////////////////////////////////////////////////////////// DATASET 2B ///////////////////////////////////////////////////////////
    else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
    {
      int[] x_vals = new int[255];
      int[] y_vals = new int[255];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int horsepower = row.getInt("Horsepower");
        int year = row.getInt("Year");
        
        // building and incrementing array sub-section
        x_vals[count] = horsepower;
        y_vals[count] = year;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
        
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          int max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015); 
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
  }
  ++plot_counter;
  
  
  
  
  // -------------------------------------------------------------------- LEFT LOWER MIDDLE (SATM & ACT) OR (YEAR & WEIGHT) ----------------------------------------------------------------------
  if (plot_counter == 2)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.05;
    float x_axis_y1_val = height * 0.64;
    float x_axis_x2_val = width * 0.3;
    float x_axis_y2_val = height * 0.64;
    line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.05;
    float y_axis_y1_val = height * 0.64;
    float y_axis_x2_val = width * 0.05;
    float y_axis_y2_val = height * 0.46;
    line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 3A ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        // title
        //x-axis label
        text("SATM", width / 6, height * 0.66);
        // y-axis label
        rotate(-PI / 2);
        text("ACT", width / -2.4, height * 0.05);
        rotate(PI / 2);
    }
    else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
    {
      // TEXT SECTION
      // center aligns all text
      textAlign(CENTER);
      //x-axis label
      text("YEAR", width / 6, height * 0.66);
      // y-axis label
      rotate(-PI / 2);
      text("WIEGHT", width / -2.4, height * 0.05);
      rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      int[] x_vals = new int[271];
      int[] y_vals = new int[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int SATM = row.getInt("SATM");
        int ACT = row.getInt("ACT");
      
        // building and incrementing array sub-section
        x_vals[count] = SATM;
        y_vals[count] = ACT;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          int max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015); 
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
    
    ///////////////////////////////////////////////////////////////////// DATASET 3B ///////////////////////////////////////////////////////////
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
        int weight = row.getInt("Weight (lb)");
        
        // building and incrementing array sub-section
        x_vals[count] = year;
        y_vals[count] = weight;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
        
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          int max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015); 
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
  }
  ++plot_counter;
  
  
  
  
  // -------------------------------------------------------------------- LEFT LOWER (ACT & SATM) OR (WEIGHT & YEAR) ----------------------------------------------------------------------
  if (plot_counter == 3)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.05;
    float x_axis_y1_val = height * 0.9;
    float x_axis_x2_val = width * 0.3;
    float x_axis_y2_val = height * 0.9;
    line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.05;
    float y_axis_y1_val = height * 0.9;
    float y_axis_x2_val = width * 0.05;
    float y_axis_y2_val = height * 0.7;
    line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 4A ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        // title
        //x-axis label
        text("ACT", width / 6, height * 0.93);
        // y-axis label
        rotate(-PI / 2);
        text("SATM", width / -1.65, height * 0.05);
        rotate(PI / 2);
    }
    else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
    {
      // TEXT SECTION
      // center aligns all text
      textAlign(CENTER);
      //x-axis label
      text("WIEGHT", width / 6, height * 0.93);
      // y-axis label
      rotate(-PI / 2);
      text("YEAR", width / -1.65, height * 0.05);
      rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      int[] x_vals = new int[271];
      int[] y_vals = new int[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int ACT = row.getInt("ACT");
        int SATM = row.getInt("SATM");
      
        // building and incrementing array sub-section
        x_vals[count] = ACT;
        y_vals[count] = SATM;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          int max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015); 
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
    
    ///////////////////////////////////////////////////////////////////// DATASET 4B ///////////////////////////////////////////////////////////
    else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
    {
      int[] x_vals = new int[255];
      int[] y_vals = new int[255];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int weight = row.getInt("Weight (lb)");
        int year = row.getInt("Year");
        
        // building and incrementing array sub-section
        x_vals[count] = year;
        y_vals[count] = weight;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
        
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          int max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015); 
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
  }
  ++plot_counter;
  
  
  
  
  // -------------------------------------------------------------------- MIDDLE UPPER (SATM & GPA) OR (HORSEPOWER & WEIGHT) ----------------------------------------------------------------------
  if (plot_counter == 4)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.32;
    float x_axis_y1_val = height * 0.21;
    float x_axis_x2_val = width * 0.6;
    float x_axis_y2_val = height * 0.21;
    line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.32;
    float y_axis_y1_val = height * 0.21;
    float y_axis_x2_val = width * 0.32;
    float y_axis_y2_val = height * 0.005;
    line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 1E ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        //x-axis label
        text("SATM", width / 2.2, height * 0.23);
        // y-axis label
        rotate(-PI / 2);
        text("GPA", width / -12, height * 0.42);
        rotate(PI / 2);
    }
    else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
    {
      // TEXT SECTION
      // center aligns all text
      textAlign(CENTER);
      //x-axis label
      text("HORSEPOWER", width / 2.2, height * 0.23);
      // y-axis label
      rotate(-PI / 2);
      text("WEIGHT", width / -12, height * 0.42);
      rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      int[] x_vals = new int[271];
      float[] y_vals = new float[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int SATM = row.getInt("SATM");
        float GPA = row.getFloat("GPA");
      
        // building and incrementing array sub-section
        x_vals[count] = SATM;
        y_vals[count] = GPA;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          float zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          float max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015); 
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
    
    ///////////////////////////////////////////////////////////////////// DATASET 2E ///////////////////////////////////////////////////////////
    else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
    {
      int[] x_vals = new int[255];
      int[] y_vals = new int[255];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int horsepower = row.getInt("Horsepower");
        int weight = row.getInt("Weight (lb)");
        
        // building and incrementing array sub-section
        x_vals[count] = horsepower;
        y_vals[count] = weight;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          float zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
        
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          int max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015);
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
  }
  ++plot_counter;
  
  
  
  
  // -------------------------------------------------------------------- MIDDLE UPPER MIDDLE (GPA & SATM) OR (WEIGHT & HORSEPOWER) ----------------------------------------------------------------------
  if (plot_counter == 5)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.32;
    float x_axis_y1_val = height * 0.44;
    float x_axis_x2_val = width * 0.6;
    float x_axis_y2_val = height * 0.44;
    line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.32;
    float y_axis_y1_val = height * 0.44;
    float y_axis_x2_val = width * 0.32;
    float y_axis_y2_val = height * 0.25;
    line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 1F ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        //x-axis label
        text("GPA", width / 2.2, height * 0.46);
        // y-axis label
        rotate(-PI / 2);
        text("SATM", width / -4, height * 0.42);
        rotate(PI / 2);
    }
    else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
    {
      // TEXT SECTION
      // center aligns all text
      textAlign(CENTER);
      //x-axis label
      text("WEIGHT", width / 2.2, height * 0.46);
      // y-axis label
      rotate(-PI / 2);
      text("HORSEPOWER", width / -4, height * 0.42);
      rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      float[] x_vals = new float[271];
      int[] y_vals = new int[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        float GPA = row.getFloat("GPA");
        int SATM = row.getInt("SATM");
      
        // building and incrementing array sub-section
        x_vals[count] = GPA;
        y_vals[count] = SATM;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          float zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          float max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          float max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015);
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
    
    ///////////////////////////////////////////////////////////////////// DATASET 2F ///////////////////////////////////////////////////////////
    else if (table.getColumnTitle(0).equals("Year") && table.getColumnTitle(1).equals("Horsepower"))
    {
      int[] x_vals = new int[255];
      int[] y_vals = new int[255];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int weight = row.getInt("Weight (lb)");
        int horsepower = row.getInt("Horsepower");
        
        // building and incrementing array sub-section
        x_vals[count] = weight;
        y_vals[count] = horsepower;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
        
          // max value sub-section
          int max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          int max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015);
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    }
  }
  ++plot_counter;
  
  
// -------------------------------------------------------------------- MIDDLE LOWER MIDDLE (SATV & ACT) ---------------------------------------------------------------------- 
  if (plot_counter == 6)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.32;
    float x_axis_y1_val = height * 0.64;
    float x_axis_x2_val = width * 0.6;
    float x_axis_y2_val = height * 0.64;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.32;
    float y_axis_y1_val = height * 0.64;
    float y_axis_x2_val = width * 0.32;
    float y_axis_y2_val = height * 0.46;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 1G ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        //x-axis label
        text("SATV", width / 2.2, height * 0.66);
        // y-axis label
        rotate(-PI / 2);
        text("ACT", width / -2.4, height * 0.42);
        rotate(PI / 2);
    }
   
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      int[] x_vals = new int[271];
      int[] y_vals = new int[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int SATV = row.getInt("SATV");
        int ACT = row.getInt("ACT");
      
        // building and incrementing array sub-section
        x_vals[count] = SATV;
        y_vals[count] = ACT;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          float max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          float max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015);
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    } 
  }
  ++plot_counter;
 
  
  
// -------------------------------------------------------------------- MIDDLE LOWER (ACT & SATV) ----------------------------------------------------------------------  
  if (plot_counter == 7)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.32;
    float x_axis_y1_val = height * 0.9;
    float x_axis_x2_val = width * 0.6;
    float x_axis_y2_val = height * 0.9;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.32;
    float y_axis_y1_val = height * 0.9;
    float y_axis_x2_val = width * 0.32;
    float y_axis_y2_val = height * 0.7;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 1H ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        //x-axis label
        text("ACT", width / 2.2, height * 0.93);
        // y-axis label
        rotate(-PI / 2);
        text("SATV", width / -1.65, height * 0.42);
        rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      int[] x_vals = new int[271];
      int[] y_vals = new int[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int ACT = row.getInt("ACT");
        int SATV = row.getInt("SATV");
      
        // building and incrementing array sub-section
        x_vals[count] = ACT;
        y_vals[count] = SATV;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          float max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          float max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015);
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    } 
  }
  ++plot_counter;
  
  
  
// -------------------------------------------------------------------- RIGHT UPPER (SATV & GPA) ----------------------------------------------------------------------  
  if (plot_counter == 8)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.62;
    float x_axis_y1_val = height * 0.21;
    float x_axis_x2_val = width * 0.9;
    float x_axis_y2_val = height * 0.21;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.62;
    float y_axis_y1_val = height * 0.21;
    float y_axis_x2_val = width * 0.62;
    float y_axis_y2_val = height * 0.005;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))  
      line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 1I ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        //x-axis label
        text("SATV", width * 0.76, height * 0.23);
        // y-axis label
        rotate(-PI / 2);
        text("GPA", width / -12, height * 0.82);
        rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      int[] x_vals = new int[271];
      float[] y_vals = new float[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int SATV = row.getInt("SATV");
        float GPA = row.getFloat("GPA");
      
        // building and incrementing array sub-section
        x_vals[count] = SATV;
        y_vals[count] = GPA;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          int zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          float zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          float max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          float max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015); 
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    } 
  }
  ++plot_counter;
  
  
  
// -------------------------------------------------------------------- RIGHT UPPER MIDDLE (GPA & SATV) ----------------------------------------------------------------------  
  if (plot_counter == 9)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.62;
    float x_axis_y1_val = height * 0.44;
    float x_axis_x2_val = width * 0.9;
    float x_axis_y2_val = height * 0.44;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.62;
    float y_axis_y1_val = height * 0.44;
    float y_axis_x2_val = width * 0.62;
    float y_axis_y2_val = height * 0.25;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 1J ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        //x-axis label
        text("GPA", width * 0.76, height * 0.46);
        // y-axis label
        rotate(-PI / 2);
        text("SATV", width / -4, height * 0.82);
        rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      float[] x_vals = new float[271];
      int[] y_vals = new int[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        float GPA = row.getFloat("GPA");
        int SATV = row.getInt("SATV");
      
        // building and incrementing array sub-section
        x_vals[count] = GPA;
        y_vals[count] = SATV;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          float zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          int zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          float max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          float max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015);
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    } 
  }
  ++plot_counter;
  
  
  
  
  // -------------------------------------------------------------------- RIGHT LOWER MIDDLE (ACT & GPA) ----------------------------------------------------------------------  
  if (plot_counter == 10)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.62;
    float x_axis_y1_val = height * 0.64;
    float x_axis_x2_val = width * 0.9;
    float x_axis_y2_val = height * 0.64;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.62;
    float y_axis_y1_val = height * 0.64;
    float y_axis_x2_val = width * 0.62;
    float y_axis_y2_val = height * 0.46;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 1K ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        //x-axis label
        text("ACT", width * 0.76, height * 0.66);
        // y-axis label
        rotate(-PI / 2);
        text("GPA", width / -2.4, height * 0.82);
        rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      int[] x_vals = new int[271];
      float[] y_vals = new float[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        int ACT = row.getInt("ACT");
        float GPA = row.getFloat("GPA");
      
        // building and incrementing array sub-section
        x_vals[count] = ACT;
        y_vals[count] = GPA;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          float zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          float zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          float max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          float max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015);
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    } 
  }
  ++plot_counter;
  
  
  
// -------------------------------------------------------------------- RIGHT LOWER (GPA & ACT) ----------------------------------------------------------------------  
  if (plot_counter == 11)
  {
    // AXIS LINES SECTION
    // x-axis line
    float x_axis_x1_val = width * 0.62;
    float x_axis_y1_val = height * 0.9;
    float x_axis_x2_val = width * 0.9;
    float x_axis_y2_val = height * 0.9;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (x_axis_x1_val, x_axis_y1_val, x_axis_x2_val, x_axis_y2_val);
    // y-axis line
    float y_axis_x1_val = width * 0.62;
    float y_axis_y1_val = height * 0.9;
    float y_axis_x2_val = width * 0.62;
    float y_axis_y2_val = height * 0.7;
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
      line (y_axis_x1_val, y_axis_y1_val, y_axis_x2_val, y_axis_y2_val);
  
  ///////////////////////////////////////////////////////////////////// DATASET 1L ///////////////////////////////////////////////////////////
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
        // TEXT SECTION
        // center aligns all text
        textAlign(CENTER);
        //x-axis label
        text("GPA", width * 0.76, height * 0.93);
        // y-axis label
        rotate(-PI / 2);
        text("ACT", width / -1.65, height * 0.82);
        rotate(PI / 2);
    }
    
    if (table.getColumnTitle(0).equals("SATM") && table.getColumnTitle(1).equals("SATV"))
    {
      // ARRAY-STORED DATA SECTION
      float[] x_vals = new float[271];
      int[] y_vals = new int[271];
      int count = 0;
    
    
      // DATA GATHERING SECTION
      for (TableRow row : table.rows())
      {
        // csv data values sub-section
        float GPA = row.getFloat("GPA");
        int ACT = row.getInt("ACT");
      
        // building and incrementing array sub-section
        x_vals[count] = GPA;
        y_vals[count] = ACT;
        count++;
      
        // tick and value-plotting sub-section
        // create x and y-axis tick marks and values based off csv file values
        if (count == table.getRowCount())
        {
          // 0 value sub-section
          float zero_x_value = min(x_vals);
          float zero_x_value_x_location = x_axis_x1_val;
          float zero_y_value = min(y_vals);
          float zero_y_value_y_location = y_axis_y1_val;
          
          // max value sub-section
          float max_x_value = max(x_vals);
          float max_x_value_x_location = x_axis_x2_val - (width * 0.015); 
          float max_y_value = max(y_vals);
          float max_y_value_y_location = y_axis_y2_val + (height * 0.015);
        
          for (int i = 0; i < count; i++) 
          {
            float x_map = map(x_vals[i], zero_x_value, max_x_value, zero_x_value_x_location, max_x_value_x_location);
            float y_map = map(y_vals[i], zero_y_value, max_y_value, zero_y_value_y_location, max_y_value_y_location);
            ellipse(x_map, y_map, width * 0.0015, height * 0.0015);
          }
        }
      }
    } 
  }
}
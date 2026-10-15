// 1. Array to hold 100 data pointsscale 1 - 5
float[] observations = new float[100];
int[] categories = new int[100]; // 0=work, 1=rest, 2=play

void setup() {
  size(800, 800);
  noLoop(); // static
  
  // 2. Populate 100 data points placeholders for now 
  for (int i = 0; i < 100; i++) {
    observations[i] = random(10, 50); // Represents size/intensity
    categories[i] = int(random(3));   // 3 distinct groups
  }
}

void draw() {
  background(250, 248, 242); // Off white background
  
  int cols = 10; // 10 columns x 10 rows = 100 data points
  int margin = 80;
  float gridSpacing = (width - margin * 2) / (cols - 1);

  // 3. Loop through all 100 data points and position them in a 10x10 grid
  for (int i = 0; i < 100; i++) {
    // Math to convert index 'i' into x, y
    int col = i % cols;      // Remainder gives column number (0 to 9)
    int row = i / cols;      // Integer division gives row number (0 to 9)
    
    float x = margin + col * gridSpacing;
    float y = margin + row * gridSpacing;
    
    // Draw an individual observation thingy
    drawGlyph(x, y, observations[i], categories[i], i + 1);
  }
  
  drawTitle();
}

// Custom function to style each data glyph like a Dear Data hand-drawn mark
void drawGlyph(float x, float y, float sizeVal, int categoryVal, int idNumber) {
  pushMatrix();
  translate(x, y);
  
  // Color coding by category
  if (categoryVal == 0) fill(230, 90, 80, 180);      // Redish
  else if (categoryVal == 1) fill(80, 160, 200, 180); // Blue
  else fill(240, 180, 60, 180);                       // Yellow
  
  stroke(50);
  strokeWeight(1.5);
  
  // Main data element (size mapped to data value)
  ellipse(0, 0, sizeVal, sizeVal);
  
  // Optional: Add observation number or detail text underneath
  fill(100);
  textAlign(CENTER);
  textSize(9);
  text("#" + idNumber, 0, 32);
  
  popMatrix();
}

void drawTitle() {
  fill(40);
  textAlign(CENTER);
  textSize(16);
  text("DEAR DATA: 100 Observations", 40, 30);
}

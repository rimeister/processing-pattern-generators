import processing.pdf.*;

PShape tile;

int tileWidth = 100;
int tileHeight = 100;

void setup() {

	size(500,1000);

	background(255,255,255);

	beginRecord(PDF, "renders/render.pdf"); // Begin recording PDF

	tile = loadShape("anchor_tile.svg");

	// Nested for loops to draw rows of tiles
	for (int i = 0; i < height/tileHeight; i++) {

		for (int j = 0; j < width/tileWidth; j++) {
			
			// Counter to track which of the four rotated triangles we're currently on
			int rotateCounter = 0; 
			
			// Push/pop matrix for tile repitition
			pushMatrix();

				translate(j*tileWidth,i*tileHeight);

				int tileXPosition = 0;

				if (j%2 != 0) {
					scale(-1.0, 1.0);
					tileXPosition = -tileWidth;
				}

				println("j val is "+j+". tilexpos = "+tileXPosition);


				shape(tile, tileXPosition, 0, tileWidth, tileHeight);

			popMatrix();
			
		}

	}

	endRecord(); // End recording PDF

}
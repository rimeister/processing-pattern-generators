import processing.pdf.*;

PShape tile;

int tileWidth = 100;
int tileHeight = 100;

//color[] colourPalette = {#1a2139,#1a2139,#1a2139,#333e5b,#798190,#f73a18};
color[] colourPalette = {#333e5b,#333e5b,#333e5b,#3e94b2,#e78d1e};


void setup() {

	size(1000,1000);

	color bgColour = #798190;

	background(bgColour);

	beginRecord(PDF, "renders/render.pdf"); // Begin recording PDF

	tile = loadShape("anchor_tile.svg");

	tile.disableStyle();

	// Nested for loops to draw rows of tiles
	for (int i = 0; i < height/tileHeight; i++) {

		for (int j = 0; j < width/tileWidth; j++) {
			
			// Push/pop matrix for tile repitition
			pushMatrix();

				translate(j*tileWidth,i*tileHeight);

				int tileXPosition = 0;
				int tileYPosition = 0;

				if (j%2 != 0 && i%2 == 0) {
					// Flip on X axis
					scale(-1.0, 1.0);
					tileXPosition = -tileWidth;
				}

				if (j%2 == 0 && i%2 != 0) {
					// Flip on Y axis
					scale(1.0, -1.0);
					tileYPosition = -tileHeight;

				}

				noStroke();

				fill( randomColour(colourPalette) );

				shape(tile, tileXPosition, tileYPosition, tileWidth, tileHeight);

			popMatrix();
			
		}

	}

	endRecord(); // End recording PDF

}

// Return a random colour from the palette
color randomColour(color[] palette) {
	int randomIndex = (int)random(0, palette.length);
	color randColour = palette[randomIndex];
	return randColour;
}

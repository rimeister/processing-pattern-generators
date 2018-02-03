void setup() {

	size(500,1000);
	background(255,255,255);
	
	int tileWidth = 50;
	int tileHeight = 50;
	color[] colourPalette = {#1a2139,#333e5b,#798190,#f73a18};

	// Nested for loops to draw rows of tiles
	for (int i = 0; i < height/tileHeight; i++) {

		for (int j = 0; j < width/tileWidth; j++) {
			
			// Counter to track which of the four rotated triangles we're currently on
			int rotateCounter = 0; 
			
			// Push/pop matrix for tile repitition
			pushMatrix();

				translate(j*tileWidth,i*tileHeight);

				for (int k = 0; k < 2; k++) {
					// Draw four triabngles, rotate each one 9) each time

					for (int l = 0; l < 2; l++) {

						// Nested push/pop matrix
						pushMatrix();

							/* Translations needed to rotate triangles
								Tile 1: 0,0
								Tile 2: tileWidth,0
								Tile 3: tileWidth,tileHeight
								Tile 4: 0,tileHeight */

							if (rotateCounter < 2) {
								// squares 1, 2
								translate(l*tileWidth,k*tileHeight);

							} else if (rotateCounter == 2) {
								// square 3
								translate(tileWidth,tileHeight);								
							} else {
								// square 4
								translate(0,tileHeight);
							}

							// Rotate by multiples of 90 degrees
							int rotateDeg = 0;

							if (rotateCounter > 0) {
								rotateDeg = 90*rotateCounter;
							}

							rotate( radians(rotateDeg) );
							
							// Remove default stroke
							noStroke(); 

							// Set fill to colour for current triangle
							fill(colourPalette[rotateCounter]);

							// Create the triangle
							triangle(0, 0, 0, tileHeight/2, tileWidth/2, tileHeight/2);

						popMatrix();

						rotateCounter++;
					
					}

				}

			popMatrix();
			
		}

	}

}
void setup() {

	size(500,1000);
	fill(0,0,0);
	
	int tileWidth = 100;
	int tileHeight = 100;

	for (int i = 0; i < height/tileHeight; i++) {

		for (int j = 0; j < width/tileWidth; j++) {
			
			pushMatrix();

				translate(j*tileWidth,i*tileHeight);
				triangle(0, 0, 0, tileHeight, tileWidth, tileHeight);

			popMatrix();
			
		}

	}

}
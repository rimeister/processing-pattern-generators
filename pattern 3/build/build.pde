void setup() {

	size(500,1000);
	background(255,255,255);
	
	int tileWidth = 100;
	int tileHeight = 100;

	for (int i = 0; i < height/tileHeight; i++) {

		for (int j = 0; j < width/tileWidth; j++) {
			
			int rotateCounter = 0; 
			
			pushMatrix();

				translate(j*tileWidth,i*tileHeight);

				for (int k = 0; k < 2; k++) {
					// Draw four triabngles, rotate each one 9) each time

					for (int l = 0; l < 2; l++) {

						pushMatrix();

							//0,0
							//tileWidth/2,0
							//tileWidth/2,tileHeight/2
							//0,tileHeight/2

							translate(l*tileWidth,k*tileHeight);

							int rotateDeg = 0;

							if (rotateCounter > 0) {
								rotateDeg = 90*rotateCounter;
							}

							rotate( radians(rotateDeg) );
							println(rotateDeg);
							fill(0,0,0);
							triangle(0, 0, 0, tileHeight/2, tileWidth/2, tileHeight/2);

						popMatrix();

						rotateCounter++;
					
					}

				}

			popMatrix();
			
		}

	}

}
import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import hype.interfaces.*;
import processing.pdf.*;

/***********************************/
/******* Pattern Generator 2 *******/
/***********************************/

HDrawablePool pool;
HColorPool colors;

void setup() {

	colors = new HColorPool()

		// Method chain together all the colours I want to add to the colour pool
		.add(#FFFFFF,2)
		.add(#ECECEC,2)
		.add(#CCCCCC,2)
		.add(#333333,3)
		.add(#0095A8)
		.add(#00616F)
		.add(#FF3300)
		.add(#FF6600)
	;

	// Vertical rectangle canvas
	size(1000,1200);

	// I guess this initialized Hype and sets the background colour
	H.init(this).background(#202020);

	// Instantiate shape pool
	pool = new HDrawablePool(120);

	pool
		// Auto add shapes to state
		.autoAddToStage()

		// Add my SVG shapes to the pool
		.add(new HShape("diagonal-01.svg"))
		.add(new HShape("diagonal-02.svg"))
		.add(new HShape("diagonal-03.svg"))
		.add(new HShape("diagonal-04.svg"))

		// Setup the grid layout
		.layout(
			new HGridLayout()
			.startX(50)
			.startY(50)
			.spacing(100,100)
			.cols(10)			
		)

		// On create
		.onCreate(

			new HCallback() {

				public void run ( Object obj ) {

					HShape d = (HShape) obj;

					d
						// Disable SVG styles
						.enableStyle(false)
						.strokeWeight(0)
						.anchorAt(H.CENTER)
					;
					
					d.randomColors(colors.fillOnly());

				}

			}

		)

		// I guess this requests all the shapes after they've been created.
		.requestAll()

	;

	saveVector();
	noLoop();

}

void draw() {
	H.drawStage();
}


// Function for saving graphics as vectors in a PDF
void saveVector() {
	PGraphics tmp = null;
	tmp = beginRecord(PDF, "render.pdf");

	if (tmp == null) {
		H.drawStage();
	} else {
		H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D
	}

	endRecord();
}
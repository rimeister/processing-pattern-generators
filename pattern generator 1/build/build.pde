import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import hype.interfaces.*;

/***********************************/
/******* Pattern Generator 1 *******/
/***********************************/

// Trying out as many hype classes and methods as I can
// Reference this example from the Hype examples site: http://www.hypeframework.org/examples/HGridLayout/example_003/index.html

HDrawablePool pool;
HColorPool colours;

void setup() {

	colours = new HColorPool()
		.add(#ff0084)
		.add(#634791)
		.add(#01c4d0)
		.add(#1a9a8b)
		.add(#a9f27f)
	;

	size(500,1000);
	H.init(this).background(#ffffff);
	smooth();

	pool = new HDrawablePool(100);

	pool
		.autoAddToStage()
		
		.add(new HRect(76))

		.layout(
			new HGridLayout()
			.startX(38)
			.startY(38)
			.spacing(38,38)
			.cols(12)
		)

		.onCreate(
			new HCallback() {
				public void run(Object obj) {
					HRect d = (HRect) obj;
					d
						.anchorAt(H.CENTER)
						.rotate( (int)random(4) * 90)
						.noStroke()
						.size( 50 + ( (int)random(2 * 50) ) ) // 50, 100
						.fill(colours.getColor())
						.alpha( (int)random(50,200) )
					;
				}

			}
		)

		.requestAll()
	;

	H.drawStage();

}
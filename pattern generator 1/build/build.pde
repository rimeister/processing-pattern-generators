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
	size(500,1000);
	H.init(this).background(#ffffff);
	smooth();

	colours = new HColorPool()
		.add(#ff0084)
		.add(#634791)
		.add(#01c4d0)
		.add(#1a9a8b)
		.add(#a9f27f)
	;
}

void draw() {
	
}
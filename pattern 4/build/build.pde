import processing.pdf.*;

PShape tile;

int tileWidth = 100;
int tileHeight = 100;

void setup() {

	size(500,1000);

	beginRecord(PDF, "renders/render.pdf"); // Begin recording PDF

	tile = loadShape("anchor_tile.svg");

	background(255,255,255);

	endRecord(); // End recording PDF

}

void draw() {

	shape(tile, 0, 0, tileWidth, tileHeight);

}
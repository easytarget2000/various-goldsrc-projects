private static final int NUM_OF_FRAMES = 10;
private static final color BACKGROUND_COLOR = 0xFFFFFF;
private static final color FOREGROUND_COLOR_1 = 0xFF000000;
private static final String TEXTURE_NAME = "LargeWhiteGrouts";

void setup() {
  size(256, 256);
  clearFrame();
  frameRate(10);
}

void draw() {
  final float progress = (frameCount % NUM_OF_FRAMES) / (float) NUM_OF_FRAMES;

  clearFrame();
  drawRects(progress);

  if (frameCount <= NUM_OF_FRAMES) {
    final String textureIndex = String.valueOf(frameCount - 1);
    saveFrame("+" + textureIndex + TEXTURE_NAME + ".bmp");
  }
}

/*
Implementations
 */

private void clearFrame() {
  background(BACKGROUND_COLOR);
}

private void drawRects(final float progress) {
  strokeWeight(1f);
  fill(FOREGROUND_COLOR_1);
  noStroke();

  final float frameWidth = width * 0.382f / 2f;
  final float frameHeight = height * 0.382f / 2f;
  final float rectWidth = width - frameWidth;
  final float rectHeight = height - frameHeight;

  final float xOffset = width * progress;
  final float yOffset = height * progress;

  // Top-left rectangle:
  rect(
    -rectWidth + xOffset, 
    -rectHeight + yOffset, 
    rectWidth, 
    rectHeight
    );

  // Top-right rectangle:
  rect(
    frameWidth + xOffset, 
    -rectHeight + yOffset, 
    rectWidth, 
    rectHeight
    );

  // Bottom-left rectangle:
  rect(
    -rectWidth + xOffset, 
    frameHeight + yOffset, 
    rectWidth, 
    rectHeight
    );

  // Bottom-right rectangle:
  rect(
    frameWidth + xOffset, 
    frameHeight + yOffset, 
    rectWidth, 
    rectHeight
    );
}

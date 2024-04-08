class DoubleHandleSlider {
  ControlP5 cp5;
  int sliderMinValue = 0;
  int sliderMaxValue = 5095;

  DoubleHandleSlider(ControlP5 cp5) {
    this.cp5 = cp5; // Assign the passed cp5 to the class variable
  }

  void draw() {
    if (!sliderAdded) {
      cp5.addRange("sliderRange")
        .setPosition(450, 400)
        .setSize(400, 20)
        .setRange(sliderMinValue, sliderMaxValue)
        .setRangeValues(sliderMinValue, sliderMaxValue)
        .setColorForeground(color(139, 124, 207))
        .setColorBackground(color(185, 168, 238))
        .setColorValueLabel(color(0))
        .setColorActive(color(100, 100, 200))
        .plugTo(this, "sliderRangeChanged");
      sliderAdded = true;
    }
  }

  public void sliderRangeChanged(int min, int max) {
    sliderMinValue = min;
    sliderMaxValue = max;
    println("Slider range changed. Min value: " + sliderMinValue + ", Max value: " + sliderMaxValue);
  }

  public void controlEvent(ControlEvent event) {
    if (event.isFrom("sliderRange")) {
      float[] values = event.getController().getArrayValue();
      int lowValue = (int) min(values[0], values[1]);
      int highValue = (int) max(values[0], values[1]);
      println("Slider handle moved. Low Distance value: " + lowValue + ", High Distance value: " + highValue);
    }
  }
}

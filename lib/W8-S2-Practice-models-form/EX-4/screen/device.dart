enum Device {
  Euro(0.85), 
  Riel(4100.0), 
  Dong(23000.0);

  final double rate;
  const Device(this.rate);
}

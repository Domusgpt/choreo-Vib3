import 'package:flutter/foundation.dart';

class VisualizerState extends ChangeNotifier {
  Map<String, double> _parameters = {
    'intensity': 1.0,
    'gridDensity': 25.0,
    'morphFactor': 1.0,
    'chaos': 0.2,
    'speed': 1.0,
    'hue': 180.0,
    'saturation': 1.0,
    'dimension': 3.5,
    'geometry': 0.0,
    'rot4dXW': 0.0,
    'rot4dYW': 0.0,
    'rot4dZW': 0.0,
  };

  bool _controlsVisible = true;
  bool _controlsExpanded = false;

  Map<String, double> get parameters => Map.unmodifiable(_parameters);
  bool get controlsVisible => _controlsVisible;
  bool get controlsExpanded => _controlsExpanded;

  void updateParameter(String name, double value) {
    _parameters[name] = value;
    notifyListeners();
  }

  void toggleControlsVisibility() {
    _controlsVisible = !_controlsVisible;
    notifyListeners();
  }

  void toggleControlsExpanded() {
    _controlsExpanded = !_controlsExpanded;
    notifyListeners();
  }

  void setControlsExpanded(bool expanded) {
    _controlsExpanded = expanded;
    notifyListeners();
  }
}

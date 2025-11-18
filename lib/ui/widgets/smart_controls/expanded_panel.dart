import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../state/visualizer_state.dart';

class ExpandedPanel extends StatelessWidget {
  final Function(String, double) onParameterChange;
  final VoidCallback onCollapse;

  const ExpandedPanel({
    super.key,
    required this.onParameterChange,
    required this.onCollapse,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<VisualizerState>();

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy > 5) onCollapse();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.95),
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          border: Border.all(
            color: const Color(0xFF00FFFF),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00FFFF).withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            // Drag handle
            Container(
              height: 40,
              child: Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00FFFF),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),

            // Parameter controls
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildSectionHeader('⚡ PARAMETERS'),
                  _buildParameterSlider(
                    context,
                    'Intensity',
                    'intensity',
                    state.parameters['intensity']!,
                    0.1,
                    2.0,
                  ),
                  _buildParameterSlider(
                    context,
                    'Chaos',
                    'chaos',
                    state.parameters['chaos']!,
                    0.0,
                    1.0,
                  ),
                  _buildParameterSlider(
                    context,
                    'Dimension',
                    'dimension',
                    state.parameters['dimension']!,
                    2.0,
                    5.0,
                  ),
                  _buildParameterSlider(
                    context,
                    'Speed',
                    'speed',
                    state.parameters['speed']!,
                    0.1,
                    3.0,
                  ),
                  const SizedBox(height: 16),
                  _buildSectionHeader('🎨 COLOR'),
                  _buildParameterSlider(
                    context,
                    'Hue',
                    'hue',
                    state.parameters['hue']!,
                    0.0,
                    360.0,
                  ),
                  _buildParameterSlider(
                    context,
                    'Saturation',
                    'saturation',
                    state.parameters['saturation']!,
                    0.0,
                    1.0,
                  ),
                  const SizedBox(height: 16),
                  _buildSectionHeader('🌀 4D ROTATION'),
                  _buildParameterSlider(
                    context,
                    'Rot XW',
                    'rot4dXW',
                    state.parameters['rot4dXW']!,
                    -6.28,
                    6.28,
                  ),
                  _buildParameterSlider(
                    context,
                    'Rot YW',
                    'rot4dYW',
                    state.parameters['rot4dYW']!,
                    -6.28,
                    6.28,
                  ),
                  _buildParameterSlider(
                    context,
                    'Rot ZW',
                    'rot4dZW',
                    state.parameters['rot4dZW']!,
                    -6.28,
                    6.28,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF00FFFF),
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildParameterSlider(
    BuildContext context,
    String label,
    String param,
    double value,
    double min,
    double max,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF00FF00),
                fontSize: 11,
              ),
            ),
          ),
          Expanded(
            child: Slider(
              value: value,
              min: min,
              max: max,
              onChanged: (newValue) {
                onParameterChange(param, newValue);
              },
            ),
          ),
          SizedBox(
            width: 50,
            child: Text(
              value.toStringAsFixed(2),
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF00FFFF),
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../state/visualizer_state.dart';
import '../widgets/smart_controls/collapsed_pill.dart';
import '../widgets/smart_controls/expanded_panel.dart';
import 'dart:convert';

class VisualizerScreen extends StatefulWidget {
  const VisualizerScreen({super.key});

  @override
  State<VisualizerScreen> createState() => _VisualizerScreenState();
}

class _VisualizerScreenState extends State<VisualizerScreen> {
  late WebViewController _controller;
  bool _webViewReady = false;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  void _initializeWebView() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            setState(() {
              _webViewReady = true;
            });
            _initializeVisualizer();
          },
        ),
      )
      ..loadFlutterAsset('assets/webgl/visualizer.html');
  }

  void _initializeVisualizer() {
    _controller.runJavaScript('''
      window.VIB3Mobile.init({
        parameters: ${jsonEncode(context.read<VisualizerState>().parameters)}
      });
    ''');
  }

  void _updateParameter(String param, double value) {
    if (!_webViewReady) return;

    _controller.runJavaScript('''
      window.VIB3Mobile.updateParameter('$param', $value);
    ''');
  }

  void _sendAudioData(Map<String, dynamic> audioData) {
    if (!_webViewReady) return;

    _controller.runJavaScript('''
      window.VIB3Mobile.render(${jsonEncode(audioData)});
    ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<VisualizerState>(
        builder: (context, state, child) {
          return Stack(
            children: [
              // Full-screen WebGL visualizer
              Positioned.fill(
                child: WebViewWidget(controller: _controller),
              ),

              // Control overlays (only if visible)
              if (state.controlsVisible) ...[
                // Bottom controls
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: state.controlsExpanded ? 400 : 60,
                    child: state.controlsExpanded
                        ? ExpandedPanel(
                            onParameterChange: (param, value) {
                              context.read<VisualizerState>().updateParameter(param, value);
                              _updateParameter(param, value);
                            },
                            onCollapse: () {
                              context.read<VisualizerState>().setControlsExpanded(false);
                            },
                          )
                        : CollapsedPill(
                            onExpand: () {
                              context.read<VisualizerState>().setControlsExpanded(true);
                            },
                            onPlayPause: () {
                              // TODO: Implement audio play/pause
                            },
                          ),
                  ),
                ),
              ],

              // Menu button (always visible)
              Positioned(
                top: 10,
                right: 10,
                child: FloatingActionButton(
                  mini: true,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: Icon(
                    state.controlsVisible ? Icons.close : Icons.tune,
                    color: const Color(0xFF00FFFF),
                  ),
                  onPressed: () {
                    context.read<VisualizerState>().toggleControlsVisibility();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

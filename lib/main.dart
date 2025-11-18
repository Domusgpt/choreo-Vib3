import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'ui/screens/visualizer_screen.dart';
import 'state/visualizer_state.dart';
import 'utils/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Force landscape and fullscreen
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const ChoreoVIB3App());
}

class ChoreoVIB3App extends StatelessWidget {
  const ChoreoVIB3App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VisualizerState()),
      ],
      child: MaterialApp(
        title: 'Choreo-VIB3',
        theme: VIB3Theme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const VisualizerScreen(),
      ),
    );
  }
}

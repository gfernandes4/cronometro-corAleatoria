import 'package:flutter/material.dart';
import 'dart:async';
import 'meuTheme.dart';
import 'corRandom.dart';

class CronometroPage extends StatefulWidget {
  const CronometroPage({super.key});

  @override
  State<CronometroPage> createState() => _CronometroPageState();
}

class _CronometroPageState extends State<CronometroPage> {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  void _startPause() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer?.cancel();
    } else {
      _stopwatch.start();
      _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
        setState(() {}); // Atualiza a UI a cada 100ms
      });
    }
    setState(() {}); // Atualiza o texto do botão
  }

  void _reset() {
    _stopwatch.reset();
    setState(() {}); // Atualiza a UI
  }

  String _formatTime() {
    final milliseconds = _stopwatch.elapsedMilliseconds;
    final seconds = (milliseconds ~/ 1000) % 60;
    final minutes = (milliseconds ~/ 60000) % 60;
    final hours = milliseconds ~/ 3600000;
    return '${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(seconds)}';
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void dispose() {
    _timer?.cancel(); // Para o timer ao sair da tela
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cronômetro'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),),
        toolbarHeight: 68,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${_formatTime()}',
              style: const TextStyle(fontSize: 78, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _startPause,
                  child: Text(_stopwatch.isRunning ? 'Pausar' : 'Iniciar'),
                ),
                const SizedBox(width: 20),
                OutlinedButton(
                  onPressed: _reset,
                  child: const Text('Zerar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// Estudo sobre a propriedade shape do AppBar
// Usando path para criar uma forma personalizada
/*
class AppBarShape extends OutlinedBorder {
  Path _getPaht(Rect rect) {
    final path = Path();
    final size = Size(rect.width, rect.height * 0.85); //tamanho da nav

    final startPoint = size.height *1.3;
    path.lineTo(0, startPoint);

    final center = Offset(size.width * 0.5, size.height );
    final endPoint = Offset(size.width , size.height*1.3);

    path.quadraticBezierTo(center.dx, center.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return AppBarShape(side: side ?? this.side);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getPaht(rect);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPaht(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) return;

    canvas.drawPath(getOuterPath(rect), side.toPaint());
  }

  @override
  ShapeBorder scale(double t) {
    return AppBarShape(side: side.scale(t));
  }

  const AppBarShape({super.side});
}
*/
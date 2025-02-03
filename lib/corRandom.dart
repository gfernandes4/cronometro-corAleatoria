import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart'; // Importando a biblioteca Clipboard

class CorRandomPage extends StatefulWidget {
  const CorRandomPage({super.key});

  @override
  State<CorRandomPage> createState() => _CorRandomPageState();
}

class _CorRandomPageState extends State<CorRandomPage> {
  Color _randomColor = const Color.fromARGB(255, 225, 225, 225); // Cor inicial
  bool _isSnackbarVisible = false; // Variável para controlar a exibição da Snackbar

  // Função para gerar uma cor aleatória
  Color _getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  // Função para converter uma cor para hexadecimal
  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Cor Aleatória'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
        ),
        toolbarHeight: 68,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 28,
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 20, horizontal: 65), // Ajuste do padding
              ),
              onPressed: () {
                setState(() {
                  _randomColor = _getRandomColor(); // Muda a cor
                });
              },
              child: Text('Mudar cor'),
            ),
            SizedBox(height: 20),
            // Exibe o código da cor em formato hexadecimal
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 28,
                ),
                padding: EdgeInsets.symmetric(
                    vertical: 20, horizontal: 40), // Ajuste do padding
                side: BorderSide(
                  color: Colors.black87, // Cor da borda
                ),
              ), // Estilo do botão
              onPressed: () async {
                final String textToCopy = _colorToHex(_randomColor);
                 if (textToCopy.isNotEmpty && !_isSnackbarVisible) {
                  try {
                    await Clipboard.setData(ClipboardData(text: textToCopy));
                    setState(() {
                      _isSnackbarVisible = true; // Bloqueia exibição de outra Snackbar
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Cor Copiada!'),
                        duration: Duration(seconds: 2), // Duração do Snackbar
                      ),
                    );

                    // Após a exibição da Snackbar, libera para exibir outra
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        _isSnackbarVisible = false;
                      });
                    });
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Houve um problema ao copiar a cor.')),
                    );
                  }
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.copy, size: 25, color: Colors.black87,), // Ícone de cópia
                  SizedBox(width: 8), // Espaço entre o ícone e o texto
                  Text(
                    'Cor: ${_colorToHex(_randomColor)}', // Exibe a cor em hexadecimal
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: _randomColor, // Define a cor do fundo
    );
  }
}

import 'package:flutter/material.dart';

class PokeballLoadingIndicator extends StatefulWidget {
  const PokeballLoadingIndicator({super.key});

  @override
  State<PokeballLoadingIndicator> createState() =>
      _PokeballLoadingIndicatorState();
}

class _PokeballLoadingIndicatorState extends State<PokeballLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RotationTransition(
            turns: _rotationAnimation,
            child: Image.asset(
              'assets/images/pokeball.png',
              height: 100, // Usa el tamaño personalizado
            ),
          ),
          // Opcional: texto genérico de carga
        ],
      ),
    );
  }
}

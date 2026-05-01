import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_app/home_screen.dart';

void main() {
  testWidgets('HomeScreen muestra título Lista dinámica', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Verificar que el AppBar tiene el título correcto
    expect(find.text('Lista dinámica'), findsOneWidget);

    // Verificar que existe el botón Agregar
    expect(find.text('Agregar'), findsOneWidget);
  });
}

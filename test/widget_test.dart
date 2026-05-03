import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:mi_app/home_screen.dart';

void main() {
  testWidgets('HomeScreen muestra título y botón Agregar', (WidgetTester tester) async {
    // Usamos Firestore simulado con fake_cloud_firestore
    final firestore = FakeFirebaseFirestore();

    // Renderizamos la pantalla inyectando el Firestore simulado
    await tester.pumpWidget(MaterialApp(home: HomeScreen(firestore: firestore)));

    // Verificar que el AppBar tiene el título correcto
    expect(find.text('Lista dinámica con Firebase'), findsOneWidget);

    // Verificar que existe el botón Agregar
    expect(find.text('Agregar'), findsOneWidget);

    // Verificar que existen los campos del formulario
    expect(find.text('Nombre'), findsOneWidget);
    expect(find.text('Contraseña'), findsOneWidget);

    // Simular escritura en campos
    await tester.enterText(find.byType(TextFormField).at(0), 'UsuarioTest');
    await tester.enterText(find.byType(TextFormField).at(1), '12345');

    // Simular click en Agregar
    await tester.tap(find.text('Agregar'));
    await tester.pump();

    // Validar que el item se creó en Firestore simulado
    final snapshot = await firestore.collection('items').get();
    expect(snapshot.docs.first['nombre'], 'UsuarioTest');
    expect(snapshot.docs.first['password'], '12345');
  });
}

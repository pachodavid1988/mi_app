import 'package:flutter_test/flutter_test.dart';
import 'package:mi_app/item.dart';

void main() {
  test('Crear Item y convertir a Map', () {
    final item = Item(nombre: 'Lapicero', password: '12345');

    expect(item.nombre, 'Lapicero');
    expect(item.password, '12345');

    final map = item.toMap();
    expect(map['nombre'], 'Lapicero');
    expect(map['password'], '12345');

    final nuevoItem = Item.fromMap({'nombre': 'Borrador', 'password': '67890'});
    expect(nuevoItem.nombre, 'Borrador');
    expect(nuevoItem.password, '67890');
  });
}

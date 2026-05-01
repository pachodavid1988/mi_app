import 'package:flutter_test/flutter_test.dart';
import 'package:mi_app/item.dart';

void main() {
  test('Crear Item correctamente', () {
    final item = Item(nombre: 'Lapicero', cantidad: 5);
    expect(item.nombre, 'Lapicero');
    expect(item.cantidad, 5);
  });
}

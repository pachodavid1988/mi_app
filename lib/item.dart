class Item {
  final String nombre;
  final String password;

  Item({required this.nombre, required this.password});

  factory Item.fromMap(Map<String, dynamic> data) {
    return Item(
      nombre: data['nombre'] ?? '',
      password: data['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'password': password,
    };
  }
}

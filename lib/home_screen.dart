import 'package:flutter/material.dart';
import 'item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _cantidadController = TextEditingController();
  final List<Item> _items = [];

  void _agregarItem() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _items.add(Item(
          nombre: _nombreController.text,
          cantidad: int.parse(_cantidadController.text),
        ));
      });
      _nombreController.clear();
      _cantidadController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista dinámica')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nombreController,
                    decoration: const InputDecoration(labelText: 'Nombre'),
                    validator: (value) =>
                        value!.isEmpty ? 'Ingrese un nombre' : null,
                  ),
                  TextFormField(
                    controller: _cantidadController,
                    decoration: const InputDecoration(labelText: 'Cantidad'),
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'Ingrese una cantidad' : null,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _agregarItem,
                    child: const Text('Agregar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return ListTile(
                    title: Text(item.nombre),
                    subtitle: Text('Cantidad: ${item.cantidad}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

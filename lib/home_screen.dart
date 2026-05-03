import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseFirestore firestore;

  // 👉 Ahora acepta un Firestore externo (real o simulado)
  const HomeScreen({super.key, FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _passwordController = TextEditingController();

  void _agregarItem() {
    if (_formKey.currentState!.validate()) {
      widget.firestore.collection('items').add({
        'nombre': _nombreController.text,
        'password': _passwordController.text,
      });
      _nombreController.clear();
      _passwordController.clear();
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista dinámica con Firebase')),
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
                        value == null || value.isEmpty ? 'Ingrese un nombre' : null,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Contraseña'),
                    obscureText: true,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Ingrese una contraseña' : null,
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
              child: StreamBuilder<QuerySnapshot>(
                stream: widget.firestore.collection('items').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error al cargar datos'));
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final docs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: docs.length,
                    itemBuilder: (context, index) {
                      final data = docs[index].data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data['nombre']),
                        subtitle: Text('Contraseña: ${data['password']}'),
                      );
                    },
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

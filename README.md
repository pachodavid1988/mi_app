# 📱 Proyecto Flutter - Evidencia EV02

## 📌 Introducción
Este proyecto corresponde a la Evidencia EV02 del programa de formación en SENA.  
La aplicación implementa una **lista dinámica** donde el usuario puede ingresar un nombre y una cantidad, y visualizar los elementos agregados en pantalla.

---

## 🛠️ Ambiente de Desarrollo
- **Sistema Operativo:** Windows 10  
- **IDE:** Visual Studio Code  
- **SDK:** Flutter 3.x  
- **Lenguaje:** Dart  
- **Emulador:** Android Emulator (Pixel 6 API 33)  

---

## 🧪 Ambiente de Pruebas
- **Pruebas unitarias:** ejecutadas con `flutter test`  
- **Resultados:**  
00:02 +2: All tests passed!

Código
- **Archivos de prueba:**  
- `test/widget_test.dart` → valida título y botón en `HomeScreen`  
- `test/item_test.dart` → valida creación de objetos `Item`  

---

## 📦 Estructura del Proyecto
mi_app/
├── lib/
│   ├── main.dart
│   ├── home_screen.dart
│   └── item.dart
├── test/
│   ├── widget_test.dart
│   └── item_test.dart
├── README.md

Código

---

## 📊 Diagramas UML
- **Diagrama de Clases:** Item, HomeScreen, _HomeScreenState  
- **Diagrama de Paquetes:** lib (main.dart, home_screen.dart, item.dart), test (widget_test.dart, item_test.dart)  
- **Diagrama de Componentes:** UI, Modelo, Controladores, Pruebas  

*(Exportados desde StarUML en formato PNG/PDF y adjuntados en la carpeta de evidencias)*

---

## 🚀 Ejecución
1. Clonar el repositorio:  
   ```bash
   git clone https://github.com/pachodavid1988/mi_app.git
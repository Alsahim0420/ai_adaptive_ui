import 'package:ai_adaptive_ui/ai_adaptive_ui.dart';
import 'package:flutter/material.dart';

// Este archivo sirve como el ejemplo principal para la librería ai_adaptive_ui.
// Demuestra cómo usar el AiLayoutSuggestor para generar y mostrar dinámicamente
// diferentes plantillas de UI predefinidas.

void main() {
  runApp(const MainExampleApp());
}

class MainExampleApp extends StatelessWidget {
  const MainExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Configuración de la aplicación principal con Material 3.
    return MaterialApp(
      title: 'AI Adaptive UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: const SuggestionDemoScreen(),
    );
  }
}

// 4. StatefulWidget para manejar el estado de la selección del layout.
class SuggestionDemoScreen extends StatefulWidget {
  const SuggestionDemoScreen({super.key});

  @override
  State<SuggestionDemoScreen> createState() => _SuggestionDemoScreenState();
}

class _SuggestionDemoScreenState extends State<SuggestionDemoScreen> {
  // El tipo de layout actualmente seleccionado.
  SuggestedLayoutType _selectedLayout = SuggestedLayoutType.dashboard;

  // Instancia del sugeridor de layouts.
  final AiLayoutSuggestor _suggestor = AiLayoutSuggestor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Adaptive UI Demo'),
      ),
      // 5. El layout principal es una columna para organizar los widgets.
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Demostración de Layouts Sugeridos',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                // 2. DropdownButton para seleccionar un tipo de layout.
                // 6. Se usa .values.map() para crear los items del dropdown.
                DropdownButton<SuggestedLayoutType>(
                  value: _selectedLayout,
                  isExpanded: true,
                  items: SuggestedLayoutType.values
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.name),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    if (newValue != null) {
                      // Actualiza el estado para que la UI se redibuje.
                      setState(() {
                        _selectedLayout = newValue;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          // 3. El widget generado por el AiLayoutSuggestor se muestra aquí.
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              // El widget cambia dinámicamente.
              child: _suggestor.suggest(_selectedLayout),
            ),
          ),
        ],
      ),
    );
  }
}

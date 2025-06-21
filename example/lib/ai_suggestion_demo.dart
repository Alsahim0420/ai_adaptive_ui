import 'package:ai_adaptive_ui/ai_adaptive_ui.dart';
import 'package:flutter/material.dart';

/// Este archivo sirve como una demostración visual completa de los layouts
/// predefinidos generados por la clase `AiLayoutSuggestor`.
void main() {
  runApp(const AiSuggestionDemoApp());
}

class AiSuggestionDemoApp extends StatelessWidget {
  const AiSuggestionDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Configuración de la aplicación principal con Material 3.
    return MaterialApp(
      title: 'AI Layout Suggestor Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
        brightness: Brightness.dark,
      ),
      home: const AiSuggestionDemoScreen(),
    );
  }
}

// 5. StatefulWidget para manejar el estado dinámico de la selección.
class AiSuggestionDemoScreen extends StatefulWidget {
  const AiSuggestionDemoScreen({super.key});

  @override
  State<AiSuggestionDemoScreen> createState() => _AiSuggestionDemoScreenState();
}

class _AiSuggestionDemoScreenState extends State<AiSuggestionDemoScreen> {
  // El tipo de layout actualmente seleccionado. Inicia con 'dashboard'.
  SuggestedLayoutType _selectedLayout = SuggestedLayoutType.dashboard;

  // Instancia del sugeridor de layouts.
  final AiLayoutSuggestor _suggestor = AiLayoutSuggestor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤖 AI Layout Suggestor Demo'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 2. Dropdown para seleccionar el tipo de layout.
          _buildLayoutSelector(),

          // 3. Área donde se muestra el layout sugerido.
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceVariant
                    .withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                ),
              ),
              // El widget cambia dinámicamente según la selección.
              child: _suggestor.suggest(_selectedLayout),
            ),
          ),
        ],
      ),
    );
  }

  /// Construye el selector de layouts con un DropdownButton.
  Widget _buildLayoutSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selecciona un tipo de layout:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          // 7. Uso de íconos y colores para diferenciar opciones.
          DropdownButton<SuggestedLayoutType>(
            value: _selectedLayout,
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down_circle_outlined),
            onChanged: (SuggestedLayoutType? newValue) {
              if (newValue != null) {
                // Actualiza el estado para redibujar el widget sugerido.
                setState(() {
                  _selectedLayout = newValue;
                });
              }
            },
            // 6. Muestra todos los tipos de layouts disponibles.
            items: SuggestedLayoutType.values
                .map<DropdownMenuItem<SuggestedLayoutType>>(
                  (SuggestedLayoutType value) =>
                      DropdownMenuItem<SuggestedLayoutType>(
                    value: value,
                    child: Row(
                      children: [
                        _getIconForLayout(value),
                        const SizedBox(width: 12),
                        Text(value.name),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  /// Devuelve un ícono representativo para cada tipo de layout.
  Icon _getIconForLayout(SuggestedLayoutType type) {
    switch (type) {
      case SuggestedLayoutType.profile:
        return const Icon(Icons.person_outline, color: Colors.blue);
      case SuggestedLayoutType.form:
        return const Icon(Icons.edit_note_outlined, color: Colors.orange);
      case SuggestedLayoutType.cardList:
        return const Icon(Icons.view_list_outlined, color: Colors.green);
      case SuggestedLayoutType.dashboard:
        return const Icon(Icons.dashboard_outlined, color: Colors.purple);
      case SuggestedLayoutType.onboarding:
        return const Icon(Icons.rocket_launch_outlined, color: Colors.cyan);
      case SuggestedLayoutType.errorScreen:
        return const Icon(Icons.error_outline, color: Colors.red);
      case SuggestedLayoutType.settings:
        return const Icon(Icons.settings_outlined, color: Colors.grey);
      case SuggestedLayoutType.unknown:
      default:
        return const Icon(Icons.help_outline, color: Colors.brown);
    }
  }
}

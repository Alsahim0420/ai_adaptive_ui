import 'package:flutter/material.dart';

/// Tipos de layouts predefinidos que pueden ser sugeridos.
enum SuggestedLayoutType {
  /// Un layout para mostrar un perfil de usuario.
  profile,

  /// Un layout para un formulario de entrada de datos.
  form,

  /// Un layout para mostrar una lista de tarjetas.
  cardList,

  /// Un layout para un dashboard o panel de control.
  dashboard,

  /// Un layout para una secuencia de onboarding o bienvenida.
  onboarding,

  /// Un layout para mostrar una pantalla de error.
  errorScreen,

  /// Un layout para una página de configuración o ajustes.
  settings,

  /// Un tipo de layout desconocido o no soportado.
  unknown,
}

/// Una clase que sugiere widgets predefinidos basados en un tipo de layout.
class AiLayoutSuggestor {
  /// Sugiere y construye un widget basado en el [SuggestedLayoutType] proporcionado.
  ///
  /// Ejemplo de uso:
  /// ```dart
  /// final suggestor = AiLayoutSuggestor();
  /// final dashboardWidget = suggestor.suggest(SuggestedLayoutType.dashboard);
  /// ```
  Widget suggest(SuggestedLayoutType type) {
    switch (type) {
      case SuggestedLayoutType.profile:
        return _buildProfileLayout();
      case SuggestedLayoutType.form:
        return _buildFormLayout();
      case SuggestedLayoutType.cardList:
        return _buildCardListLayout();
      case SuggestedLayoutType.dashboard:
        return _buildDashboardLayout();
      case SuggestedLayoutType.onboarding:
        return _buildOnboardingLayout();
      case SuggestedLayoutType.errorScreen:
        return _buildErrorScreenLayout();
      case SuggestedLayoutType.settings:
        return _buildSettingsLayout();
      case SuggestedLayoutType.unknown:
      default:
        return _buildUnknownLayout();
    }
  }

  /// Construye un widget de ejemplo para un perfil de usuario.
  Widget _buildProfileLayout() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
        SizedBox(height: 16),
        Text('Nombre de Usuario',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text('Descripción del usuario o biografía...'),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 4),
            Text('Ubicación'),
          ],
        )
      ],
    );
  }

  /// Construye un widget de ejemplo para un formulario.
  Widget _buildFormLayout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nombre Completo',
              hintText: 'Introduce tu nombre',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'tu@email.com',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: null, // Deshabilitado para el ejemplo
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }

  /// Construye un widget de ejemplo para una lista de tarjetas.
  Widget _buildCardListLayout() {
    return ListView(
      children: const [
        Card(
            child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Tarjeta 1'),
                subtitle: Text('Descripción de la tarjeta 1'))),
        Card(
            child: ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Tarjeta 2'),
                subtitle: Text('Descripción de la tarjeta 2'))),
        Card(
            child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Tarjeta 3'),
                subtitle: Text('Descripción de la tarjeta 3'))),
      ],
    );
  }

  /// Construye un widget de ejemplo para un dashboard.
  Widget _buildDashboardLayout() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildDashboardPanel(Icons.show_chart, 'Ventas', '1,234', Colors.blue),
        _buildDashboardPanel(Icons.group, 'Usuarios', '567', Colors.green),
        _buildDashboardPanel(
            Icons.shopping_cart, 'Órdenes', '89', Colors.orange),
        _buildDashboardPanel(Icons.comment, 'Comentarios', '45', Colors.purple),
      ],
    );
  }

  /// Construye un widget de ejemplo para una secuencia de onboarding.
  Widget _buildOnboardingLayout() {
    return PageView(
      children: [
        _buildOnboardingPage(Icons.lightbulb_outline, 'Bienvenido',
            'Descubre un mundo de posibilidades.'),
        _buildOnboardingPage(
            Icons.settings, 'Personaliza', 'Ajusta la app a tus necesidades.'),
        _buildOnboardingPage(Icons.rocket_launch, '¡Comenzamos!',
            'Todo listo para empezar la aventura.'),
      ],
    );
  }

  /// Construye un widget de ejemplo para una pantalla de error.
  Widget _buildErrorScreenLayout() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red),
          SizedBox(height: 16),
          Text('Ha ocurrido un error',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Por favor, inténtalo de nuevo más tarde.',
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  /// Construye un widget de ejemplo para una pantalla de configuración.
  Widget _buildSettingsLayout() {
    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Activar Notificaciones'),
          value: true,
          onChanged: (bool value) {},
          secondary: const Icon(Icons.notifications),
        ),
        SwitchListTile(
          title: const Text('Modo Oscuro'),
          value: false,
          onChanged: (bool value) {},
          secondary: const Icon(Icons.dark_mode),
        ),
        SwitchListTile(
          title: const Text('Compartir datos de uso'),
          value: true,
          onChanged: (bool value) {},
          secondary: const Icon(Icons.privacy_tip),
        ),
      ],
    );
  }

  /// Construye un widget para un layout desconocido.
  Widget _buildUnknownLayout() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: Colors.grey),
          SizedBox(height: 16),
          Text('Layout no disponible', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // --- Helpers para widgets complejos ---

  Widget _buildDashboardPanel(
      IconData icon, String title, String value, Color color) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: 40, color: color),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.grey)),
                Text(value,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(IconData icon, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 100, color: Colors.deepPurple),
        const SizedBox(height: 24),
        Text(title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Text(subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ),
      ],
    );
  }
}

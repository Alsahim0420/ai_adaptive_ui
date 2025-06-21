import 'package:flutter/material.dart';
import 'package:ai_adaptive_ui/ai_adaptive_ui.dart';

void main() {
  runApp(const MyApp());
}

/// Aplicación principal que demuestra el uso del paquete ai_adaptive_ui
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Adaptive UI Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
        // Configuración adicional para un diseño más moderno
        cardTheme: const CardTheme(
          elevation: 4,
          margin: EdgeInsets.all(8),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

/// Página principal que demuestra los layouts adaptativos
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🎨 AI Adaptive UI Demo',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surfaceVariant,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AdaptiveLayout(
            // Layout para pantallas pequeñas (móviles)
            small: (context) => _buildSmallLayout(context),
            // Layout para pantallas medianas (tablets)
            medium: (context) => _buildMediumLayout(context),
            // Layout para pantallas grandes (desktop)
            large: (context) => _buildLargeLayout(context),
          ),
        ),
      ),
    );
  }

  /// Layout para pantallas pequeñas: Lista vertical con tarjetas apiladas
  Widget _buildSmallLayout(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _buildInfoCard(context),
        const SizedBox(height: 16),
        _buildFeatureCard(context),
        const SizedBox(height: 16),
        _buildStatsCard(context),
        const SizedBox(height: 16),
        _buildActionCard(context),
      ],
    );
  }

  /// Layout para pantallas medianas: Fila horizontal con tarjetas expandidas
  Widget _buildMediumLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _buildInfoCard(context),
              const SizedBox(height: 16),
              _buildFeatureCard(context),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              _buildStatsCard(context),
              const SizedBox(height: 16),
              _buildActionCard(context),
            ],
          ),
        ),
      ],
    );
  }

  /// Layout para pantallas grandes: Grid de 3 columnas
  Widget _buildLargeLayout(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _buildInfoCard(context),
        _buildFeatureCard(context),
        _buildStatsCard(context),
        _buildActionCard(context),
        _buildSettingsCard(context),
        _buildProfileCard(context),
      ],
    );
  }

  // ===== TARJETAS DE EJEMPLO =====

  /// Tarjeta de información principal
  Widget _buildInfoCard(BuildContext context) {
    return AdaptiveCard(
      title: '🌟 Características Principales',
      subtitle:
          'Diseño adaptativo inteligente que se ajusta automáticamente a cualquier dispositivo',
      icon: Icons.auto_awesome,
      onTap: () => _showSnackBar(context, '✨ ¡Características principales!'),
    );
  }

  /// Tarjeta de funcionalidades
  Widget _buildFeatureCard(BuildContext context) {
    return AdaptiveCard(
      title: '⚡ Rendimiento Optimizado',
      subtitle: 'Widgets ligeros y eficientes para una experiencia fluida',
      icon: Icons.speed,
      onTap: () => _showSnackBar(context, '🚀 ¡Rendimiento optimizado!'),
    );
  }

  /// Tarjeta de estadísticas
  Widget _buildStatsCard(BuildContext context) {
    return AdaptiveCard(
      title: '📊 Estadísticas en Tiempo Real',
      subtitle:
          'Monitoreo y análisis de datos con visualizaciones interactivas',
      icon: Icons.analytics,
      onTap: () => _showSnackBar(context, '📈 ¡Estadísticas actualizadas!'),
    );
  }

  /// Tarjeta de acciones
  Widget _buildActionCard(BuildContext context) {
    return AdaptiveCard(
      title: '🎯 Acciones Rápidas',
      subtitle: 'Acceso directo a las funciones más utilizadas',
      icon: Icons.touch_app,
      onTap: () => _showSnackBar(context, '🎯 ¡Acción ejecutada!'),
    );
  }

  /// Tarjeta de configuración (solo para pantallas grandes)
  Widget _buildSettingsCard(BuildContext context) {
    return AdaptiveCard(
      title: '⚙️ Configuración Avanzada',
      subtitle: 'Personaliza la experiencia según tus preferencias',
      icon: Icons.settings,
      onTap: () => _showSnackBar(context, '⚙️ ¡Configuración abierta!'),
    );
  }

  /// Tarjeta de perfil (solo para pantallas grandes)
  Widget _buildProfileCard(BuildContext context) {
    return AdaptiveCard(
      title: '👤 Perfil de Usuario',
      subtitle: 'Gestiona tu información personal y preferencias',
      icon: Icons.person,
      onTap: () => _showSnackBar(context, '👤 ¡Perfil actualizado!'),
    );
  }

  /// Muestra un mensaje de confirmación al usuario
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

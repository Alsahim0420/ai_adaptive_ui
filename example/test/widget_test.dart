// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ai_adaptive_ui/ai_adaptive_ui.dart';
import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Suggestion Demo smoke test', (WidgetTester tester) async {
    // 1. Construye la app y dispara un frame.
    await tester.pumpWidget(const MainExampleApp());

    // 2. Verifica que el título y el layout inicial (dashboard) se muestren.
    expect(find.text('AI Adaptive UI Demo'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget,
        reason: 'El layout inicial debe ser el dashboard (GridView)');
    expect(find.byType(PageView), findsNothing,
        reason: 'El layout de onboarding no debería estar visible al inicio');

    // 3. Abre el DropdownButton.
    await tester.tap(find.byType(DropdownButton<SuggestedLayoutType>));
    await tester
        .pumpAndSettle(); // Espera a que la animación del dropdown termine.

    // 4. Selecciona el layout 'onboarding'.
    // Se busca por el texto del item en el menú desplegable.
    await tester.tap(find.text('onboarding').last);
    await tester.pumpAndSettle(); // Espera a que la UI se actualice.

    // 5. Verifica que el layout ha cambiado a onboarding.
    expect(find.byType(PageView), findsOneWidget,
        reason:
            'El layout de onboarding (PageView) debería estar visible ahora');
    expect(find.byType(GridView), findsNothing,
        reason: 'El layout de dashboard ya no debería estar visible');

    // 6. Verifica que el texto de una de las páginas de onboarding exista.
    expect(find.text('Descubre un mundo de posibilidades.'), findsOneWidget);
  });
}

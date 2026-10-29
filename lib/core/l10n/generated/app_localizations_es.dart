// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Mise';

  @override
  String get retry => 'Reintentar';

  @override
  String get back => 'Volver';

  @override
  String get close => 'Cerrar';

  @override
  String get errorLoadData => 'No pudimos leer los datos de esta receta.';

  @override
  String get errorNotFound => 'No encontramos esa receta.';

  @override
  String get errorUnexpected => 'Algo salió mal. Probá de nuevo.';

  @override
  String get errorOffline =>
      'Estás sin conexión. Revisá tu red y probá de nuevo.';

  @override
  String get errorTimeout => 'Está tardando demasiado. Probá de nuevo.';

  @override
  String get errorServer =>
      'El servicio de recetas tiene problemas. Probá en un rato.';

  @override
  String get navDiscover => 'Descubrir';

  @override
  String get navSaved => 'Guardadas';

  @override
  String get navPantry => 'Lo que tengo';

  @override
  String get pantryTitle => '¿Qué hay en tu cocina?';

  @override
  String get pantrySubtitle =>
      'Agregá lo que tenés y te sugerimos platos que lo usan.';

  @override
  String get pantryAddHint => 'Agregar un ingrediente';

  @override
  String get pantryCatalogError =>
      'No pudimos cargar la lista de ingredientes.';

  @override
  String pantryYours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tu despensa · $count',
      one: 'Tu despensa · 1',
    );
    return '$_temp0';
  }

  @override
  String get pantryClear => 'Vaciar todo';

  @override
  String get pantryCleared => 'Vaciaste tu despensa.';

  @override
  String removeIngredient(String name) {
    return 'Quitar $name';
  }

  @override
  String addIngredient(String name) {
    return 'Agregar $name';
  }

  @override
  String get pantryEmpty => 'Empezá con dos o tres cosas que tengas en casa.';

  @override
  String get pantrySuggestions => 'Populares';

  @override
  String get pantryReady => 'Podés hacerlas ya';

  @override
  String get pantryAlmost => 'Te falta poco';

  @override
  String get pantryIdeas => 'Otras ideas';

  @override
  String pantryUses(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Usa $count de los tuyos',
      one: 'Usa 1 de los tuyos',
    );
    return '$_temp0';
  }

  @override
  String get pantryHaveAll => 'Tenés todo';

  @override
  String pantryMissing(String names) {
    return 'Te falta: $names';
  }

  @override
  String get pantryNoMatches =>
      'Ninguna receta usa estos ingredientes. Probá agregar otro.';

  @override
  String get pantryBasics =>
      'Sal, pimienta, agua y aceite cuentan como que siempre los tenés.';

  @override
  String get discoverEyebrow => 'Mise en place';

  @override
  String get discoverTitle => '¿Qué cocinamos\nhoy?';

  @override
  String get searchHint => 'Buscar recetas';

  @override
  String get clearSearch => 'Borrar búsqueda';

  @override
  String get todaysPick => 'Para hoy';

  @override
  String get categories => 'Categorías';

  @override
  String get cuisines => 'Países';

  @override
  String resultsFor(String query) {
    return 'Resultados para “$query”';
  }

  @override
  String noResults(String query) {
    return 'Ninguna receta coincide con “$query”.';
  }

  @override
  String recipeMeta(String category, String area) {
    return '$category · $area';
  }

  @override
  String openRecipe(String name) {
    return 'Abrir $name';
  }

  @override
  String get ingredients => 'Ingredientes';

  @override
  String ingredientCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ingredientes',
      one: '1 ingrediente',
    );
    return '$_temp0';
  }

  @override
  String get method => 'Preparación';

  @override
  String stepCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pasos',
      one: '1 paso',
    );
    return '$_temp0';
  }

  @override
  String get startCooking => 'Empezar a cocinar';

  @override
  String stepOf(int current, int total) {
    return 'Paso $current de $total';
  }

  @override
  String get nextStep => 'Paso siguiente';

  @override
  String get previousStep => 'Paso anterior';

  @override
  String get doneCooking => '¡Listo! A disfrutar.';

  @override
  String get stepNeeds => 'Vas a necesitar';

  @override
  String startTimer(String duration) {
    return 'Temporizador de $duration';
  }

  @override
  String get pauseTimer => 'Pausar temporizador';

  @override
  String get resumeTimer => 'Reanudar temporizador';

  @override
  String get stopTimer => 'Detener temporizador';

  @override
  String get timerDone => '¡Tiempo!';

  @override
  String get finish => 'Terminar';

  @override
  String get save => 'Guardar receta';

  @override
  String get unsave => 'Quitar de guardadas';

  @override
  String get savedTitle => 'Guardadas';

  @override
  String get savedSubtitle =>
      'En este dispositivo, listas aunque no haya conexión.';

  @override
  String get savedEmpty =>
      'Las recetas que guardes aparecen acá, incluso sin conexión.';

  @override
  String get savedEmptyAction => 'Descubrir recetas';

  @override
  String get savedOffline => 'Sin conexión: mostramos tu copia guardada.';

  @override
  String removedFromSaved(String name) {
    return 'Quitaste “$name”.';
  }

  @override
  String get undo => 'Deshacer';

  @override
  String get removeSaved => 'Quitar';
}

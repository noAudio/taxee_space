import 'dart:html';

import '../models/system.dart';

/// Handles the view for the search textboxes.
class SearchBar {
  var defaultSearchBar =
      querySelector('#default-searchbox') as TextInputElement;
  var originSearchBar = querySelector('#origin-searchbox') as TextInputElement;
  var destinationSearchBar =
      querySelector('#destination-searchbox') as TextInputElement;
  var expandButton = querySelector("#expand-search") as Element;
  var exchangeInputs = querySelector("#exchange-search") as Element;
  var resultsPanel = querySelector('#results-panel') as DivElement;

  void expandSearch(Event event) {
    defaultSearchBar.classes.toggleAll(['hide']);
    originSearchBar.classes.toggleAll(['hide']);
    destinationSearchBar.classes.toggleAll(['hide']);
    expandButton.classes.toggleAll(["fa-chevron-down", "fa-chevron-up"]);
    exchangeInputs.classes.toggleAll(['hide']);
  }

  void switchSearchTerms(Event event) {
    String? originSystem = originSearchBar.value;
    String? destinationSystem = destinationSearchBar.value;

    originSearchBar.value = destinationSystem;
    destinationSearchBar.value = originSystem;
  }

  void populateResults(Event event) {
    var matchingSystems = <Element>[];

    var data = [];

    for (System system in data) {
      matchingSystems.add(
        DivElement()
          ..classes.addAll(['flex-row', 'result'])
          ..children.addAll([
            ParagraphElement()
              ..classes.addAll(['distance'])
              ..text = "${system.distance} ly"
              ..id = system.systemID,
            ParagraphElement()
              ..classes.addAll(['system-name'])
              ..text = system.name,
          ]),
      );
    }

    if (matchingSystems.isNotEmpty) {
      resultsPanel.classes.remove('hide');
      resultsPanel.children
        ..clear()
        ..addAll(matchingSystems);
    } else if (defaultSearchBar.value == '') {
      resultsPanel.classes.addAll(['hide']);
    } else {
      resultsPanel.classes.remove('hide');
      resultsPanel.children
        ..clear()
        ..add(
          ParagraphElement()
            ..text = "No matching results found"
            ..classes.addAll(['nil-results']),
        );
    }
  }
}

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
    var data = [
      System(
        systemID: '1471',
        name: 'LHS 450',
        distance: 14.78,
        coordinates: ReceivedCoordinates(
          x: -12.40625,
          y: 7.8125,
          z: -1.875,
        ),
      ),
      System(
        systemID: '25873',
        name: 'WISE 1741+2553',
        distance: 17.98,
        coordinates: ReceivedCoordinates(
          x: -12.40625,
          y: 7.90625,
          z: 10.34375,
        ),
      ),
      System(
        systemID: '8228',
        name: 'Altair',
        distance: 16.74,
        coordinates: ReceivedCoordinates(
          x: -12.3125,
          y: -2.75,
          z: 11,
        ),
      ),
      System(
        systemID: '11158',
        name: '61 Cygni',
        distance: 11.37,
        coordinates: ReceivedCoordinates(
          x: -11.21875,
          y: -1.1875,
          z: 1.40625,
        ),
      ),
      System(
        systemID: '9935',
        name: 'LHS 2459',
        distance: 17.46,
        coordinates: ReceivedCoordinates(
          x: -11,
          y: 10.78125,
          z: -8.21875,
        ),
      ),
    ];

    var matchingSystems = <Element>[];

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

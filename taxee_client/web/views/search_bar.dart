import 'dart:html';

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

  void nilResults(Event event) {
    List<String> searchTerms = [];

    // TODO get searchbox contents and append to list of search terms

    if (searchTerms.isNotEmpty) {
      resultsPanel.classes.remove('hide');
      resultsPanel.children
        ..clear()
        ..add(ParagraphElement()
          ..text = "No matching results found"
          ..classes.addAll(['nil-results']));
    }
  }
}

import "dart:html";
import 'views/search_bar.dart';

void main() {
  (querySelector('#expand-search') as Element)
      .onClick
      .listen(SearchBar().expandSearch);
  (querySelector('#exchange-search') as Element)
      .onClick
      .listen(SearchBar().switchSearchTerms);
}

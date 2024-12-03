import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  // A list of suggestions for the search
  final List<String> _suggestions = [
    'Bitcoin',
    'Ethereum',
    'Litecoin',
    'Ripple',
    'Solana',
    'Cardano',
    'Polkadot',
    'Binance Coin',
  ];

  // Method to build the actions in the search bar (e.g., clear button)
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  // Method to build the leading widget (e.g., back button)
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Close the search page
      },
    );
  }

  // Method to build the search results based on the query
  @override
  Widget buildResults(BuildContext context) {
    // You can implement your actual search logic here
    final List<String> results = _suggestions
        .where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]); // Close and return the selected result
          },
        );
      },
    );
  }

  // Method to build the suggestions list as the user types
  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestions = query.isEmpty
        ? _suggestions // Show all suggestions when the query is empty
        : _suggestions
            .where((suggestion) => suggestion.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index]; // Update the query with the suggestion
            showResults(context); // Show results for the updated query
          },
        );
      },
    );
  }
}

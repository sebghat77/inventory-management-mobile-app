# Implementation Highlights

Selected Flutter/Dart components demonstrate the main application patterns and business logic.

| Area | File | Technical focus |
| --- | --- | --- |
| Inventory UI | [`item_card.dart`](../source-extracts/item_card.dart) | item fields, quantity and cost state |
| Inventory & search | [`item_history_firestore.dart`](../source-extracts/item_history_firestore.dart) | authenticated Firestore paths, snapshot streams and UI |
| Stock updates | [`data_entry_firestore.dart`](../source-extracts/data_entry_firestore.dart) | validation, Firestore writes, queries and `FieldValue.increment` |
| Transaction history | [`transaction_history.dart`](../source-extracts/transaction_history.dart) | timestamp ordering and date-window queries |
| Drawer navigation | [`navigation_drawer.dart`](../source-extracts/navigation_drawer.dart) | navigation between business areas |
| Main navigation | [`main_navigation.dart`](../source-extracts/main_navigation.dart) | tabs and bottom navigation |
| Weekly overview | [`business_overview_weekly.dart`](../source-extracts/business_overview_weekly.dart) | date filtering and aggregate business values |

## Engineering Concepts Demonstrated

The implementation shows practical use of Firebase Authentication, user-scoped Firestore collections, real-time snapshot streams, form validation, asynchronous cloud operations, inventory state updates, date-based queries and Flutter navigation.

For additional context, see the [architecture](ARCHITECTURE.md) and [application workflows](WORKFLOWS.md).

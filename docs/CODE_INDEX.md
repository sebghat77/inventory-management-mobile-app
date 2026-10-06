# Code Excerpts

The bachelor report contains substantial Flutter/Dart implementation code. The files below preserve the most useful project-specific excerpts in readable form.

> These are excerpts from the report, not a reconstruction of the complete original source tree.

| Area | File | Demonstrates |
| --- | --- | --- |
| Inventory card | [`item_card.dart`](../source-extracts/item_card.dart) | item fields, quantity and cost state |
| Inventory / search | [`item_history_firestore.dart`](../source-extracts/item_history_firestore.dart) | authenticated Firestore path, snapshot stream and UI |
| Data entry / stock update | [`data_entry_firestore.dart`](../source-extracts/data_entry_firestore.dart) | validation, Firestore writes, queries and `FieldValue.increment` |
| Sales / transaction history | [`transaction_history.dart`](../source-extracts/transaction_history.dart) | timestamp ordering and date-window queries |
| Drawer navigation | [`navigation_drawer.dart`](../source-extracts/navigation_drawer.dart) | navigation between business areas |
| Main navigation | [`main_navigation.dart`](../source-extracts/main_navigation.dart) | tabs and bottom navigation |
| Weekly overview | [`business_overview_weekly.dart`](../source-extracts/business_overview_weekly.dart) | date filtering and aggregate business values |

The complete sanitized bachelor report is available in [`report-parts/`](report-parts/README.md).

Only PDF line wrapping and formatting were normalized in these excerpts. Missing surrounding code was not invented.

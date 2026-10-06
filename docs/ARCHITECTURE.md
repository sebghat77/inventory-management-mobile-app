# Architecture

This document explains the architecture evidenced by the bachelor project report and the source code preserved in this repository.

## High-level view

```mermaid
flowchart TB
    A[Authenticated User] --> B[Flutter / Dart Client]
    B --> C[Firebase Authentication]
    B --> D[(Firebase Firestore)]

    D --> E[Item / Inventory Data]
    D --> F[Sales Records]
    D --> G[Transaction Records]
    D --> H[Expense & related business data]

    E --> I[Current State]
    F --> I
    G --> I
    H --> I

    I --> J[Search & History]
    I --> K[Daily / Weekly / Monthly / Yearly Overview]
```

## Design intent

The system was conceived for remote business visibility. The client should allow a shop or warehouse owner to inspect recorded stock, sales, expenses, and monetary activity without needing to physically reconstruct the business state every time.

The important design idea is that inventory is not treated as an isolated list. Business events are recorded and connected to the current state.

## User-scoped data

Recovered code repeatedly uses the authenticated user identifier:

```dart
FirebaseAuth.instance.currentUser!.uid
```

Firestore paths visible in the report include patterns such as:

```text
Iusers/{uid}/Item
Iusers/{uid}/Sales
Iusers/{uid}/Transactions
```

This is evidence that data is stored per signed-in account.

## Inventory read flow

The preserved `ItemHistory` implementation creates a Firestore snapshot stream and renders it with Flutter `StreamBuilder`.

```mermaid
sequenceDiagram
    participant U as User
    participant A as Flutter UI
    participant F as Firestore

    U->>A: Open inventory/history
    A->>F: Subscribe to Item collection
    F-->>A: QuerySnapshot
    A-->>U: Render item cards
    F-->>A: Updated snapshot
    A-->>U: Refresh displayed state
```

## Stock-entry write flow

A preserved section of the report shows a business event being recorded in the `Transactions` collection and then the corresponding inventory item being located and updated.

```mermaid
sequenceDiagram
    participant U as User
    participant A as Flutter UI
    participant T as Transactions
    participant I as Item

    U->>A: Enter received/bought stock
    A->>T: Add transaction record
    A->>I: Find matching item
    A->>I: Increment quantity / total cost
    I-->>A: Updated inventory state
```

The code uses Firestore operations including:

- `add(...)`
- `where(...)`
- `update(...)`
- `FieldValue.increment(...)`

## History and monitoring

The report contains timestamp-ordered sales history and time-based transaction views. A preserved weekly query filters transaction data by `dateTime`, while the UI screenshots show today, weekly, monthly, and yearly business overviews.

This architecture supports two complementary views:

1. **current state** — what the recorded inventory/business state is now;
2. **history** — how that state was reached through recorded business events.

## Public repository boundary

The full bachelor report is preserved in `docs/` as a sanitized public artifact. The original development repository is not represented as fully recovered, so the architecture described above remains limited to what is directly evidenced by the report, original screenshots, and selected report-derived source excerpts.

# Architecture

## System Overview

The application uses a Flutter/Dart client connected to Firebase Authentication and Firebase Firestore. Business data is scoped to the authenticated user and organized around inventory, sales, transactions and expenses.

~~~mermaid
flowchart TB
    A[Authenticated User] --> B[Flutter / Dart Client]
    B --> C[Firebase Authentication]
    B --> D[(Firebase Firestore)]
    D --> E[Inventory]
    D --> F[Sales]
    D --> G[Transactions]
    D --> H[Expenses]
    E --> I[Current Business State]
    F --> I
    G --> I
    H --> I
    I --> J[Search & History]
    I --> K[Daily / Weekly / Monthly / Yearly Overview]
~~~

## Design

The system connects operational events with the current business state rather than treating inventory as a standalone list. Stock entries, sales, expenses and other transactions contribute to a unified view of business activity.

## Authentication & User-Scoped Data

The application uses the authenticated Firebase user ID to scope Firestore data:

~~~dart
FirebaseAuth.instance.currentUser!.uid
~~~

Example collection paths used by the application:

~~~text
Iusers/{uid}/Item
Iusers/{uid}/Sales
Iusers/{uid}/Transactions
~~~

This structure separates business data by signed-in account and supports access across devices.

## Inventory Read Flow

Inventory views subscribe to Firestore snapshot streams and render updates through Flutter.

~~~mermaid
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
~~~

## Stock Update Flow

Incoming stock is recorded as a business transaction and then reflected in the matching inventory item.

~~~mermaid
sequenceDiagram
    participant U as User
    participant A as Flutter UI
    participant T as Transactions
    participant I as Item
    U->>A: Enter received stock
    A->>T: Add transaction record
    A->>I: Find matching item
    A->>I: Increment quantity / total cost
    I-->>A: Updated inventory state
~~~

Key Firestore operations include `add(...)`, `where(...)`, `update(...)` and `FieldValue.increment(...)`.

## Business History & Monitoring

Timestamped records support both current-state and historical views. Date-based queries power daily, weekly, monthly and yearly monitoring, allowing the application to show both the current recorded state and the business events that produced it.

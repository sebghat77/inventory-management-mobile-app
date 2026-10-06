# Inventory & Business Monitoring System

<p>
  <img alt="Flutter" src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white">
  <img alt="Dart" src="https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white">
  <img alt="Firebase" src="https://img.shields.io/badge/Firebase-Firestore%20%26%20Auth-FFCA28?logo=firebase&logoColor=black">
  <img alt="Android Studio" src="https://img.shields.io/badge/Android%20Studio-3DDC84?logo=androidstudio&logoColor=white">
  <img alt="Git" src="https://img.shields.io/badge/Git-F05032?logo=git&logoColor=white">
  <img alt="Bachelor Project" src="https://img.shields.io/badge/Bachelor%20Project-2022-555">
</p>


A cloud-backed system for shops and warehouses to track **inventory, stock purchases, sales, expenses, money movements and business history** from one account.

The project started from a practical problem: an owner should be able to see what came in, what went out, how much money moved, and whether the recorded stock and financial state still make sense - without having to be physically present at the shop or warehouse.

## Screenshots

<table>
  <tr>
    <td width="50%"><img src="screenshots/business-overview.webp" alt="Business overview"></td>
    <td width="50%"><img src="screenshots/stock-workflow.webp" alt="Stock workflow"></td>
  </tr>
  <tr>
    <td align="center"><b>Business overview</b></td>
    <td align="center"><b>Stock entry and history</b></td>
  </tr>
</table>

[View the full workflow gallery](docs/WORKFLOWS.md)

## What the system does

- manages inventory items, quantities and cost information;
- records stock purchases and updates the related inventory state;
- records sales, including unpaid/credit amounts;
- records expenses and other money-related activity;
- keeps timestamped sales and transaction history;
- provides daily, weekly, monthly, yearly and all-time summaries;
- uses authenticated, user-specific cloud data that can be accessed from different devices.

## How it works

```mermaid
flowchart LR
    U[User] --> A[Flutter / Dart]
    A --> AU[Firebase Authentication]
    A --> F[(Firebase Firestore)]
    F --> I[Inventory]
    F --> S[Sales]
    F --> T[Transactions]
    F --> E[Expenses]
    I --> O[Current state & history]
    S --> O
    T --> O
    E --> O
```

The implementation preserved in the bachelor report shows Firestore paths scoped to the signed-in user, snapshot streams rendered with Flutter `StreamBuilder`, and transaction logic that updates the corresponding inventory records.

For example, when stock is received, the system records the transaction and then updates the matching item's quantity and cost values. This connection between business events and the current inventory state is one of the main ideas behind the project.

## Tech

- **Flutter / Dart** — UI, navigation, forms and application logic
- **Firebase Firestore** — cloud data, queries, writes and snapshot streams
- **Firebase Authentication** — user-scoped access
- **Android Studio** — original development environment
- **Git / GitHub** — version control

## Project material

- [Bachelor project report](docs/report-parts/README.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Workflow gallery](docs/WORKFLOWS.md)
- [Code excerpts](docs/CODE_INDEX.md)
- [Project evidence](docs/PROJECT_EVIDENCE.md)

The original full development repository is no longer available. This repository preserves the bachelor report, original project screenshots and selected source-code excerpts recovered from the report. Missing files or historical commits have not been recreated.

## Academic context

- **Degree:** Bachelor of Computer Science
- **Institution:** Aria University, Afghanistan
- **Original project title:** *Inventory Management Mobile App*
- **Submitted:** 2022
- **Author:** Sebghatullah Yarzada
- **Supervisor:** Dr. Yama Ramin


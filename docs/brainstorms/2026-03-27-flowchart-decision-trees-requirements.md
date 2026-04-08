---
date: 2026-03-27
topic: flowchart-decision-trees
---

# Flowchart Decision Trees

## Problem Frame
Board questions test clinical decision-making as branching logic (given X, choose Y). Currently, this logic is buried in text and tables. Residents need to practice *navigating* the decision tree, not just reading about it. Interactive flowcharts let them tap through the same decision path a board question would test.

## Requirements
- R1. Build a `FlowchartBlock` content block that renders an interactive guided decision tree
- R2. Each flowchart starts at a root node (clinical scenario) and branches based on yes/no or multi-option decisions
- R3. Only the current decision point and its options are visible (progressive reveal, not full tree)
- R4. Tapping an option reveals the next decision node or a leaf (final answer)
- R5. Leaf nodes show: the recommended device/orthosis, a brief rationale, and a board pearl
- R6. After reaching a leaf, show a "path summary" — the chain of decisions made — and a "Start Over" button
- R7. Build 5 flowcharts for the core board algorithms:
  - AFO selection (foot drop → spasticity → quad strength → recurvatum)
  - Prosthetic foot by K-level (K0-K4 → amputation level → component)
  - Cervical orthosis by fracture level (upper vs lower C-spine → stability → orthosis)
  - TF knee unit selection (K-level → fall risk → activity → knee type)
  - UE prosthetic type (amputation level → vocation → cosmesis priority → body-powered vs myoelectric)
- R8. Each flowchart is placed in the relevant module content file as a `FlowchartBlock`

## Success Criteria
- A resident can tap through a flowchart in under 60 seconds and reach the correct answer
- Each flowchart covers the decision logic that appears in board questions for that topic
- Flowcharts work within the existing collapsible section and board-only toggle infrastructure

## Scope Boundaries
- No scoring or tracking (session-only, like checkpoints)
- No user-created flowcharts
- No animated transitions between nodes (simple fade is sufficient)
- Only the 5 core algorithms — additional flowcharts can be added later using the same data model

## Key Decisions
- **Guided walkthrough** over full-tree view: reduces cognitive load, forces active decision-making, mirrors board question structure
- **Data-driven** (not canvas-drawn): flowcharts are defined as data structures in Dart, not as images or SVGs — this makes them easy to author and maintain

## Outstanding Questions

### Deferred to Planning
- [Affects R1][Technical] Best data structure for representing the decision tree (recursive node model vs flat map with IDs)

## Next Steps
-> Proceed directly to work — scope is clear, patterns exist

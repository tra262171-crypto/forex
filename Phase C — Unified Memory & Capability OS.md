# TUNGNS Trading OS

# Phase C — Unified Memory & Capability OS

### Inspired by MiMo Long Horizon

---

# Purpose

Phase C có hai mục tiêu:

1. Xây dựng Memory OS duy nhất.
2. Xây dựng Skill Registry duy nhất.

Mục tiêu cuối cùng:

```text
One Skill Registry
↓
One Memory OS
↓
One Source Of Truth
```

để chuẩn bị cho:

```text
Phase D — Governance OS
Phase E — Evolution OS
```

---

# Core Philosophy

Một capability chỉ tồn tại một lần.

Một memory chỉ tồn tại một lần.

Robot không được có:

* duplicate skills;
* duplicate memories;
* duplicate imports;
* multiple sources of truth.

---

# Final Backend Architecture

```text
backend/app/

skills/
memory/
governance/
evolution/
agents/
hooks/
```

---

# Memory OS

## Only Keep

```text
backend/app/memory/
```

## Remove

```text
memory/
```

ở root.

---

# Memory Structure

```text
backend/app/memory/

__init__.py

memory_manager.py
memory_models.py
memory_index.py

winners/
failures/
patterns/
strategies/
regimes/
sessions/
statistics/
evidence/

examples/
metrics/
tests/
```

---

# Memory Philosophy

Memory không lưu:

* opinions;
* emotions;
* guesses.

Memory chỉ lưu:

```text
Evidence
Winners
Failures
Patterns
Strategies
Regimes
Sessions
Statistics
```

---

# Learning Flow

```text
Trade
↓
Journal Engine
↓
Evidence
↓
Memory
↓
Pattern Discovery
↓
Evolution
```

---

# Capability OS

## Only Keep

```text
backend/app/skills/
```

---

# Remove Legacy Modules

```text
backend/app/market/
backend/app/guard/
backend/app/execution/
backend/app/sweep/
```

---

# Remove Kebab Case Skills

```text
journal-engine/
portfolio-analysis/
risk-engine/
optimization-engine/
```

---

# Standard Naming

Chỉ dùng:

```text
snake_case
```

Ví dụ:

```text
journal_engine/
portfolio_analysis/
risk_engine/
optimization_engine/
```

---

# Final Skill Registry

```text
backend/app/skills/

market_analysis/
setup_detection/
risk_engine/
execution_engine/
hedge_engine/
optimization_engine/
sweep_engine/

journal_engine/
portfolio_analysis/
backtesting/
```

---

# Migration Mapping

| Legacy    | New              |
| --------- | ---------------- |
| market    | market_analysis  |
| strategy  | setup_detection  |
| guard     | risk_engine      |
| execution | execution_engine |
| sweep     | sweep_engine     |

---

# Import Migration

## Old

```python
from backend.app.market.market_service import ...
```

## New

```python
from backend.app.skills.market_analysis import ...
```

---

## Old

```python
from backend.app.guard.risk_manager import ...
```

## New

```python
from backend.app.skills.risk_engine import ...
```

---

## Old

```python
from backend.app.execution.executor import ...
```

## New

```python
from backend.app.skills.execution_engine import ...
```

---

## Old

```python
from backend.app.sweep.sweep_engine import ...
```

## New

```python
from backend.app.skills.sweep_engine import ...
```

---

# One Source Of Truth

Sau Phase C:

```text
Agents
↓
Skills
↓
Memory
↓
Governance
↓
Evolution
```

Không còn:

```text
market/
guard/
execution/
sweep/
```

song song với:

```text
skills/
```

Không còn:

```text
memory/
```

song song với:

```text
backend/app/memory/
```

---

# Completion Criteria

Phase C chỉ được xem là hoàn thành khi:

### Không còn tồn tại

```text
memory/

backend/app/market/
backend/app/guard/
backend/app/execution/
backend/app/sweep/
```

### Chỉ còn

```text
backend/app/skills/
backend/app/memory/
```

---

# Status After Phase C

```text
Skill Registry        ✓
Journal Engine        ✓
Portfolio Analysis    ✓
Backtesting           ✓
Memory OS             ✓
Capability Migration  ✓
```

---

# Long Horizon Flow

```text
Capability
↓
Evidence
↓
Memory
↓
Pattern Discovery
↓
Evolution
```

---

# Next Phase

```text
Phase D — Governance OS
```

Cấu trúc:

```text
backend/app/governance/

governance_manager.py

risk_rules.yaml
capital_rules.yaml
permissions.yaml
```

---

# Final Goal

Robot không phải Signal Bot.

Robot không phải EA.

Robot là:

```text
Adaptive Trading Operating System
```

theo triết lý MiMo Long Horizon:

```text
Evidence
↓
Memory
↓
Pattern Discovery
↓
Evolution
```

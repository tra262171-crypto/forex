# Live Trading on cTrader

## Overview

TUNGNS Trading OS supports live trading on cTrader platform. By default, live trading is **disabled** for safety. This document explains how to enable it for demo/live trading.

---

## Quick Start

### Option 1: Automatic Setup (Recommended)

```bash
chmod +x enable_live_trading.sh
./enable_live_trading.sh
```

### Option 2: Manual Setup

Edit `.env` file:

```env
ALLOW_LIVE_EXECUTION=true
BROKER_MODE=ctrader
```

---

## Configuration

### Required Environment Variables

```env
# Enable live trading execution
ALLOW_LIVE_EXECUTION=true

# Set broker to cTrader
BROKER_MODE=ctrader

# Risk management (must be configured)
MAX_DRAWDOWN_PCT=10
EQUITY_GUARD_PCT=5
MAX_SPREAD_POINTS=25
MAX_API_LATENCY_MS=1200
```

### Risk Settings Explanation

| Setting | Default | Purpose |
|---------|---------|---------|
| `MAX_DRAWDOWN_PCT` | 10 | Maximum allowed drawdown before robot stops |
| `EQUITY_GUARD_PCT` | 5 | Minimum equity protection threshold |
| `MAX_SPREAD_POINTS` | 25 | Maximum acceptable spread in points |
| `MAX_API_LATENCY_MS` | 1200 | Maximum acceptable API latency |

---

## Pre-Launch Checklist

Before enabling live trading:

- [ ] Test system in MOCK mode (default)
- [ ] Test system in PAPER mode (paper trading)
- [ ] Review all risk parameters
- [ ] Verify account balance
- [ ] Configure cTrader API credentials
- [ ] Test order execution in paper mode
- [ ] Set up monitoring and alerts
- [ ] Review governance rules in `backend/app/governance/`

---

## cTrader Integration

### Connection Setup

```python
# backend/app/execution/order_router.py
# Configure cTrader credentials here
```

### Supported Order Types

- Market Order
- Limit Order
- Stop Loss
- Take Profit

### Position Management

The robot automatically manages:
- Hedge positions
- Risk exposure
- Portfolio balancing
- Drawdown protection

---

## Safety Mechanisms

### Governance Layer

Evolution OS includes automatic safety checks:

1. **Risk Validation**: Every trade is validated against risk rules
2. **Capital Protection**: Account drawdown is continuously monitored
3. **Session Rules**: Trading is restricted to configured sessions
4. **Spread Control**: Trades are rejected if spread exceeds limits

---

## Starting Live Trading

### Step 1: Verify Configuration

```bash
python -c "from app.core.runtime import settings; print(f'Live Enabled: {settings.allow_live_execution}'); print(f'Broker: {settings.broker_mode}')"
```

### Step 2: Run Tests

```bash
/home/codespace/.python/current/bin/python -m pytest backend/app/evolution/tests/ -q
```

### Step 3: Start Robot

```bash
python backend/app/main.py
```

---

## Monitoring

### Check Robot Status

```bash
curl http://localhost:8000/api/v1/robot/status
```

### View Live Trading Events

```bash
tail -f execution_logs.jsonl
```

### Monitor Memory and Patterns

```bash
curl http://localhost:8000/api/v1/memory/all
```

---

## Emergency Stop

To immediately disable live trading without code changes:

```bash
# Edit .env
ALLOW_LIVE_EXECUTION=false

# Restart robot
# Kill current process and restart
```

---

## Troubleshooting

### Issue: "Live execution disabled"

**Solution**: Check `.env` file contains `ALLOW_LIVE_EXECUTION=true`

### Issue: "cTrader connection failed"

**Solution**: Verify cTrader API credentials and network connectivity

### Issue: "Governance blocked trade"

**Solution**: Check governance rules and current risk metrics

### Issue: "Spread too high"

**Solution**: Adjust `MAX_SPREAD_POINTS` or wait for better market conditions

---

## Reverting to Mock/Paper Mode

```bash
# Option 1: Edit .env
ALLOW_LIVE_EXECUTION=false

# Option 2: Run script
sed -i 's/ALLOW_LIVE_EXECUTION=true/ALLOW_LIVE_EXECUTION=false/' .env
```

---

## Support

For issues or questions:

1. Check Evolution OS test status: `pytest backend/app/evolution/tests/ -q`
2. Review logs: `tail -f execution_logs.jsonl`
3. Check governance rules: `backend/app/governance/`
4. Verify Memory OS: `curl http://localhost:8000/api/v1/memory/all`

---

## Architecture

```
Live Trading Flow:

Market Data
    ↓
Skill Registry (Detection)
    ↓
Memory OS (Context)
    ↓
Governance OS (Validation)
    ↓
Evolution OS (Decision)
    ↓
Risk Guard (Protection)
    ↓
Order Router (Execution)
    ↓
cTrader API
    ↓
Live Market
```

---

## Final Notes

- **Safety First**: Robot prioritizes capital preservation over profit
- **Human In The Loop**: Evolution only recommends, humans approve
- **Continuous Learning**: Robot learns from every trade
- **One Source Of Truth**: All decisions flow through Evolution OS

Start with MOCK → PAPER → LIVE when confident.

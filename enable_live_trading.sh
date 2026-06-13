#!/bin/bash

# TUNGNS Trading OS - Enable Live Trading on cTrader
# Patch: Activate ALLOW_LIVE_EXECUTION for cTrader integration

set -e

echo "🤖 TUNGNS Trading OS - Live Trading Activation"
echo "==============================================="
echo ""

# Step 1: Check if .env exists
if [ ! -f ".env" ]; then
    echo "📝 Creating .env file from .env.example..."
    cp .env.example .env
fi

# Step 2: Enable live execution
echo "⚡ Enabling ALLOW_LIVE_EXECUTION..."
sed -i 's/ALLOW_LIVE_EXECUTION=false/ALLOW_LIVE_EXECUTION=true/' .env

# Step 3: Set broker to cTrader
echo "📡 Setting BROKER_MODE to ctrader..."
sed -i 's/BROKER_MODE=mock/BROKER_MODE=ctrader/' .env

# Step 4: Verify changes
echo ""
echo "✅ Configuration updated:"
grep -E "ALLOW_LIVE_EXECUTION|BROKER_MODE" .env

echo ""
echo "⚠️  WARNING: Live trading is now ENABLED"
echo "Ensure you have:"
echo "  1. Sufficient account balance for trading"
echo "  2. cTrader API credentials configured"
echo "  3. Risk settings properly configured"
echo "  4. Tested the system in PAPER mode first"
echo ""
echo "Next steps:"
echo "  1. Configure cTrader credentials in system"
echo "  2. Run: python -m pytest backend/app/evolution/tests/ -q"
echo "  3. Start the robot with: python backend/app/main.py"
echo ""

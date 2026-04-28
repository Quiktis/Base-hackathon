# QuiktisAttendance Contract

## What it does

This contract anchors verified check-in data from real Quiktis events onto Base.

When someone buys a ticket on Quiktis and gets scanned at the venue, their wallet address is recorded in our database. After the event, we call `batchRecordAttendance` to permanently anchor those check-ins onchain.

## Deployment

Deployed on **Base Sepolia** at: `[contract address here]`

## Events Anchored

| Event | bytes32 ID | Attendees |
|-------|-----------|-----------|
| Dinner and Awards Night | `0xc052c92c...f3de0` | 30 |
| Waves and Raves | `0xadec12db...0747` | 2 |

# QuiktisAttendance Contract

## What it does
This contract anchors verified check-in data from real Quiktis events onto Base.

When someone buys a ticket on Quiktis and gets scanned at the venue, their wallet 
address is recorded in our database. After the event, we call `batchRecordAttendance` 
to permanently anchor those check-ins onchain.

## Deployment
Deployed on **Base Sepolia** at: `0x020Bdf07C8970877677Ef064670a4d3BbDBcCa43`

View on Basescan: https://sepolia.basescan.org/address/0x020Bdf07C8970877677Ef064670a4d3BbDBcCa43

## Events Anchored

| Event | bytes32 ID | Attendees |
|-------|-----------|-----------|
| Dinner and Awards Night | `0xc052c92c54959f884d69db032e27fa1ca79e4e39aeff4d3977c9bdf2cdbf3de0` | 30 |
| Waves and Raves | `0xadec12dbce4363e10e54559349b71af7f2fe5bb25db0ad5a17caecf7c1ed0747` | 2 |

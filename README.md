# Quiktis × Base — Onchain Attendance Anchoring

Quiktis is a real-world event ticketing platform built for African events. We've powered **26+ events** across Nigeria and processed over **₦2,000,000** in ticket sales.

For the Base Africa Hackathon, we've anchored verified check-in data from **2 real events (32 attendees)** permanently onto Base.

---

## 🏗️ Architecture

```
User buys ticket (Quiktis web app)
        ↓
Organizer scans QR at door (Quiktis check-in app)
        ↓
Check-in stored in Quiktis database (fast, off-chain)
        ↓
After event ends → batch anchor to Base (tamper-proof, permanent)
```

**Why hybrid?** Real-time ticketing needs speed — no one wants to wait for a blockchain tx at the door. But after the event, we anchor the verified check-ins onchain so the record is permanent and publicly verifiable by anyone.

---

## 📋 Smart Contract

**Contract:** `QuiktisAttendance.sol`  
**Network:** Base Sepolia (testnet)  
**Contract Address:** `0x020Bdf07C8970877677Ef064670a4d3BbDBcCa43`

### Key Functions

| Function | Description |
|----------|-------------|
| `anchorEvent(bytes32 eventId, string metadata)` | Register an event with metadata |
| `batchRecordAttendance(bytes32 eventId, address[] attendees)` | Record all verified check-ins |
| `verifyAttendance(bytes32 eventId, address attendee)` | Returns `true` if attendee was verified |
| `getAttendeeCount(bytes32 eventId)` | Returns total verified check-ins for an event |

---

## ✅ Real Events Anchored on Base

### Event 1 — Dinner and Awards Night
- **Event ID:** `0xc052c92c54959f884d69db032e27fa1ca79e4e39aeff4d3977c9bdf2cdbf3de0`
- **Verified Attendees:** 30

### Event 2 — Waves and Raves
- **Event ID:** `0xadec12dbce4363e10e54559349b71af7f2fe5bb25db0ad5a17caecf7c1ed0747`
- **Verified Attendees:** 2

**Total onchain check-ins: 32 real people from real Nigerian events.**

---

## 🚀 Deploy It Yourself (Remix)

1. Go to [remix.ethereum.org](https://remix.ethereum.org)
2. Create `QuiktisAttendance.sol` and paste the contract from `/contracts/`
3. Compile with Solidity `0.8.20`
4. Deploy → Environment: **Injected Provider (MetaMask)** → switch to **Base Sepolia**
5. Get free testnet ETH: [faucet.quicknode.com](https://faucet.quicknode.com/base/sepolia)
6. After deploy, call `anchorEvent` then `batchRecordAttendance` with data from `/data/events.json`

---

## 🔍 Verify Any Attendee

Once deployed, anyone can call:
```
verifyAttendance(
  0xc052c92c54959f884d69db032e27fa1ca79e4e39aeff4d3977c9bdf2cdbf3de0,
  0x5bf2aa11b0c112f284c27c7f1889882435550d2c
)
// returns: true
```

No trust required. No middleman. Permanent proof on Base.

---

## 🌍 About Quiktis

- **Live platform:** [quiktis.com](https://quiktis.com)
- **Events powered:** 26+
- **Country:** Nigeria
- **GitHub Org:** [github.com/Quiktis](https://github.com/Quiktis)

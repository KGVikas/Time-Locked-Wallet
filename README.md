# Time-Locked Wallet (Solidity)

A simple Ethereum smart contract that allows users to deposit Ether with a specified unlock time. Withdrawals are restricted until the time lock expires, providing secure, time-based fund management.

## Features

- Users can deposit Ether with a custom unlock timestamp
- Funds can only be withdrawn after the specified time
- Secure access control and event logging
- View remaining lock time with `getTimeLeft()`

## Tech Stack

- Solidity ^0.8.19
- Remix or Hardhat (for testing/deployment)
- Ethereum (compatible with any EVM chain)

## Getting Started

1. Clone the repo and open the `TimeLockedWallet.sol` file.
2. Deploy using [Remix](https://remix.ethereum.org) or a local Hardhat environment.
3. Use the `deposit()` function (with Ether and unlock time) to lock funds.
4. Call `withdraw()` after the unlock time to retrieve funds.

## License

MIT

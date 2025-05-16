// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TimeLockedWallet {
    struct Deposit {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => Deposit) public deposits;

    event Deposited(address indexed user, uint256 amount, uint256 unlockTime);
    event Withdrawn(address indexed user, uint256 amount);

    function deposit(uint256 _unlockTime) external payable {
        require(msg.value > 0, "Send some Ether");
        require(_unlockTime > block.timestamp, "Unlock time must be in future");
        require(deposits[msg.sender].amount == 0, "Existing deposit active");

        deposits[msg.sender] = Deposit(msg.value, _unlockTime);
        emit Deposited(msg.sender, msg.value, _unlockTime);
    }

    function withdraw() external {
        Deposit memory userDeposit = deposits[msg.sender];
        require(userDeposit.amount > 0, "No deposit");
        require(block.timestamp >= userDeposit.unlockTime, "Too early");

        uint256 amount = userDeposit.amount;
        delete deposits[msg.sender];
        payable(msg.sender).transfer(amount);

        emit Withdrawn(msg.sender, amount);
    }

    function getTimeLeft() external view returns (uint256) {
        if (block.timestamp >= deposits[msg.sender].unlockTime) {
            return 0;
        }
        return deposits[msg.sender].unlockTime - block.timestamp;
    }
}

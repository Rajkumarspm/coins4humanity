// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Coins4Poor is ERC20 {
    address public donationWallet;

    constructor(address _donationWallet) ERC20("Coins4Poor", "C4P") {
        donationWallet = _donationWallet;
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function _transfer(address sender, address recipient, uint256 amount) internal override {
        uint256 donation = amount / 100; // 1%
        uint256 rest = amount - donation;
        super._transfer(sender, donationWallet, donation);
        super._transfer(sender, recipient, rest);
    }
}

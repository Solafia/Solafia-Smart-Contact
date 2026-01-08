// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.4.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Solafia_Token is ERC20, ERC20Burnable, Ownable {
    constructor(
        address initialOwner,
        string memory name_,
        string memory symbol_,
        uint256 initialSupply_
    ) ERC20(name_, symbol_) Ownable(initialOwner) {
        _mint(msg.sender, initialSupply_ * 10 ** decimals());
    }

    // Override decimals from 18 → 8
    function decimals() public pure override returns (uint8) {
        return 8;
    }
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

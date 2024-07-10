// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyERC20Token is ERC20 {
    address public owner=0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
    }

    function MyMintToken(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function MyBurnToken(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    function decimals() public view virtual override returns (uint8) {
        return 2; 
    }

function MyTransferTokens(address to, uint256 amount) public returns (bool) {
    require(to != address(0) && to != address(owner), "Transfer to the zero address or yourself");
    require(balanceOf(msg.sender) >= amount, "Transfer amount exceeds balance");
    _transfer(msg.sender, to, amount);
    return true;
    }

}

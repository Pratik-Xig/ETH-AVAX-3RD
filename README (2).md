# MyERC20Token

This project contains an ERC20 token smart contract created using OpenZeppelin's ERC20 implementation. The token includes minting, burning, and transferring functionalities, and the owner of the contract has exclusive rights to mint new tokens.

## Description

The `MyERC20Token` smart contract is an ERC20 token with additional minting and burning capabilities. The contract owner can mint new tokens, while any token holder can burn their tokens.

## Contract Details

The `MyERC20Token` smart contract is written in Solidity and utilizes the OpenZeppelin ERC20 library. It includes the following functionalities:

### State Variables

- `address public owner`: Stores the address of the contract owner.

### Modifiers

- `modifier onlyOwner()`: Ensures that only the contract owner can execute certain functions.

### Constructor

#### constructor

```solidity
constructor(string memory name, string memory symbol) ERC20(name, symbol) {
    owner = msg.sender;
    uint256 initialSupply = 10000 * 10**uint(decimals());
    _mint(msg.sender, initialSupply);
}
```
The constructor sets the contract deployer as the owner, initializes the token with a name and symbol, and mints an initial supply of 10,000 tokens to the owner.

### Functions

#### MyMintToken

```solidity
function MyMintToken(address to, uint256 amount) public onlyOwner {
    _mint(to, amount);
}
```
Mints new tokens and assigns them to the specified address. Only the owner can call this function.

#### MyBurnToken

```solidity
function MyBurnToken(uint256 amount) public {
    _burn(msg.sender, amount);
}
```
Burns a specified amount of tokens from the caller's balance.

#### decimals

```solidity
function decimals() public view virtual override returns (uint8) {
    return 0;
}
```
Overrides the default `decimals` function to set the token's decimal places to 0.

#### MyTransferTokens

```solidity
function MyTransferTokens(address to, uint256 amount) public returns (bool) {
    require(to != address(0), "Transfer to the zero address");
    require(balanceOf(msg.sender) >= amount, "Transfer amount exceeds balance");

    // Perform the transfer
    _transfer(msg.sender, to, amount);
    return true;
}
```
Transfers tokens from the caller to the specified address.

## Deployment

### Prerequisites

- MetaMask (for interacting with the deployed contract)

### Steps

1. **Open Remix IDE**:
    - Go to [Remix IDE](https://remix.ethereum.org/).

2. **Create a New File**:
    - Create a new file named `MyERC20Token.sol` and paste the smart contract code.

3. **Install OpenZeppelin Contracts**:
    - In Remix, go to the `File Explorer` pane, click on the `+` button, and create a new folder named `node_modules`.
    - Inside `node_modules`, create a folder named `@openzeppelin` and then inside it, create a folder named `contracts`.
    - Copy the necessary OpenZeppelin ERC20 contract files into this `contracts` folder. Alternatively, you can use the Remix libraries feature to include OpenZeppelin contracts.

4. **Compile the Contract**:
    - Go to the `Solidity Compiler` tab, select the correct compiler version (e.g., `0.8.7`), and compile `MyERC20Token.sol`.

5. **Deploy the Contract**:
    - Go to the `Deploy & Run Transactions` tab, select `Injected Web3` as the environment to connect to MetaMask.
    - Ensure you are connected to the desired Ethereum network in MetaMask.
    - Deploy the contract by selecting `MyERC20Token` from the contract dropdown, filling in the constructor parameters (`name` and `symbol`), and clicking the `Deploy` button.

### Interacting with the Contract

Once the contract is deployed, you can interact with it using Remix IDE:

- **Mint Tokens**:
    - Ensure you are connected as the contract owner in MetaMask.
    - Call the `MyMintToken` function with the recipient address and amount of tokens to mint.

- **Burn Tokens**:
    - Call the `MyBurnToken` function with the amount of tokens to burn from the caller's balance.

- **Transfer Tokens**:
    - Call the `MyTransferTokens` function with the recipient address and amount of tokens to transfer.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

## Authors

Sujal Mahajan

## Contributing

Contributions are welcome! Feel free to submit changes or improvements.

---

This README provides a concise guide to understanding, deploying, and using the `MyERC20Token` smart contract using Remix IDE.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public owner;
    uint256 private _initialSupply;

    constructor() ERC20("MyCustomToken", "MCT") {
        owner = msg.sender;
        uint256 initialSupply = 10000000 * (10 ** decimals());
        _mint(msg.sender, initialSupply);
        _initialSupply = initialSupply;
    }

    function mint(address _to, uint256 _amount) public onlyOwner returns (bool) {
        _mint(_to, _amount);
        return true;
    }

    function burn(uint256 _amount) public returns (bool) {
        _burn(msg.sender, _amount);
        return true;
    }

    function transfer(address _to, uint256 _value) public override returns (bool) {
        _transfer(msg.sender, _to, _value);
        return true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }
}


pragma solidity ^0.6.0;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
interface IYDAI {
    function deposit(uint _amount)  external;
    function withdraw(uint, _shares) external;
    function balanceOf(address account) public view returns (uint);
    function getPricePerFullShare() public view returns (uint);
}

contract Wallet {
    address admin;
    IERC20 dai = IERC20(0x6b175474e89094c44da98b954eedeac495271d0f);
    IYDAI yDai = IYDAI(0xC2cB1040220768554cf699b0d863A3cd4324ce32);

    constructor() public {
        admin = msg.sender;
    }

    function save(uint amount) external {
        dai.transferFrom(msg.sender, address(this), amount);
        dai.approve(address(yDai), amount);
        yDai.deposit(amount);
    }

}
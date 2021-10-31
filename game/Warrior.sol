pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import './MilitaryUnit.sol';

contract Warrior is MilitaryUnit {
    constructor() public {
        helthPoints = 30;
        armor = 3;
        attackPower = 4;
    }
}

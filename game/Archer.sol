pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import './MilitaryUnit.sol';

contract Archer is MilitaryUnit {
    constructor() public {
        helthPoints = 20;
        armor = 2;
        attackPower = 5;
    }
}

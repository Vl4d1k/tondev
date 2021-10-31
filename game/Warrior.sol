pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import './MilitaryUnit';

contract Warrior is MilitaryUnit {
    uint helthPoints = 3;
    uint armor = 3;
    uint attackPower = 4;
}

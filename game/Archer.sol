pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import './MilitaryUnit';

contract Archer is MilitaryUnit {
    uint helthPoints = 2;
    uint armor = 2;
    uint attackPower = 5;
}

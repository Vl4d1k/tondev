pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import './MilitaryUnit.sol';

contract Archer is MilitaryUnit {
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        helthPoints = 20;
        armor = 2;
        attackPower = 5;
    }
}

//0:6513032a8daf8755e7329b005c98b6d032196244935c16281c4abc205480820d
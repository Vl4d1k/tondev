pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import './MilitaryUnit.sol';

contract Warrior is MilitaryUnit {
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        helthPoints = 30;
        armor = 3;
        attackPower = 4;
    }
}

//0:031ffc2e62e258d985637efb2242b0299bd114666fe8a15af7abcae228457225
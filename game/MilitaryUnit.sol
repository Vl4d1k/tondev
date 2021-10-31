pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import './GameObjectInterface.sol';
import './GameObject.sol';
import './BaseStation.sol';

contract MilitaryUnit is GameObject {

    BaseStation BaseStationAddress;
    uint attackPower = 4;

    constructor(BaseStation _BaseStation) public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        BaseStationAddress = _BaseStation;
        BaseStationAddress.addUnit(tvm.pubkey());
    }

    function getAttackPower() public returns(uint) {
        return attackPower;
    }

    function atack(GameObjectInterface _gameObject) public {
        _gameObject.getAttack(getAttackPower());
    }

    function die(_enemyAddress) external {
        BaseStationAddress.removeUnit();
        GameObject.die(_enemyAddress);
    }
}

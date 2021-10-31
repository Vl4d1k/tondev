pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import './GameObjectInterface.sol';

contract GameObject is GameObjectInterface {

    uint internal helthPoints = 5;
    uint internal armor = 2;

    function die(address _enemyAddress) external override {
        sendAllMoneyAndDestroyObject(_enemyAddress);
    }

    function getAttack(uint _damage) external override {
        helthPoints = helthPoints + armor - _damage;
        if (!isAlive()) {
            this.die(msg.sender);
        }
    }

    function getArmor() public returns(uint) {
        return armor;
    }

    function isAlive() private returns(bool) {
        if (helthPoints <= 0)
            return true;
        return false;
    }

    function sendAllMoneyAndDestroyObject(address _enemyAddress) internal pure {
        _enemyAddress.transfer(1, true, 160);
    }
}

pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import './GameObjectInterface.sol';

contract MilitaryUnit is GameObjectInterface {
    uint internal helthPoints = 7;
    uint internal armor = 2;
    uint internal attackPower = 3;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    function getAttack(uint _damage) virtual public override {
        tvm.accept();
        setHealthPoints(getHealthPoints() + getArmor() - _damage);
        if (!isAlive()) {
            die(msg.sender);
        }
    }

    function atack(GameObjectInterface _gameObject) public {
        tvm.accept();
        _gameObject.getAttack(getAttackPower());
    }

    function getAttackPower() public returns(uint) {
        tvm.accept();
        return attackPower;
    }

    function getHealthPoints() public returns(uint) {
        tvm.accept();
        return helthPoints;
    }

    function setHealthPoints(uint _helthPoints) internal {
        tvm.accept();
        if (helthPoints < 0) {
            helthPoints = 0;
        } else {
            helthPoints = _helthPoints;
        }
    }

    function getArmor() public returns(uint) {
        tvm.accept();
        return armor;
    }

    function isAlive() internal returns(bool) {
        tvm.accept();
        if (helthPoints == 0)
            return true;
        return false;
    }

    function die(address _enemyAddress) internal {
        tvm.accept();
        _enemyAddress.transfer(1, true, 160);
    }
}
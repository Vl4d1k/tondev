pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import './GameObjectInterface.sol';
import './GameObject.sol';

contract BaseStation is GameObject {

    GameObjectInterface[] public units;

    function addUnit(address GameObjectInterface) external {
        units.push(GameObjectInterface);
    }

    function removeUnit() public {
        for (uint i = 0; i < units.length; i++) {
            if (units[i] == msg.pubkey()) {
                delete units[i];
                break;
            }
        }
    }

    function die(address _enemyAddress) public override {
        for (uint i = 0; i < units.length; i++) {
            units[i].die(_enemyAddress);
        }
        sendAllMoneyAndDestroyObject(_enemyAddress);
    }
}

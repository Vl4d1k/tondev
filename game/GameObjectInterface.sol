pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

interface GameObjectInterface {
    function getAttack(address _enemyAddress) external;
    function die(uint _damage) external;
}
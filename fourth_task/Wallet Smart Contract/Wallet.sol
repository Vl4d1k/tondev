pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract Wallet {
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    modifier checkOwnerAndAccept {
        require(msg.pubkey() == tvm.pubkey(), 100);
		tvm.accept();
		_;
	}

    function sendTransactionAndPayCommission(address dest, uint128 value) public pure checkOwnerAndAccept {
        dest.transfer(value, true, 1);
    }

    function sendTransactionAndDontPayCommission(address dest, uint128 value) public pure checkOwnerAndAccept {
        dest.transfer(value, true, 0);
    }

    function sendAllMoneyAndDestroyWallet(address dest) public pure checkOwnerAndAccept {
        dest.transfer(1, true, 160);
    }
    
    function sendTransaction(address dest, uint128 value, bool bounce, uint16 flag) public pure checkOwnerAndAccept {
        dest.transfer(value, bounce, flag);
    }
}
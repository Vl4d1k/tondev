pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract HumanQueue {

    string[] public queue;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }     

    modifier checkOwnerAndAccept {
		tvm.accept();
		_;
	}

	function add(string name) public checkOwnerAndAccept {
        queue.push(name);
	}

    function shift() public checkOwnerAndAccept returns(string) {
        if (queue.length == 0) return 'Nothing to shift';

        string element = queue[0];
        string[] memory newQueue = new string[](queue.length-1);
        for (uint i = 0; i < queue.length - 1; i++) {
            newQueue[i] = queue[i + 1];
        }
        queue = newQueue;
        return element;
    }
}
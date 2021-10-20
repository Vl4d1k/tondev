pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract HumanQueue {

    struct Task { 
      string title;
      uint32 timestamp;
      bool isCompleted;
    }

    mapping(int8 => Task) list;
    int8 taskCount = 0; 

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }     

    modifier checkOwnerAndAccept {
		tvm.accept();
		_;
	}

    function addTask(string title) public checkOwnerAndAccept {
        uint32 timestamp = now;
        list[taskCount] = Task(title, timestamp, false);
        taskCount++;
	}

    function getOpenTasksCount() public checkOwnerAndAccept returns(int) {
        int countOpenTasks = 0;
        for (int8 i = 0; i < taskCount; i++) {
            if (!list[i].isCompleted) {
                countOpenTasks++;
            }
        }
        return countOpenTasks;
    }

    function getTaskList() public checkOwnerAndAccept returns(mapping(int8 => Task)) {
        return list;
	}

    function getTitleByKey(int8 key) public checkOwnerAndAccept returns(string) {
        return list[key].title;
    }

    function setTaskCompleted(int8 key) public checkOwnerAndAccept {
        list[key].isCompleted = true;
    }

    function deleteTask(int8 key) public checkOwnerAndAccept {
        delete list[key];
        taskCount--;
    }

    function getTaskCount() public checkOwnerAndAccept returns(int8) {
        return taskCount;
    }
}
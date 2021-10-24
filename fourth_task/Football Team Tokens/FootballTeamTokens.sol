pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract FootballTeamTokens {

    struct Club {
        string name;
        string league;
        uint rating;
        uint cost;
    }

    Club[] clubArr;
    mapping(uint => uint) tokenToOwner;
    mapping(uint => uint) tokenToPrice;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
    }

    function changeOwner(uint tokenId, uint pubKeyOfNewOwner) public checkOwnerAndAccept(tokenId) {
        tokenToOwner[tokenId] = pubKeyOfNewOwner;
    }

    function changePrice(uint tokenId, uint price) public checkOwnerAndAccept(tokenId) {
        tokenToPrice[tokenId] = price;
    }

    function createClub(string name, string league, uint rating, uint cost) public isTeamExists(name) {
        tvm.accept();
        clubArr.push(Club(name, league, rating, cost));

        uint key = clubArr.length - 1;
        tokenToOwner[key] = msg.pubkey();
    }

    function getTokenOwner(uint tokenId) public view returns(uint) {
        tvm.accept();
        return tokenToOwner[tokenId];
    }

    function getClubInfo(uint tokenId) public view returns(string name, string league, uint rating, uint cost) {
        tvm.accept();
        name = clubArr[tokenId].name;
        league = clubArr[tokenId].league;
        rating = clubArr[tokenId].rating;
        cost = clubArr[tokenId].cost;
    }

    modifier checkOwnerAndAccept(uint tokenId) {
        require(msg.pubkey() == tokenToOwner[tokenId], 101);
		tvm.accept();
		_;
	}

    modifier isTeamExists(string name) {
        bool isUnieue = true;
        for (uint i = 0; i < clubArr.length; i++) {
            if (clubArr[i].name == name) {
                isUnieue = false;
            }
        }
        require(isUnieue);
        _;
    }
}

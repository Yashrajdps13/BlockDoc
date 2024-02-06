// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

contract GDrive {

    struct Access {
        address user;
        bool access;
    }

    mapping (address => mapping(address => bool)) previous;
    mapping (address => string[]) val;
    mapping (address => Access[]) accessL;
    mapping (address => mapping(address => bool)) owner;

    function display(address u) external view returns(string[] memory) {
        require(u == msg.sender || owner[u][msg.sender], "You don't have access");
        return val[u];
    }

    function allow(address u) external {
        owner[msg.sender][u] = true;
        if (previous[msg.sender][u]){
            for (uint i = 0;i < accessL[msg.sender].length;i++){
                if (accessL[msg.sender][i].user == u) accessL[msg.sender][i].access = true;
            }
        }
        accessL[msg.sender].push(Access(u, true));
    }

    function disallow(address u) public {
        owner[msg.sender][u] = false;
        for (uint i = 0;i < accessL[msg.sender].length;i++){
            if (accessL[msg.sender][i].user == u) accessL[msg.sender][i].access = false;
        }
    }

    function accessShare(address u) public view returns(Access[] memory) {
        return accessL[msg.sender];
    }

    function add(address u, string memory link) external {
        val[u].push(link);
    }
}
//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract WhiteList{
	//max whitelist address
	uint8 public maxwhitelistaddress;
	//this is for number of addresses
	uint8 public numAddressesWhiteListed;

	//why i am not using arrays over here is for gas fee and speed of accessing the data 
	// it took o(n) time complexity to access the data ,while o(1) to access the data using mapping takes less gas fee too.
    
    mapping(address => bool) whiteListAddresses;

    address[] public arrayOfAddresses;          //dynamic array 

    //setting up the max number when deploying the contract

	constructor(uint8 _maxwhitelistaddress){
		maxwhitelistaddress=_maxwhitelistaddress;
	}
    
    //function to add users to whitelist
    function addToWhiteList() public{
    	require(!whiteListAddresses[msg.sender],"aleardy existed");
    	require(numAddressesWhiteListed < maxwhitelistaddress,"limit exceeded");
    	arrayOfAddresses.push(msg.sender);
    	whiteListAddresses[msg.sender]=true;
    	numAddressesWhiteListed+=1;

    }

    //returning the addresses
    function displayAddresses() public view returns(address[] memory){
    	return arrayOfAddresses;
    }

}

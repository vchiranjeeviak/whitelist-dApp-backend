// SPDX-License-Identifier:Unlicense
pragma solidity ^0.8.4;

contract Whitelist {
    // A var to store max num of accounts that can be whitelisted
    uint8 public maxWhitelistedAddresses;

    // A mapping (hashmap) to store the status (whitelisted or not) of an account.
    mapping(address => bool) public whitelistedAddresses;

    // A var to store num of accounts whiltelisted currently
    uint8 public numAddressesWhitelisted;

    constructor(uint8 _maxNumOfAccounts) {
        maxWhitelistedAddresses = _maxNumOfAccounts;
    }

    // A function to add address of the function invoker to the whitelist
    function addAddressToWhitelist() public {
        // The numOfAccounts whitelisted should be less than maxNumOFAddresses to proceed further
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Accounts limit reached"
        );
        // The requesting address must not present in our whitelist(mapping) already
        require(
            !whitelistedAddresses[msg.sender],
            "This address is already whitelisted"
        );
        // Add address to the whitelist
        whitelistedAddresses[msg.sender] = true;
        // Increment the numOfAccountsWhitelisted
        numAddressesWhitelisted += 1;
    }
}

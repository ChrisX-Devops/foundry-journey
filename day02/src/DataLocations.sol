// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DataLocations {
    // ============ STORAGE VARIABLES ============
    // These live FOREVER on blockchain. Expensive to change.
    uint256 public storedNumber;      // A number that stays forever
    address public owner;             // Who owns this contract
    uint256[] public storedArray;     // A list that stays forever
    
    // Constructor runs once when contract is created
    constructor() {
        owner = msg.sender;           // Save who created this
        storedNumber = 42;            // Set initial number
        storedArray.push(1);          // Add items to permanent array
        storedArray.push(2);
    }
    
    // ============ MEMORY FUNCTION ============
    // Uses cheap temporary memory. Good for calculations.
    function doubleMemory(uint256[] memory input) public pure returns (uint256[] memory) {
        // Create new temporary array in memory
        uint256[] memory result = new uint256[](input.length);
        
        // Loop through and double each number
        for (uint i = 0; i < input.length; i++) {
            result[i] = input[i] * 2;
        }
        
        return result;  // Return temporary result (dies after function ends)
    }
    
    // ============ CALLDATA FUNCTION ============
    // Uses calldata - cheapest option for inputs
    function sumCalldata(uint256[] calldata input) public pure returns (uint256) {
        uint256 sum = 0;
        
        // Can READ input, but CANNOT modify it
        for (uint i = 0; i < input.length; i++) {
            sum += input[i];
        }
        
        return sum;
    }
    
    // ============ STORAGE VS MEMORY COMPARISON ============
    // This writes to permanent storage (expensive)
    function updateStorage(uint256 newNum) public {
        storedNumber = newNum;  // Costs ~20,000 gas
    }
    
    // This copies from storage to memory (cheap read, but copy costs)
    function readAndCopy() public view returns (uint256[] memory) {
        uint256[] memory copy = storedArray;  // Copies to memory
        return copy;
    }
}

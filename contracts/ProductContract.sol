// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;

contract ProductContract {
    struct ProductData {
        string name;
        string location;
        uint barcode;
    }
    
    mapping (uint => ProductData) public productStructs; // the storage of the products
    uint[] public productList; // keeping track of the amount of products

    function getLocation(uint barcode) public view returns(string memory) {
        return productStructs[barcode].location;
    }
    
    function getName(uint barcode) public view returns(string memory) {
        return productStructs[barcode].name;
    }

    function add(uint barcode, string memory location, string memory name) public returns(uint) {
        require(!getName(barcode), 'Barcode already exists');
        
        productStructs[barcode].barcode = barcode;
        productStructs[barcode].location = location;
        productStructs[barcode].name = name;
        productList.push(barcode);
        return barcode;
    }
    
    function all() view public returns(uint[] memory) {
        return productList;
    }
    
    function count() view public returns (uint) {
        return productList.length;
    }
}

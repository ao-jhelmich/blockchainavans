// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

contract ProductContract {
    struct ProductData {
        string name;
        string location;
        uint barcode;
        bool exists;
    }

    struct PaneltyData {
        uint barcode;
        uint amount;
    }
    
    mapping (address => string) public users; // the storage of the panelties
    mapping (address => PaneltyData) public paneltyStrucs; // the storage of the panelties

    mapping (uint => ProductData) public productStructs; // the storage of the products
    uint[] public productList; // keeping track of the amount of products

    function addUser(string memory location) public {
        users[msg.sender] = location;
    }

    function getProduct(uint barcode) public returns(ProductData memory) {
        require (productStructs[barcode].exists, 'Product doesnt exsists');
        
        if (keccak256(bytes(users[msg.sender])) == keccak256(bytes(productStructs[barcode].location))) {
            return productStructs[barcode];
        } else {
            paneltyStrucs[msg.sender].amount = paneltyStrucs[msg.sender].amount + 1;

            revert ('Penalty given, please check your panelties');
        }       
    }

    function add(uint barcode, string memory location, string memory name) public returns(uint) {
        if(productStructs[barcode].exists) revert ('Barcode already exists');

        productStructs[barcode] = ProductData(name, location, barcode, true);
        productList.push(barcode);

        return barcode;
    }
    
    function all() view public returns(uint[] memory) {
        return productList;
    }
    
    function count() view public returns (uint) {
        return productList.length;
    }

    function panelty() view public returns (PaneltyData memory) {
        return paneltyStrucs[msg.sender];
    }

    function checkUser() view public returns (string memory) {
        return users[msg.sender];
    }
}

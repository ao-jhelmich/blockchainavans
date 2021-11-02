// SPDX-License-Identifier: MIT
pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

contract ProductContract {
    event ProductAdded(string _message);
    event PaneltyAdded(string _message);
    event PaneltyPayed(string _message);
    event UserAdded(string _message);

    struct ProductData {
        string name;
        string location;
        uint barcode;
        bool exists;
    }
    
    mapping (address => string) public users; // the storage of the panelties
    mapping (address => uint) public penalties; // the storage of the panelties

    mapping (uint => ProductData) public productStructs; // the storage of the products
    uint[] public productList; // keeping track of the amount of products

    function addUser(string memory location) public {
        users[msg.sender] = location;

        emit UserAdded("Gebruiker toegevoegd");
    }

    function getProduct(uint barcode) public returns(ProductData memory) {
        require (productStructs[barcode].exists, 'Product doesnt exsists');
        
        if (keccak256(bytes(users[msg.sender])) == keccak256(bytes(productStructs[barcode].location))) {
            return productStructs[barcode];
        } else {
            penalties[msg.sender] = penalties[msg.sender] + 5;
            
            emit PaneltyAdded("Boete toegekend");
        }       
    }

    function add(uint barcode, string memory location, string memory name) public {
        if(productStructs[barcode].exists) revert ('Barcode already exists');

        productStructs[barcode] = ProductData(name, location, barcode, true);
        productList.push(barcode);

        emit ProductAdded("Product succesvol toegevoegd!");
    }
    
    function all() view public returns(uint[] memory) {
        return productList;
    }
    
    function count() view public returns (uint) {
        return productList.length;
    }

    function penalty() view public returns (uint) {
        return penalties[msg.sender];
    }

    function payPenalty() public payable {
        penalties[msg.sender] = penalties[msg.sender] - msg.value /(1 ether);

        emit PaneltyPayed("Boete betaald!");
    }

    function checkUser() view public returns (string memory) {
        return users[msg.sender];
    }
}

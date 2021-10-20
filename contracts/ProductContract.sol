pragma solidity >=0.4.21 <0.7.0;

contract ProductContract {
    struct ProductData {
        string name;
        string location;
        uint barcode;
    }
    
    mapping (uint => ProductData) products;
    
    function add(uint barcode, string memory location, string memory name) public {
        products[barcode] = ProductData(name, location, barcode);
    }
    
    // function getProducts() view public returns(string[] memory) {
    //     return productDb;
    // }
    
    // function getProduct(string memory _hash) view public returns (string memory, string memory) {
    //     var product = products[_hash];

    //     return (product.name, product.location);
    // }
    
    // function countProducts() view public returns (uint) {
    //     return productDb.length;
    // }
}

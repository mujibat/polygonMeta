// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.19;

import "ERC721A/ERC721A.sol";

contract AICollection is ERC721A {
    address owner;
    string[] collectionDescriptions = [
        "annoying Cat",
        "Dog In A Beret",
        "Dog and A Cat Snuggling",
        "Monkey In Spacesuit",
        "Teddy bear skating"
    ];

    constructor() ERC721A("AI Collection", "AIC") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return
            "ipfs://QmXppnKSEp3opCDc4jDv1wVwekp1UDwGFcntioXAB4jE7J/BeretDog.png";
    }

    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        if (!_exists(tokenId)) revert URIQueryForNonexistentToken();

        string memory baseURI = _baseURI();
        return
            bytes(baseURI).length != 0
                ? string(abi.encodePacked(baseURI, _toString(tokenId), ".json"))
                : "";
    }

    function promptDescription() public view returns (string[] memory) {
        return collectionDescriptions;
    }

    function MintBatches(address to, uint quantity) public onlyOwner {
        _safeMint(to, quantity, "");
    }
}

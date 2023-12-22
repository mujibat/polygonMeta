// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.23;

import "ERC721A/ERC721A.sol";

contract PandaCollection is ERC721A {
    address owner;
    string[] collectionDescriptions = [
        "Smiling baby Panda",
        "Sitting baby Panda",
        "Sitting baby Panda in tree",
        "Smiling Adult Panda",
        "Adult eating panda"
    ];

    constructor() ERC721A("Panda Collection", "PDC") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return
            "ipfs://bafybeibytrd6ifwzszvanllj6azeo7liflb5q5tfkrsfcod6cwiwqz5rke/panda";
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

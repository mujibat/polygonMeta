# Panda Collection NFT Contract

## Overview

This Solidity smart contract deploys an ERC721A-based NFT collection named "Panda Collection" on the Ethereum blockchain. The collection consists of five unique Panda-themed items, each with a distinct description. Additionally, the contract supports metadata storage on IPFS using the base URI "ipfs://bafybeibytrd6ifwzszvanllj6azeo7liflb5q5tfkrsfcod6cwiwqz5rke/panda". The contract owner has the exclusive right to mint batches of these NFTs and retrieve the prompt descriptions used for image generation.

## Features

1. Deploy an ERC721A-based NFT collection on Ethereum.
2. Store metadata on IPFS using a predefined base URI.
3. Mint batches of NFTs, with ownership restricted to the contract owner.
4. Retrieve prompt descriptions used for image generation.

## Contract Details

- **Contract Name:** PandaCollection
- **Symbol:** PDC (Panda Collection)
- **Base URI:** ipfs://bafybeibytrd6ifwzszvanllj6azeo7liflb5q5tfkrsfcod6cwiwqz5rke/panda

### Mint Batches

The contract owner can mint batches of NFTs using the `MintBatches` function. This function requires the recipient's address and the quantity of NFTs to be minted.

```solidity
function MintBatches(address to, uint quantity) public onlyOwner {
    _safeMint(to, quantity, "");
}
```

### Prompt Descriptions

The promptDescription function allows anyone to retrieve an array of Panda collection descriptions used for image generation.

```solidity
function promptDescription() public view returns (string[] memory) {
    return collectionDescriptions;
}
```

### Polygon Mumbai Bridge

The contract has been bridged to Polygon Mumbai using the Foundry script along side the FxPortal Bridge.

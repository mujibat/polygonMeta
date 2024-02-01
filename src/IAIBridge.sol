// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.19;

interface IAIBridge {
    function deposit(
        address rootToken,
        address user,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

// SPDX-License-Identifier:UNLICENSED
pragma solidity ^0.8.23;

interface IFxBridge {
    function deposit(
        address rootToken,
        address user,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

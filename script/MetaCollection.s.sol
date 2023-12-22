// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import {Script, console2} from "forge-std/Script.sol";
import {PandaCollection} from "../src/MetaCollection.sol";
import {IFxBridge} from "../src/IFxBridge.sol";

contract PandaCollectionScript is Script {
    address to = 0x764693DD666E8dD9275CDE8F05C6B07446B1d941;

    IFxBridge bridge = IFxBridge(0xF9bc4a80464E48369303196645e876c8C7D972de);
    address operator = 0xF9bc4a80464E48369303196645e876c8C7D972de;
    PandaCollection collection;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        collection = new PandaCollection();

        console2.log("==========minting 5 batches==========");
        collection.MintBatches(to, 5);
        console2.log("============minted==================");

        console2.log("============approving==========");
        collection.setApprovalForAll(operator, true);
        console2.log("===========approved============");

        console2.log("=========depositing batches=========");
        bridge.deposit(address(collection), to, 0, "0x");
        bridge.deposit(address(collection), to, 1, "0x");
        bridge.deposit(address(collection), to, 2, "0x");
        bridge.deposit(address(collection), to, 3, "0x");
        bridge.deposit(address(collection), to, 4, "0x");
        console2.log("=============deposited==============");

        vm.stopBroadcast();
    }

    function showAddr() public view returns (PandaCollection) {
        return collection;
    }
}

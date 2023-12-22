// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import {Script, console2} from "forge-std/Script.sol";
import "./MetaCollection.s.sol";

contract BalanceOfScript is Script {
    address to = 0x764693DD666E8dD9275CDE8F05C6B07446B1d941;
    PandaCollectionScript pandaCollection;

    function run() public {
        console2.log("balance of to address:");
        pandaCollection.showAddr().balanceOf(to);
    }
}

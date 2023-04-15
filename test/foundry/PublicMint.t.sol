// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../../src/PublicMint.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

contract PublicMintTest is Test {
    PublicMint pm;
    uint256 private immutable alicePrivateKey = 1;
    uint256 private immutable bobPrivateKey = 2;
    address private immutable alice = vm.addr(1);
    address private immutable bob = vm.addr(2);

    function setUp() public {
        pm = new PublicMint();
        pm.setPublicMintAddress(alice);
    }

    function testSignature() public {
        bytes32 hash = keccak256(abi.encodePacked(alice));
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(alicePrivateKey, hash);
        bytes memory test = abi.encodePacked(r, s, v);
        console.logBytes(test);
        assertTrue(true);
    }
}
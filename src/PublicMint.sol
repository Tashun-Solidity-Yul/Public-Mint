// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
//import "hardhat/console.sol";
import "forge-std/console.sol";

contract PublicMint {
    using ECDSA for bytes32;
    address _publicMintAddress;

    function setPublicMintAddress(address publicMintAddress_) external {
        _publicMintAddress = publicMintAddress_;
    }

    /**
        Test if the
    */

    function rndHash() public view returns (bytes32) {
        return keccak256(abi.encodePacked(block.number));
    }

    function ethSignedHash(bytes32 messageHash) public pure returns (bytes32) {
        return messageHash.toEthSignedMessageHash();
    }

    function recover(bytes32 hash, bytes memory signature) public pure returns (address) {
        return hash.recover(signature);
    }

    function checkSignature(bytes calldata _signature) public {
        console.log(keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32",bytes32(uint256(uint160(msg.sender))))).recover(_signature));
//        address a = keccak256(abi.encodePacked(block.number)).toEthSignedMessageHash().recover(_signature);
    }
}

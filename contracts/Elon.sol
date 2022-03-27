// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// ERC721 / ERC721a - a standard for NFTs - non fungible tokens
// counters is goinf to help us keep a count on number of NFTs minted.

contract Elon is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds; // 0

    constructor() ERC721("ElonMusk", "ELON") {} // ElonMusk - ELON (short)

    function mintNFT() public returns (uint256) {
        _tokenIds.increment(); // 1
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/ZXUK");
        console.log(
            "The NFT ID %s has been minted to %s",
            newItemId,
            msg.sender
        );
        return newItemId;
    }

    // NFT has data, attributes, name, image, description
}

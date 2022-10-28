// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyEpicNFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("SquareNFT", "Square") {
        console.log("First NFT Contract");
    }

    function makeAnEpicNFT() public {
        uint256 newItemId = _tokenIds.current();
        string memory finalTokenUri = string(
            abi.encodePacked("data:application/json;base64,", "INSERT_YOUR_JSON_LINK")
        );
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId,finalTokenUri);
        _tokenIds.increment();
        console.log(
            "A NFT w/ID %s has been minted to %s",
            newItemId,
            msg.sender
        );
    }
}

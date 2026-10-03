// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721{

    mapping(uint256 => string) private s_tokenIdToURI;
    uint256 private s_tokenCounter;
    constructor() ERC721("Dogie","DOG"){
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenUri) public returns(uint256){
        s_tokenIdToURI[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender,s_tokenCounter);
        s_tokenCounter++;
        return s_tokenCounter;

    }

    function tokenURI(uint256 tokenId) public view override returns(string memory){
        return s_tokenIdToURI[tokenId];
    }
}
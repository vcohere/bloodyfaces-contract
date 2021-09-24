// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract BloodyFace is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
  using Counters for Counters.Counter;

  Counters.Counter private _tokenIdCounter;

  uint256 private _totalSupply = 2;

  constructor() ERC721("BloodyFace", "BLDFC") {}

  function mintBloodyFace()
    public
    returns (uint256)
  {
    require(_tokenIdCounter.current() < _totalSupply, "All the Bloody Faces have been minted.");
    require(balanceOf(msg.sender) < 1, "You already own a Bloody Face.");

    _tokenIdCounter.increment();
    uint256 newNftId = _tokenIdCounter.current();

    string memory _tokenURI = "#";

    _mint(msg.sender, newNftId);
    _setTokenURI(newNftId, _tokenURI);

    return newNftId;
  }

  // The following functions are overrides required by Solidity.
  // This is generated by OpenZeppelin.

  function _beforeTokenTransfer(address from, address to, uint256 tokenId)
    internal
    override(ERC721, ERC721Enumerable)
  {
    super._beforeTokenTransfer(from, to, tokenId);
  }

  function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
    super._burn(tokenId);
  }

  function tokenURI(uint256 tokenId)
    public
    view
    override(ERC721, ERC721URIStorage)
    returns (string memory)
  {
    return super.tokenURI(tokenId);
  }

  function supportsInterface(bytes4 interfaceId)
    public
    view
    override(ERC721, ERC721Enumerable)
    returns (bool)
  {
    return super.supportsInterface(interfaceId);
  }
}

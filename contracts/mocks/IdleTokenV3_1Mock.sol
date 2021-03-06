/**
 * @title: Idle Token main contract
 * @summary: ERC20 that holds pooled user funds together
 *           Each token rapresent a share of the underlying pools
 *           and with each token user have the right to redeem a portion of these pools
 * @author: Idle Labs Inc., idle.finance
 */
pragma solidity 0.5.16;

import "../IdleTokenV3_1.sol";
import "./GasTokenMock.sol";

contract IdleTokenV3_1Mock is IdleTokenV3_1 {
  constructor(
    string memory _name, // eg. IdleDAI
    string memory _symbol, // eg. IDLEDAI
    address _token,
    address _iToken,
    address _cToken,
    address _rebalancer
    ) public {
      IdleTokenV3_1.initialize(
      _name, // eg. IdleDAI
      _symbol, // eg. IDLEDAI
      _token,
      _iToken,
      _cToken,
      _rebalancer
    );
  }

  function amountsFromAllocations(uint256[] calldata allocations, uint256 total)
    external pure returns (uint256[] memory foo) {
      return _amountsFromAllocations(allocations, total);
  }
  function mintWithAmounts(address[] calldata tokenAddresses, uint256[] calldata protocolAmounts) external {
    _mintWithAmounts(tokenAddresses, protocolAmounts);
  }
  function setAllocations(uint256[] calldata allocs) external {
    lastAllocations = allocs;
  }
  function setGST(address _gst) external {
    gst2 = GasTokenMock(_gst);
  }
  function redeemAllNeeded(
    address[] calldata tokenAddresses,
    uint256[] calldata amounts,
    uint256[] calldata newAmounts
    ) external returns (
      uint256[] memory toMintAllocations,
      uint256 totalToMint,
      bool lowLiquidity
    ) {
      return _redeemAllNeeded(tokenAddresses, amounts, newAmounts);
  }
}

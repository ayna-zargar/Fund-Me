//SPDX-LICEMSE-Identifier: MIT
pragma solidity ^0.8.18;

import {Test,console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import  {PriceConverter} from "../src/PriceConverter.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";
contract FundMeTest is Test{
    FundMe fundMe;
DeployFundMe deployFundMe;
    function setUp() external{
         deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();

    }
    function testMinimumDollarisFive() public{
        console.log("min usd value",fundMe.MINIMUM_USD());
     
         assertEq(fundMe.MINIMUM_USD(),5e18);
    }
    function testOwnerIsMsgSender() public{
        console.log(fundMe.i_owner());
        console.log(msg.sender);
      //  assertEq(fundMe.i_owner(),address(this));
       assertEq(fundMe.i_owner(),msg.sender);//here now deploy script is deploying not test contract so msg.sender is owner
    }


}
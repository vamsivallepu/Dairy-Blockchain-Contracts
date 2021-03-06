// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract Exit{
    uint private time;
    uint private quantity;
    uint private fatPercentage;
    uint private snf;
    uint[] private quality;
    string private result="";

    function checkQuality() public returns (uint[2] memory){
        snf= 9;
        fatPercentage= 5;
        return [snf,fatPercentage];
    }

    function addMilk(uint quant) public {
        quantity+= quant;
    }
    
    function getTotalQuantity() public view returns (uint256) {
        return quantity;
    }
    
    function uint2str(uint256 _i) internal pure returns (string memory _uintAsString){
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint256 k = len;
        while (_i != 0) {
            k = k - 1;
            uint8 temp = (48 + uint8(_i - (_i / 10) * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
    function setMilktoZero() public {
        quantity=0;
    }
    
    function export() public  returns (string memory){
        //time, temp, snf, fatPercentage, 
        time=block.timestamp;
        quality=checkQuality();
        result = string(abi.encodePacked(" Out of Processing "," SNF : ", uint2str(quality[0]), " Fat Percentage : ",uint2str(quality[1]), " Total Quantity : ",uint2str(quantity), "  Time : ", uint2str(time)));
        return result;
    }
}
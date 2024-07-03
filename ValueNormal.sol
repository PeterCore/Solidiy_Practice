// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract ValueTypes {

    uint8 public a = 1;
    address public _address = 0x7A58c0Be72BE218B41C608b7Fe7C5bB630736C71;
    address payable  public  payable_address = payable(_address);
    uint256 public balance = payable_address.balance; // balance of address

    //布尔
    bool public _bool = true;
    bool public _bool1 = !_bool;
    bool public _bool2 = _bool && _bool1; //与
    bool public _bool3 = _bool || _bool1; //或
    bool public _bool4 = _bool == _bool1; //相等
    bool public _bool5 = _bool != _bool1; 

        // 固定长度的字节数组
    bytes32 public _byte32 = "MiniSolidity"; // bytes32: 0x4d696e69536f6c69646974790000000000000000000000000000000000000000
    bytes1 public _byte = _byte32[0]; 
    
   //枚举
    enum Genders {male, female}
    Genders gender = Genders.male;

    //显示转化
    function enumToUint() external view returns(uint){
        return uint(gender);
    }
    //常量
    uint256 constant CONSTANT_NUM = 10;
    string constant CONSTANT_STRING = "0xAA";
    bytes constant CONSTANT_BYTES = "WTF";
    address constant CONSTANT_ADDRESS = 0x0000000000000000000000000000000000000000;

    // immutable变量可以在constructor里初始化，之后不能改变
    uint256 public immutable IMMUTABLE_NUM = 9999999999;
    address public immutable IMMUTABLE_ADDRESS;
    uint256 public immutable IMMUTABLE_BLOCK;
    uint256 public immutable IMMUTABLE_TEST;
    
    //字典
    mapping(uint => address) public tokenIdToAddress;
    mapping (address => address) public swapPair;
    function writeMap (uint _Key, address _Value) public{
        tokenIdToAddress[_Key] = _Value;
    }
    

    uint[8] array1;
    bytes1[5] array2;
    address[100] array3;

    // 可变长度 Array
    uint[] array4;
    bytes1[] array5;
    address[] array6;
    bytes array7;

    // 初始化可变长度 Array
    uint[] array8 = new uint[](5);
    bytes array9 = new bytes(9);
    //  给可变长度数组赋值
    function initArray() external pure returns(uint[] memory){
        uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 3;
        x[2] = 4;
        return(x);
    }  

    function arrayPush() public returns(uint[] memory){
        uint[2] memory a = [uint(1),2];
        array4 = a;
        array4.push(3);
        return array4;
    }
}
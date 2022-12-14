// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.4.22 <0.9.0;

contract Exchange {
    
    struct Wallet {
        address owner;
        uint centEU;
        uint centUS;
        uint pennyUK;
    }

    Wallet testWallet = Wallet(0xc0ffee254729296a45a3885639AC7E10F9d54979, 10000, 10000, 10000);

    event SuccessfullExchange(address owner, uint centEU, uint centUS, uint pennyUK);

    function walletInfo()public view returns (address _owner, uint _centEU, uint _centUS, uint _pennyUK){
        return(testWallet.owner, testWallet.centEU, testWallet.centUS, testWallet.pennyUK);
    }

    function getFee(uint _moneyBevoreFee) private pure returns(uint){
        return (_moneyBevoreFee * 100 - _moneyBevoreFee * 2);
    }

    function euroIntoDollar(uint _centEU) public payable{
        testWallet.centEU = testWallet.centEU - _centEU;
        uint moneyAfterFee = getFee(_centEU);
        testWallet.centUS = (testWallet.centUS * 10000 + moneyAfterFee * 106) / 10000;
        emit SuccessfullExchange(testWallet.owner, testWallet.centEU, testWallet.centUS, testWallet.pennyUK);
    }

    function euroIntoPound(uint _centEU) public payable{
        testWallet.centEU = testWallet.centEU - _centEU;
        uint moneyAfterFee = getFee(_centEU);
        testWallet.pennyUK = (testWallet.pennyUK * 10000 + moneyAfterFee * 86) / 10000;
        emit SuccessfullExchange(testWallet.owner, testWallet.centEU, testWallet.centUS, testWallet.pennyUK);
    }

        function dollarIntoEuro(uint _centUS) public payable{
        testWallet.centUS = testWallet.centUS - _centUS;
        uint moneyAfterFee = getFee(_centUS);
        testWallet.centEU = (testWallet.centEU * 10000 + moneyAfterFee * 95) / 10000;
        emit SuccessfullExchange(testWallet.owner, testWallet.centEU, testWallet.centUS, testWallet.pennyUK);
    }

        function dollarIntoPound(uint _centUS) public payable{
        testWallet.centUS = testWallet.centUS - _centUS;
        uint moneyAfterFee = getFee(_centUS);
        testWallet.pennyUK = (testWallet.pennyUK * 10000 + moneyAfterFee * 81) / 10000;
        emit SuccessfullExchange(testWallet.owner, testWallet.centEU, testWallet.centUS, testWallet.pennyUK);
    }

        function poundIntoEuro(uint _pennyUK) public payable{
        testWallet.pennyUK = testWallet.pennyUK - _pennyUK;
        uint moneyAfterFee = getFee(_pennyUK);
        testWallet.centEU = (testWallet.centEU * 10000 + moneyAfterFee * 117) / 10000;
        emit SuccessfullExchange(testWallet.owner, testWallet.centEU, testWallet.centUS, testWallet.pennyUK);
    }

        function poundIntoDollar(uint _pennyUK) public payable{
        testWallet.pennyUK = testWallet.pennyUK - _pennyUK;
        uint moneyAfterFee = getFee(_pennyUK);
        testWallet.centUS = (testWallet.centUS * 10000 + moneyAfterFee * 123) / 10000;
        emit SuccessfullExchange(testWallet.owner, testWallet.centEU, testWallet.centUS, testWallet.pennyUK);
    }

}
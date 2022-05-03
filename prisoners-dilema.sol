// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

contract PrisionersDilemma {

    uint8 previousChoice;
    address payable previousPlayerAdress;

    function cooperate() payable public {
        if(previousChoice == 1) {
            payable(msg.sender).transfer(65 ether);
            previousPlayerAdress.transfer(65 ether);
            previousChoice = 0;
        } else if(previousChoice == 2) {
            previousPlayerAdress.transfer(85 ether);
            previousChoice = 0;
        } else {
            previousChoice = 1;
            previousPlayerAdress = payable(msg.sender);
        }
    }

    function defect() payable public {
        if(previousChoice == 1) {
            payable(msg.sender).transfer(85 ether);
            previousChoice = 0;
        } else if(previousChoice == 2) {
            payable(msg.sender).transfer(45 ether);
            previousPlayerAdress.transfer(45 ether);
            previousChoice = 0;
        } else {
            previousChoice = 2;
            previousPlayerAdress = payable(msg.sender);
        }
    }

    function receiveDeposit() payable public {

    } 

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

}
pragma solidity ^0.6.0;
import "./IExerciceSolution.sol";
import "./IPool.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ExerciceSolution is IExerciceSolution 
{
    address DAIaddress = 0xBa8DCeD3512925e52FE67b1b5329187589072A55;
    address USDCaddress = 0x65aFADD39029741B3b8f0756952C74678c9cEC93;
    address Pooladdress= 0x7b5C526B7F8dfdff278b4a3e045083FBA4028790;

	function depositSomeTokens() external override{

        require(ERC20(DAIaddress).approve(Pooladdress, 10*10**18));
        IPool(Pooladdress).supply(DAIaddress, 10*10**18, address(this), 0);

    }

	function withdrawSomeTokens() external override{
        IPool(Pooladdress).withdraw(DAIaddress, 8*10**18, address(this));
    }

	function borrowSomeTokens() external override{

        IPool(Pooladdress).borrow(USDCaddress, 1*10**6, 2, 0, address(this));
    }

	function repaySomeTokens() external override {
        require(ERC20(USDCaddress).approve(Pooladdress, 1*10**6));

        IPool(Pooladdress).repay(USDCaddress, 1*10**6, 2, address(this));
    }

    function money(uint amount) external {
        ERC20(USDCaddress).transfer(msg.sender, amount*10**6);
    }


	function doAFlashLoan() external override {

    }
    
    function repayFlashLoan() external override {

    }
}


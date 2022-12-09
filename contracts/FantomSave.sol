// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract FantomSave {
    // Account info
    mapping(address => uint256) public balances;
    uint256 public totalSupply;

    // Rewards info
    uint256 public rewardRate;
    uint256 public rewardInterval;

    // Events
    event Deposit(address sender, uint256 amount);
    event Withdrawal(address sender, uint256 amount);
    event Reward(address receiver, uint256 amount);

    constructor(uint256 _rewardRate, uint256 _rewardInterval){
        rewardRate = _rewardRate;
        rewardInterval = _rewardInterval;
    }

    /**
     * @dev Allows a user to deposit crypto into their account.
     */
    function deposit() public payable {
        // Update the user's balance and the total supply
        balances[msg.sender] += msg.value;
        totalSupply += msg.value;

        emit Deposit(msg.sender, msg.value);
    }

    /**
     * @dev Allows a user to withdraw crypto from their account.
     * @param amount The amount of crypto to withdraw.
     */
    function withdraw(uint256 amount) public {
        require(
            balances[msg.sender] >= amount,
            "Insufficient balance. Cannot withdraw specified amount."
        );

        // Update the user's balance and the total supply
        balances[msg.sender] -= amount;
        totalSupply -= amount;

        payable(msg.sender).transfer(amount);
        emit Withdrawal(msg.sender, amount);
    }

    /**
     * @dev Function that is called periodically to distribute rewards to users
     * based on their balances and the reward rate.
     */
    // function distributeRewards() public {
        // Calculate the total rewards to distribute
        // uint256 totalRewards = (totalSupply * rewardRate) / 100;

        // Distribute rewards to each user proportionally based on their balance
        // for (uint256 i = 0; i < address(this).balance; i++) {
        //     uint256 reward = (balances[accounts[i]] * totalRewards) / totalSupply;
        //     balances[accounts[i]] += reward;
        //     totalSupply += reward;
        //     emit Reward(accounts[i], reward);
        // }
    // }
}
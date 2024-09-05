// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

/*
WETH 是包装 ETH 主币，作为 ERC20 的合约。 标准的 ERC20 合约包括如下几个

3 个查询:
    balanceOf: 查询指定地址的 Token 数量
    allowance: 查询指定地址对另外一个地址的剩余授权额度
    totalSupply: 查询当前合约的 Token 总量
2 个交易
    transfer: 从当前调用者地址发送指定数量的 Token 到指定地址。
    这是一个写入方法，所以还会抛出一个 Transfer 事件。
    transferFrom: 当向另外一个合约地址存款时，对方合约必须调用 transferFrom 才可以把 Token 拿到它自己的合约中。
2 个事件
    Transfer
    Approval
1 个授权
    approve: 授权指定地址可以操作调用者的最大 Token 数量。
*/

//这段代码是一个实现了 Wrapped Ether (WETH) 合约的 Solidity 智能合约。WETH 是一种 ERC20 代币，代表了等量的以太币 (Ether)
//通过这个合约，用户可以将 Ether 包装 (wrap) 为 WETH，并可以在 DeFi 等应用中使用 WETH 进行交易和其他操作
contract WETH{
    //状态变量
    string public name = "Wrapped Ether";
    string public symbol = "WETH";
    uint8 public decimals = 18;
    //事件声明
    event Approval(address indexed src, address indexed delegateAds,uint256 amount); //记录代币持有人 (`src`) 授权其他账户 (`delegateAds`) 可以支配的代币数量 (`amount`)
    event Transfer(address indexed src, address indexed toAds, uint256 amount);  //记录代币从一个账户 (`src`) 转移到另一个账户 (`toAds`) 的交易信息
    event Deposit(address indexed toAds,uint256 amount); //记录 Ether 被存入合约并转换为 WETH 时的地址 (`toAds`) 和金额 (`amount`)
    event Withdraw(address indexed src, uint256 amount); //记录从合约中提取 WETH 并转换回 Ether 时的地址 (`src`) 和金额 (`amount`)

    //映射变量
    mapping(address => uint256) public balanceOf; //记录每个账户持有的 WETH 余额
    mapping(address => mapping(address => uint256))public allowance; //记录每个账户授权给其他账户可以支配的 WETH 额度。`allowance[src][delegateAds] 表示 src 账户授权 delegateAds 可以花费的 WETH 数量
    
    //允许用户将 Ether 存入合约，并转换为等量的 WETH。存入的 Ether 会增加用户的 WETH 余额 (`balanceOf[msg.sender]`)
    function deposit() public payable{
        balanceOf[msg.sender] += msg.value;
        emit Deposit(msg.sender,msg.value);
    }

    //允许用户将指定数量的 WETH 兑换回 Ether，并从合约中提取。该函数首先检查用户的 WETH 余额是否足够，然后减少余额，并将等量的 Ether 转给用户
    function withdraw(uint256 amount) public{
        require(balanceOf[msg.sender] >= amount);
        balanceOf[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender,amount);

    }
    
    //返回合约当前持有的总 Ether 数量，即整个 WETH 系统中的总供应量
    function totalSupply() public view returns(uint256) {
        return address(this).balance;
    }

    //`允许用户授权其他账户可以花费自己账户中的一定数量的 WETH。这是代币标准 ERC20 中的一部分
    function approve(address delegateAds, uint256 amount) public returns(bool){
        allowance[msg.sender][delegateAds] = amount;
        emit Approval(msg.sender,delegateAds,amount);
        return true;
    }

    //允许用户将 WETH 直接转移到另一个账户。此函数实际上调用了 `transferFrom() 函数来执行转账操作
    function transfer(address toAds,uint256 amount) public returns(bool) {
        return transferFrom(msg.sender, toAds, amount);
    }

    //允许第三方账户（例如，授权账户）将 `src 账户中的 WETH 转移到 toAds 账户。这是代币标准 ERC20 中的一部分，允许代理转账
    function transferFrom(
        address src,
        address toAds,
        uint256 amount
    ) public returns(bool) {
        require(balanceOf[src] >= amount);
        if(src != msg.sender) {
            require(allowance[src][msg.sender] >= amount);
            allowance[src][msg.sender] -= amount;
        }

        balanceOf[src] -= amount;
        balanceOf[toAds] += amount;
        emit Transfer(src, toAds ,amount);
        return true;
    }

    //这些是 Solidity 中的特殊函数。它们处理直接发送到合约的 Ether。这里，这些函数调用 `deposit()`，以确保所有接收到的 Ether 都被正确转换为 WETH 并存储。
    fallback() external payable{
        deposit();
    }

    receive() external payable {
        deposit();
    }

    //总结：这个合约的核心逻辑围绕着 Ether 与 WETH 的存储、转换、转移和提取。它实现了 ERC20 代币的标准操作，如授权和转账，同时引入了特定的存取操作，将 Ether 包装为 WETH 代币。
    
}
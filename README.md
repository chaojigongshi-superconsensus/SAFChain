# About

This depository is a fork of xuperchain. Add transfer fee and mortgage reward.

For the original [xuperchain](https://github.com/xuperchain/xuperchain) depository, please click the link.

[中文说明](#中文说明-1)
-----
## What is SAFChain

**SAFChain**, the xuperchain open source project of **XuperChain Lab**, introduces a highly flexible blockchain architecture with great transaction performance.
 
XuperChain is the underlying solution for union networks with following highlight features:

* **High Performance**

    * Creative XuperModel technology makes contract execution and verification run parallelly.
    * TDPoS ensures quick consensus in a large scale network.
    * WASM VM using AOT technology.

* **Solid Security**

    * Contract account protected by multiple private keys ensures assets safety.
    * Flexible authorization system supports weight threshold, AK sets and could be easily extended.

* **High Scalability**

    * Robust P2P network supports a large scale network with thousands of nodes.
    * Branch management on ledger makes automatic convergence consistency and supports global deployment.

* **Multi-Language Support**: Support pluggable multi-language contract VM using XuperBridge technology.

* **Flexibility**:  Modular and pluggable design provides high flexibility for users to build their blockchain solutions for various business scenarios.

## Quick start

### Requirements

* OS Support: Linux and Mac OS
* Go 1.13.x or later
* GCC 4.8.x or later
* Git

### Build

Clone the repository

```
git clone https://github.com/StarAllianceFoundation/SAFChain
```

**Note**: `master` branch contains latest features but might be **unstable**. for production use, please checkout our release branch. the latest release branch is `v1.0`.

Enter the xuperchain folder and build the code:

```
cd xuperchain
make
```

### Run 

There is an output folder if build successfully. Enter the output folder, create a default chain firstly:

```
cd ./output
./xchain-cli createChain
```

By doing this, a blockchain named "xuper" is created, you can find the data of this blockchain at `./data/blockchain/xuper/`.

Then start the node and run XuperChain full node servers:

```
nohup ./xchain &
```

By default, the `xuper` chain will produce a block every 3 seconds, try the following command to see the `trunkHeight` of chain and make sure it's growing.

```
./xchain-cli status
```

=====

# 中文说明

## SAFChain是什么?

**SAFChain**是基于超级链体系下的xuperchain开源项目，是构建超级联盟网络的底层方案。

核心特点

* **高性能**
    * 基于百度的XuperModel模型，真正实现了智能合约的并发执行和验证。
    * TDPOS算法确保大规模节点下的快速共识。
    * 使用AOT加速的WASM虚拟机，合约运行速度接近native程序。

* **更安全**
    * 多私钥保护的账户体系。
    * 鉴权支持权重累计、集合运算等灵活的策略。

* **易扩展**
    * 鲁棒的P2P网络，支持广域网超大规模节点。
    * 底层账本支持分叉管理，自动收敛一致性，实现真正全球化部署。

* **多语言开发智能合约**
    * 通过基于百度的XuperBridge技术，可插拔多语言虚拟机。

* **高灵活性**
    * 可插拔、插件化的设计使得用户可以方便选择适合自己业务场景的解决方案。

## 快速试用

### 环境配置

* 操作系统：支持Linux以及Mac OS
* 开发语言：Go 1.13.x及以上
* 编译器：GCC 4.8.x及以上
* 版本控制工具：Git

### 构建

克隆SAFChain仓库
```
git clone https://github.com/StarAllianceFoundation/SAFChain
```

**注意**: `master` 分支是日常开发分支，会包含最新的功能，但是 **不稳定**。生产环境请使用最新的已发布分支，最新的已发布分支是`v1.0`。

编译
```
cd SAFChain
make
```

单机版SAFChain
```
cd ./output
./xchain-cli createChain
nohup ./xchain &
./xchain-cli status
```

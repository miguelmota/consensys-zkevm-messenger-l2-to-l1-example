# ConsenSys zkEVM Messenger L2->L1 Example

> Send a message from L2 ConsenSys zkEVM testnet to L1 Goerli.

## Example

There's two contracts; `L2Contract.sol` and `L1Contract.sol`

The L2 contract has a method `sendGreetingMessageToL1` that sends a message to L1 contract to set a greeting message on L1 contract.
It sends the encoded calldata to execute `setGreeting` on L1 which can only be called if the message was sent by the L2 contract.

### Files

- [`L2Contract.sol`](./contracts/L2Contract.sol)
- [`L1Contract.sol`](./contracts/L1Contract.sol)
- [`deployL2.js`](./script/deployL2.js)
- [`deployL1.js`](./scripts/deployL1.js)
- [`getRelayFee.js`](./scripts/getRelayFee.js)
- [`sendL2ToL1Message.js`](./scripts/sendL2ToL1Message.js)
- [`getGreetingOnL1.js`](./scripts/getGreetingOnL1.js)

## Install

```sh
git clone https://github.com/miguelmota/consensys-zkevm-messenger-l2-to-l1-example.git
cd consensys-zkevm-messenger-l2-to-l1-example
npm install
```

### Set Signer

Create `.env`

```sh
PRIVATE_KEY=123...
```

Make sure private key has funds on both ConsenSys zkEVM testnet and Goerli.

### Compile Contracts

```sh
npx hardhat compile
```

### Deploy L2 Contract

Command

```sh
npx hardhat run --network consensyszk scripts/deployL2.js
```

Output

```sh
L2Contract deployed to: 0xB89f2CeD93Cdbe9Fc48Ac43b730280D8083872bD
```

### Deploy L1 Contract

Command

```sh
L2_CONTRACT=0xB89f2CeD93Cdbe9Fc48Ac43b730280D8083872bD \
npx hardhat run --network goerli scripts/deployL1.js
```

Output

```sh
L1Contract deployed to: 0x55845FeEdC708609B76AbB0f6D7306292CC28EB7
```

### Get Relay Fee

Command

```sh
npx hardhat run --network goerli scripts/getRelayFee.js
```

Output

```sh
fee: 0.01
```

### Send L2->L1 Message

Command (replace env vars with your values)

```sh
GREETING="hello world" \
L2_CONTRACT=0xB89f2CeD93Cdbe9Fc48Ac43b730280D8083872bD \
L1_CONTRACT=0x55845FeEdC708609B76AbB0f6D7306292CC28EB7 \
npx hardhat run --network consensyszk scripts/sendL2ToL1Message.js
```

Output

```sh
sent tx hash 0xe8fb9b5883a557d5f93bbab21a0e5dc90b454adc719640a780796edeead7bc66
https://explorer.goerli.zkevm.consensys.net/tx/0xe8fb9b5883a557d5f93bbab21a0e5dc90b454adc719640a780796edeead7bc66
```

### Get Greeting on L1

Command

```sh
L1_CONTRACT=0x55845FeEdC708609B76AbB0f6D7306292CC28EB7 \
npx hardhat run --network goerli scripts/getGreetingOnL1.js
```

Output

```sh
greeting: hello world
```

## License

[MIT](./LICENSE) @ [Miguel Mota](https://github.com/miguelmota)

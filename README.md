# ConsenSys zkEVM Messenger L2->L1 Example

> Send a message from L2 [ConsenSys zkEVM](https://docs.zkevm.consensys.net/) testnet to L1 Goerli.

## Example

There's two contracts; `L2Contract.sol` and `L1Contract.sol`

The L2 contract has a method `sendGreetingMessageToL1` that sends a message form L2 to L1 contract to set a greeting message on L1 contract.
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
L2Contract deployed to: 0x4A6a249Db5C65F4d87f0F962fa9a46cFC442293D
```

### Deploy L1 Contract

Command

```sh
L2_CONTRACT=0x4A6a249Db5C65F4d87f0F962fa9a46cFC442293D \
npx hardhat run --network goerli scripts/deployL1.js
```

Output

```sh
L1Contract deployed to: 0x29c514fA55a073EAE67Db285Bde984eB09BC4143
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
L2_CONTRACT=0x4A6a249Db5C65F4d87f0F962fa9a46cFC442293D \
L1_CONTRACT=0x29c514fA55a073EAE67Db285Bde984eB09BC4143 \
npx hardhat run --network consensyszk scripts/sendL2ToL1Message.js
```

Output

```sh
sent tx hash 0xe118d29f573034da2bd5e30bf0b7e5c00af09d550a02e5e3854a82a9420d681d
https://explorer.goerli.zkevm.consensys.net/tx/0xe118d29f573034da2bd5e30bf0b7e5c00af09d550a02e5e3854a82a9420d681d
```

### Get Greeting on L1

Command

```sh
L1_CONTRACT=0x29c514fA55a073EAE67Db285Bde984eB09BC4143 \
npx hardhat run --network goerli scripts/getGreetingOnL1.js
```

Output

```sh
greeting: hello world
```

### Send L1->L2 Message

See [https://github.com/miguelmota/consensys-zkevm-messenger-l2-to-l1-example](https://github.com/miguelmota/consensys-zkevm-messenger-l2-to-l1-example)

## License

[MIT](./LICENSE) @ [Miguel Mota](https://github.com/miguelmota)

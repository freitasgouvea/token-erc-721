# ERC-721 Token ! UNDER CONSTRUCTION

This is an example in solidity language of an ERC-721 standard Non Fungible Ethereum Token.

## ERC-721

ERC-721 is a standard interface for non-fungible tokens. 

More Information about Solidity Language and ERC-721 Standard:

- [Solidity](https://solidity.readthedocs.io/en/v0.6.8/): `v0.6.8`
- [ERC-721](https://eips.ethereum.org/EIPS/eip-721)

## ERC-721 Methods

## ERC-721 Modules in this example

## Requeriments to run this repositorie

- [Node.js](https://nodejs.org/download/release/latest-v10.x/): `>=10.0.0`
- [Truffle](https://www.trufflesuite.com/truffle): `v5.1.9`

## Usage

Clone or donwload this repositorie.

Go to path and run on terminal:

```sh
npm install
```
After running, all dependecies will be downloaded.

### Compile contracts

```sh
truffle compile
```

After running, contract information &mdash; including ABI &mdash; will be available at the `build/contracts/` directory.

### Run tests on Truffle

This contract can be fully tested with truffle.

You can run tests which can be found in the test directory `/test` runing on terminal:

```sh
truffle test
```

Or run tests within a specific file:

```sh
truffle test <file_path>
```

### Run migration and deploy contracts

Create .env file on root with:

```
MNENOMIC = // Your metamask's recovery words
INFURA_API_KEY = // Your Infura API Key after its registration
```
Run migrate command

```sh
truffle migrate --network <network_name>
```

Contract address and transaction ID will be shown on screen.

const Migrations = artifacts.require("ERC721");

require('dotenv').config();

console.log(process.env.TOKEN_NAME);

const tokenName = process.env.TOKEN_NAME;
const tokenSymbol = process.env.TOKEN_SYMBOL;

module.exports = function (deployer) {
  deployer.deploy(Migrations, tokenName, tokenSymbol);
};

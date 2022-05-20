const { ethers } = require("hardhat");

async function main() {
  // Getting our contract from the factory (contracts in contracts folder)
  const whitelistContract = await ethers.getContractFactory("Whitelist");

  // Deploying our contract with the value 100 (which goes into the constructor)
  const deployedWhitelistContract = await whitelistContract.deploy(100);

  await deployedWhitelistContract.deployed();

  console.log(
    "Whitelist contract address: " + deployedWhitelistContract.address
  );
}

main()
  .then(() => process.exit(0))
  .catch((e) => {
    console.log(e);
    process.exit(1);
  });

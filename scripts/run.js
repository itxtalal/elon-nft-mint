const hre = require("hardhat");

async function main() {
  // We get the contract to deploy
  const Elon = await hre.ethers.getContractFactory("Elon");
  const elon = await Elon.deploy();

  await elon.deployed();
  console.log("Elon contract deployed to:", elon.address);

  let txn = await elon.mintNFT();
  await txn.wait();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

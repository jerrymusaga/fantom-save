// This is a script for deploying your contracts. You can adapt it to deploy
// yours, or create new ones.

const { ethers } = require("hardhat");
const path = require("path");

async function main() {
  // This is just a convenience check
  if (network.name === "hardhat") {
    console.warn(
      "You are trying to deploy a contract to the Hardhat Network, which" +
        "gets automatically created and destroyed every time. Use the Hardhat" +
        " option '--network localhost'"
    );
  }

  // ethers is available in the global scope
  const [deployer] = await ethers.getSigners();
  console.log(
    "Deploying the contracts with the account:",
    await deployer.getAddress()
  );

  console.log("Account balance:", (await deployer.getBalance()).toString());

  const FantomSave = await ethers.getContractFactory("FantomSave");
  const save = await FantomSave.deploy();
  await save.deployed();

  console.log("FantomSave address:", save.address);

  saveFrontendFiles(save);

}

function saveFrontendFiles(token) {
  const fs = require("fs");
  const contractsDir = path.join(__dirname, "..", "frontend", "src", "contracts");

  if (!fs.existsSync(contractsDir)) {
    fs.mkdirSync(contractsDir);
  }

  fs.writeFileSync(
    path.join(contractsDir, "contract-address.json"),
    JSON.stringify({ Token: token.address }, undefined, 2)
  );

  const FantomSaveArtifact = artifacts.readArtifactSync("FantomSave");

  fs.writeFileSync(
    path.join(contractsDir, "FantomSave.json"),
    JSON.stringify(FantomSaveArtifact, null, 2)
  );
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

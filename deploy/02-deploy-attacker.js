const { ethers } = require("hardhat");

module.exports = async function ({ getNamedAccounts, deployments }) {
	const { deploy, log } = deployments;
	const { deployer } = await getNamedAccounts();

	const nftContract = await ethers.getContract("PoCToken");
	console.log((await nftContract.getAddress()).toString());

	await deploy("Attacker", {
		from: deployer,
		args: [await nftContract.getAddress()],
		log: true,
	});
};

module.exports.tags = ["all", "attacker"];

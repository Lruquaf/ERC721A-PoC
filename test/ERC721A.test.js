const { assert, expect } = require("chai");
const { getNamedAccounts, ethers, network } = require("hardhat");

describe("ERC721A", async function () {
	let tokenContract, attackerContract;
	let provider;
	let deployer;

	beforeEach(async function () {
		deployer = (await getNamedAccounts()).deployer;
		// provider = new ethers.provider.Web3Provider(network.provider)
		await deployments.fixture(["all"]);
		tokenContract = await ethers.getContract("PoCToken", deployer);
		attackerContract = await ethers.getContract("Attacker", deployer);
	});
	it("reverts when enter safeMint as reentrant", async function () {
		const mintTx = await attackerContract.initiate("1");
		await mintTx.wait(1);
		const balance = await tokenContract.balanceOf(
			(await attackerContract.getAddress()).toString()
		);
		console.log("Current Balance: ", balance.toString());
	});
});

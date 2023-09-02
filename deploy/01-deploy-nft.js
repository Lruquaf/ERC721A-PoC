module.exports = async function ({ getNamedAccounts, deployments }) {
	const { deploy, log } = deployments;
	const { deployer } = await getNamedAccounts();

	await deploy("PoCToken", {
		from: deployer,
		args: [],
		log: true,
	});
};

module.exports.tags = ["all", "nft"];

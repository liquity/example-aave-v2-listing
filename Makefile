# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# deps
update:; forge update

# Build & test
build  :; forge build --sizes --via-ir
test   :; forge test -vvv --rpc-url=${ETH_RPC_URL} --fork-block-number 14302075 --via-ir --match-contract ValidationLUSDListing.sol
trace   :; forge test -vvvv --rpc-url=${ETH_RPC_URL} --fork-block-number 14302075
clean  :; forge clean
snapshot :; forge snapshot

# utils
download :; ETHERSCAN_API_KEY=${ETHERSCAN_API_KEY} cast etherscan-source -d etherscan/${address} ${address} 

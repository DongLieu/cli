#!/bin/bash
set -xeu

# always returns true so set -e doesn't exit if it is not running.
killall chaintestd || true
rm -rf $HOME/.chaintestd/

# make four gaia directories
mkdir $HOME/.chaintestd
cd $HOME/.chaintestd/
mkdir $HOME/.chaintestd/validator1
mkdir $HOME/.chaintestd/validator2
mkdir $HOME/.chaintestd/validator3
mkdir $HOME/.chaintestd/validator4

# init all three validators
chaintestd init --chain-id=testing-1 validator1 --home=$HOME/.chaintestd/validator1
chaintestd init --chain-id=testing-1 validator2 --home=$HOME/.chaintestd/validator2
chaintestd init --chain-id=testing-1 validator3 --home=$HOME/.chaintestd/validator3
chaintestd init --chain-id=testing-1 validator4 --home=$HOME/.chaintestd/validator4

# create keys for all three validators
# cosmos1wa3u4knw74r598quvzydvca42qsmk6jrzmgy07
echo "ozone unfold device pave lemon potato omit insect column wise cover hint narrow large provide kidney episode clay notable milk mention dizzy muffin crazy" | chaintestd keys add validator1 --recover --keyring-backend=test --home=$HOME/.chaintestd/validator1
# cosmos1w7f3xx7e75p4l7qdym5msqem9rd4dyc4752spg
echo "cactus cable glow spray network group butter recycle weather virtual style bronze treat office energy exit ginger salute slot despair maple bus wheel stool" | chaintestd keys add validator2 --recover --keyring-backend=test --home=$HOME/.chaintestd/validator2
# cosmos1g9v3zjt6rfkwm4s8sw9wu4jgz9me8pn27f8nyc
echo $(cat /Users/donglieu/script/keys/mnemonic3)| chaintestd keys add validator3 --recover --keyring-backend=test --home=$HOME/.chaintestd/validator3

echo $(cat /Users/donglieu/script/keys/mnemonic4)| chaintestd keys add validator4 --recover --keyring-backend=test --home=$HOME/.chaintestd/validator4

# create validator node with tokens to transfer to the three other nodes
chaintestd genesis add-genesis-account $(chaintestd keys show validator1 -a --keyring-backend=test --home=$HOME/.chaintestd/validator1) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator1 
chaintestd genesis add-genesis-account $(chaintestd keys show validator2 -a --keyring-backend=test --home=$HOME/.chaintestd/validator2) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator1 
chaintestd genesis add-genesis-account $(chaintestd keys show validator3 -a --keyring-backend=test --home=$HOME/.chaintestd/validator3) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator1
chaintestd genesis add-genesis-account $(chaintestd keys show validator4 -a --keyring-backend=test --home=$HOME/.chaintestd/validator4) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator1

chaintestd genesis add-genesis-account $(chaintestd keys show validator1 -a --keyring-backend=test --home=$HOME/.chaintestd/validator1) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator2
chaintestd genesis add-genesis-account $(chaintestd keys show validator2 -a --keyring-backend=test --home=$HOME/.chaintestd/validator2) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator2 
chaintestd genesis add-genesis-account $(chaintestd keys show validator3 -a --keyring-backend=test --home=$HOME/.chaintestd/validator3) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator2 
chaintestd genesis add-genesis-account $(chaintestd keys show validator4 -a --keyring-backend=test --home=$HOME/.chaintestd/validator4) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator2

chaintestd genesis add-genesis-account $(chaintestd keys show validator1 -a --keyring-backend=test --home=$HOME/.chaintestd/validator1) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator3 
chaintestd genesis add-genesis-account $(chaintestd keys show validator2 -a --keyring-backend=test --home=$HOME/.chaintestd/validator2) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator3 
chaintestd genesis add-genesis-account $(chaintestd keys show validator3 -a --keyring-backend=test --home=$HOME/.chaintestd/validator3) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator3
chaintestd genesis add-genesis-account $(chaintestd keys show validator4 -a --keyring-backend=test --home=$HOME/.chaintestd/validator4) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator3

chaintestd genesis add-genesis-account $(chaintestd keys show validator1 -a --keyring-backend=test --home=$HOME/.chaintestd/validator1) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator4 
chaintestd genesis add-genesis-account $(chaintestd keys show validator2 -a --keyring-backend=test --home=$HOME/.chaintestd/validator2) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator4 
chaintestd genesis add-genesis-account $(chaintestd keys show validator3 -a --keyring-backend=test --home=$HOME/.chaintestd/validator3) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator4
chaintestd genesis add-genesis-account $(chaintestd keys show validator4 -a --keyring-backend=test --home=$HOME/.chaintestd/validator4) 10000000000000000000000000000000stake,10000000000000000000000000000000gaia --home=$HOME/.chaintestd/validator4


chaintestd genesis gentx validator1 1000000000000000000000stake --keyring-backend=test --home=$HOME/.chaintestd/validator1 --chain-id=testing-1
chaintestd genesis gentx validator2 1000000000000000000000stake --keyring-backend=test --home=$HOME/.chaintestd/validator2 --chain-id=testing-1
chaintestd genesis gentx validator3 1000000000000000000000stake --keyring-backend=test --home=$HOME/.chaintestd/validator3 --chain-id=testing-1
chaintestd genesis gentx validator4 1000000000000000000000stake --keyring-backend=test --home=$HOME/.chaintestd/validator4 --chain-id=testing-1

cp validator2/config/gentx/*.json $HOME/.chaintestd/validator1/config/gentx/
cp validator3/config/gentx/*.json $HOME/.chaintestd/validator1/config/gentx/
cp validator4/config/gentx/*.json $HOME/.chaintestd/validator1/config/gentx/
chaintestd genesis collect-gentxs --home=$HOME/.chaintestd/validator1 
chaintestd genesis collect-gentxs --home=$HOME/.chaintestd/validator2
chaintestd genesis collect-gentxs --home=$HOME/.chaintestd/validator3 
chaintestd genesis collect-gentxs --home=$HOME/.chaintestd/validator4

cp validator1/config/genesis.json $HOME/.chaintestd/validator2/config/genesis.json
cp validator1/config/genesis.json $HOME/.chaintestd/validator3/config/genesis.json
cp validator1/config/genesis.json $HOME/.chaintestd/validator4/config/genesis.json


# change app.toml values
VALIDATOR1_APP_TOML=$HOME/.chaintestd/validator1/config/app.toml
VALIDATOR2_APP_TOML=$HOME/.chaintestd/validator2/config/app.toml
VALIDATOR3_APP_TOML=$HOME/.chaintestd/validator3/config/app.toml
VALIDATOR4_APP_TOML=$HOME/.chaintestd/validator4/config/app.toml

# validator1
sed -i -E 's|localhost:9090|localhost:9050|g' $VALIDATOR1_APP_TOML
sed -i -E 's|minimum-gas-prices = ""|minimum-gas-prices = "0.0001stake"|g' $VALIDATOR1_APP_TOML

# validator2
sed -i -E 's|tcp://localhost:1317|tcp://localhost:1316|g' $VALIDATOR2_APP_TOML
# sed -i -E 's|0.0.0.0:9090|0.0.0.0:9088|g' $VALIDATOR2_APP_TOML
sed -i -E 's|localhost:9090|localhost:9088|g' $VALIDATOR2_APP_TOML
# sed -i -E 's|0.0.0.0:9091|0.0.0.0:9089|g' $VALIDATOR2_APP_TOML
sed -i -E 's|localhost:9091|localhost:9089|g' $VALIDATOR2_APP_TOML
sed -i -E 's|minimum-gas-prices = ""|minimum-gas-prices = "0.0001stake"|g' $VALIDATOR2_APP_TOML

# validator3
sed -i -E 's|tcp://localhost:1317|tcp://localhost:1315|g' $VALIDATOR3_APP_TOML
# sed -i -E 's|0.0.0.0:9090|0.0.0.0:9086|g' $VALIDATOR3_APP_TOML
sed -i -E 's|localhost:9090|localhost:9086|g' $VALIDATOR3_APP_TOML
# sed -i -E 's|0.0.0.0:9091|0.0.0.0:9087|g' $VALIDATOR3_APP_TOML
sed -i -E 's|localhost:9091|localhost:9087|g' $VALIDATOR3_APP_TOML
sed -i -E 's|minimum-gas-prices = ""|minimum-gas-prices = "0.0001stake"|g' $VALIDATOR3_APP_TOML

# validator4
sed -i -E 's|tcp://localhost:1317|tcp://localhost:1314|g' $VALIDATOR4_APP_TOML
# sed -i -E 's|0.0.0.0:9090|0.0.0.0:9086|g' $VALIDATOR3_APP_TOML
sed -i -E 's|localhost:9090|localhost:9084|g' $VALIDATOR4_APP_TOML
# sed -i -E 's|0.0.0.0:9091|0.0.0.0:9087|g' $VALIDATOR3_APP_TOML
sed -i -E 's|localhost:9091|localhost:9085|g' $VALIDATOR4_APP_TOML
sed -i -E 's|minimum-gas-prices = ""|minimum-gas-prices = "0.0001stake"|g' $VALIDATOR4_APP_TOML

# change config.toml values
VALIDATOR1_CONFIG=$HOME/.chaintestd/validator1/config/config.toml
VALIDATOR2_CONFIG=$HOME/.chaintestd/validator2/config/config.toml
VALIDATOR3_CONFIG=$HOME/.chaintestd/validator3/config/config.toml
VALIDATOR4_CONFIG=$HOME/.chaintestd/validator4/config/config.toml


# validator1
sed -i -E 's|allow_duplicate_ip = false|allow_duplicate_ip = true|g' $VALIDATOR1_CONFIG
# sed -i -E 's|prometheus = false|prometheus = true|g' $VALIDATOR1_CONFIG


# validator2
sed -i -E 's|tcp://127.0.0.1:26658|tcp://127.0.0.1:26655|g' $VALIDATOR2_CONFIG
sed -i -E 's|tcp://127.0.0.1:26657|tcp://127.0.0.1:26654|g' $VALIDATOR2_CONFIG
sed -i -E 's|tcp://0.0.0.0:26656|tcp://0.0.0.0:26653|g' $VALIDATOR2_CONFIG
sed -i -E 's|allow_duplicate_ip = false|allow_duplicate_ip = true|g' $VALIDATOR2_CONFIG
sed -i -E 's|prometheus = false|prometheus = true|g' $VALIDATOR2_CONFIG
sed -i -E 's|prometheus_listen_addr = ":26660"|prometheus_listen_addr = ":26630"|g' $VALIDATOR2_CONFIG

# validator3
sed -i -E 's|tcp://127.0.0.1:26658|tcp://127.0.0.1:26652|g' $VALIDATOR3_CONFIG
sed -i -E 's|tcp://127.0.0.1:26657|tcp://127.0.0.1:26651|g' $VALIDATOR3_CONFIG
sed -i -E 's|tcp://0.0.0.0:26656|tcp://0.0.0.0:26650|g' $VALIDATOR3_CONFIG
sed -i -E 's|allow_duplicate_ip = false|allow_duplicate_ip = true|g' $VALIDATOR3_CONFIG
sed -i -E 's|prometheus = false|prometheus = true|g' $VALIDATOR3_CONFIG
sed -i -E 's|prometheus_listen_addr = ":26660"|prometheus_listen_addr = ":26620"|g' $VALIDATOR3_CONFIG


# validator4
sed -i -E 's|tcp://127.0.0.1:26658|tcp://127.0.0.1:26649|g' $VALIDATOR4_CONFIG
sed -i -E 's|tcp://127.0.0.1:26657|tcp://127.0.0.1:26648|g' $VALIDATOR4_CONFIG
sed -i -E 's|tcp://0.0.0.0:26656|tcp://0.0.0.0:26647|g' $VALIDATOR4_CONFIG
sed -i -E 's|allow_duplicate_ip = false|allow_duplicate_ip = true|g' $VALIDATOR4_CONFIG
sed -i -E 's|prometheus = false|prometheus = true|g' $VALIDATOR4_CONFIG
sed -i -E 's|prometheus_listen_addr = ":26660"|prometheus_listen_addr = ":26610"|g' $VALIDATOR4_CONFIG

# # update

# copy validator1 genesis file to validator2-3
cp $HOME/.chaintestd/validator1/config/genesis.json $HOME/.chaintestd/validator2/config/genesis.json
cp $HOME/.chaintestd/validator1/config/genesis.json $HOME/.chaintestd/validator3/config/genesis.json
cp $HOME/.chaintestd/validator1/config/genesis.json $HOME/.chaintestd/validator4/config/genesis.json

# copy tendermint node id of validator1 to persistent peers of validator2-3
node1=$(chaintestd tendermint show-node-id --home=$HOME/.chaintestd/validator1)
node2=$(chaintestd tendermint show-node-id --home=$HOME/.chaintestd/validator2)
node3=$(chaintestd tendermint show-node-id --home=$HOME/.chaintestd/validator3)
node4=$(chaintestd tendermint show-node-id --home=$HOME/.chaintestd/validator4)
sed -i -E "s|persistent_peers = \"\"|persistent_peers = \"$node1@localhost:26656,$node2@localhost:26653,$node3@localhost:26650,$node4@localhost:26647\"|g" $HOME/.chaintestd/validator1/config/config.toml
sed -i -E "s|persistent_peers = \"\"|persistent_peers = \"$node1@localhost:26656,$node2@localhost:26653,$node3@localhost:26650,$node4@localhost:26647\"|g" $HOME/.chaintestd/validator2/config/config.toml
sed -i -E "s|persistent_peers = \"\"|persistent_peers = \"$node1@localhost:26656,$node2@localhost:26653,$node3@localhost:26650,$node4@localhost:26647\"|g" $HOME/.chaintestd/validator3/config/config.toml
sed -i -E "s|persistent_peers = \"\"|persistent_peers = \"$node1@localhost:26656,$node2@localhost:26653,$node3@localhost:26650,$node4@localhost:26647\"|g" $HOME/.chaintestd/validator4/config/config.toml

# # start all three validators/
# chaintestd start --home=$HOME/.chaintestd/validator1
screen -S chaintestd1 -t chaintestd1 -d -m chaintestd start --home=$HOME/.chaintestd/validator1
screen -S chaintestd2 -t chaintestd2 -d -m chaintestd start --home=$HOME/.chaintestd/validator2
screen -S chaintestd3 -t chaintestd3 -d -m chaintestd start --home=$HOME/.chaintestd/validator3
screen -S chaintestd4 -t chaintestd4 -d -m chaintestd start --home=$HOME/.chaintestd/validator4
# chaintestd start --home=$HOME/.chaintestd/validator3

sleep 7



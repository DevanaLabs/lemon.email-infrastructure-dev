# Ethereum - parity container

Parity is started with this command:

```
parity --chain="kovan" --rpcaddr 0.0.0.0 --jsonrpc-hosts="all" --rpcapi="web3,eth,personal" --no-download --ui-interface="0.0.0.0"

```

Opening RPC to public is not advisable for security reasons nevertheless it will be used only in local cluster for development on etheruem testnet.
 
Never open RPC to public when working with real Ether.


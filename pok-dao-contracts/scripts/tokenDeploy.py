from brownie import ERC20Token, accounts

def main():
    acct = accounts.load('polygon-test')
    ERC20Token.deploy("My PoK Network Token", "KVT", 18, 1e28, {'from': acct})

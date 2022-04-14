from brownie import VerificationTeamContract, accounts

COMMUNITY_NAME = "VOVA and ITRCH"
AREA = "Предсказание будущего"
CONTRACT = "Qme7ss3ARVgxv6rXqVPiikMJ8u2NLgmgszg13pYrDKEoiu"
VOTING_LENGHT = 10000

def main():
    acct = accounts.load('polygon-test')
    VerificationTeamContract.deploy(COMMUNITY_NAME, AREA, CONTRACT, VOTING_LENGHT, {'from': acct, 'amount': 25000000})


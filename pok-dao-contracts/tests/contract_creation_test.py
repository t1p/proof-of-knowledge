import pytest

COMMUNITY_NAME = "Lorem Ipsum"
AREA = "Предсказание будущего"
CONTRACT = "Qme7ss3ARVgxv6rXqVPiikMJ8u2NLgmgszg13pYrDKEoiu"
VOTING_LENGHT = 50000000


@pytest.fixture
def verification_contract(VerificationTeamContract, accounts):
    # deploy the contract with the initial value as a constructor argument
    yield VerificationTeamContract.deploy(COMMUNITY_NAME, AREA, CONTRACT, VOTING_LENGHT, {'from': accounts[0], 'amount': 25000000})


def test_initial_state(verification_contract):
    assert verification_contract.name() == COMMUNITY_NAME


def test_set(verification_contract, accounts):
    # set the value to 10
    verification_contract.approve({'from': accounts[1], 'amount': 5000000})
    assert verification_contract.member() == accounts[1]

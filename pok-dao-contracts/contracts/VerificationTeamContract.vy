# @version ^0.3.1
# Safe Remote Purchase
# Originally from
# https://github.com/ethereum/solidity/blob/develop/docs/solidity-by-example.rst
# Ported to vyper and optimized.

# Rundown of the transaction:
# 1. founder posts item for sale and posts safety deposit of double the item value.
#    Balance is 2*value.
#    (1.1. founder can reclaim deposit and close the sale as long as nothing was purchased.)
# 2. member purchases item (value) plus posts an additional safety deposit (Item value).
#    Balance is 4*value.
# 3. founder ships item.
# 4. member confirms receiving the item. member's deposit (value) is returned.
#    founder's deposit (2*value) + items value is returned. Balance is 0.

FOUNDER_DEPOSIT: constant(uint256) = 25000000
MEMBER_DEPOSIT: constant(uint256) = 5000000
MAX_VOTERS: constant(int128) = 128
PERCENT_POSITIVE_VOTES_DEFAULT: constant(int128) = 60


struct ValidationRules:
    approach: String[100]
    price: uint256
    participantsNumber: int128
    reactionTimeout: uint256

value: public(uint256) #Value of the item
name: public(String[100])
area: public(String[100])
contractContent: public(String[100])
founder: public(address)
members: HashMap[address, bool]
membersList: public(address[42])
membersCount: public(int128)
initialVotingEnd: public(uint256)
initialized: public(bool)
ready: public(bool)
percentPositiveVotes: public(int128)

validationRules: public(ValidationRules)

@external
@payable
def __init__(_communityName: String[100], _validationArea: String[100], _contractContent: String[100], _initialVotingPeriod: uint256):
    assert msg.value == FOUNDER_DEPOSIT
    self.name = _communityName
    self.area = _validationArea
    self.contractContent = _contractContent
    self.initialVotingEnd = block.timestamp + _initialVotingPeriod
    self.value = msg.value  # The founder initializes the contract by posting a safety deposit of FOUNDER_DEPOSIT
    self.founder = msg.sender
    self.membersCount = 0
    self.percentPositiveVotes = PERCENT_POSITIVE_VOTES_DEFAULT
    self.initialized = True


@external
def setValidationRules(_approach: String[100], _price: uint256, _participantsNumber: int128, _reactionTimeout: uint256):
    assert self.initialized #
    assert msg.sender == self.founder
    assert not self.ready

    self.validationRules = ValidationRules({approach: _approach, price: _price, participantsNumber: _participantsNumber, reactionTimeout: _reactionTimeout})


@external
def setPercentPositiveVotes(_percent: int128):
    assert _percent >= 0
    assert _percent <= 100

    assert self.initialized
    assert msg.sender == self.founder
    assert not self.ready

    self.percentPositiveVotes = _percent

@external
def abort():
    assert self.initialized #Is the contract still refundable?
    assert msg.sender == self.founder # Only the founder can refund
        # his deposit before any member purchases the item.
    selfdestruct(self.founder) # Refunds the founder and deletes the contract.

@external
@payable
def vote(_decision: bool):
    assert self.initialized # Is the contract still open (is the item still up

    assert block.timestamp < self.initialVotingEnd

    assert msg.value == MEMBER_DEPOSIT
    
    self.membersList[self.membersCount] = msg.sender
    self.membersCount += 1
    
    self.members[msg.sender] = _decision

@external
@payable
def revote(_decision: bool):
    assert self.initialized # Is the contract still open (is the item still up

    assert block.timestamp < self.initialVotingEnd
    alreadyVoted: bool = False
    for i in range(MAX_VOTERS):
        if(i >= self.membersCount):
            break
        if(self.membersList[i] == msg.sender):
            alreadyVoted = True
    
    assert alreadyVoted
    self.members[msg.sender] = _decision

@external
def createCommunity():

    assert self.initialized # Is the item already purchased and pending confirmation from the member?
    assert msg.sender == self.founder
    assert not self.ready

    assert block.timestamp > self.initialVotingEnd

    numberOfPositiveVoters: int128 = 0
    for i in range(MAX_VOTERS):
        if(i >= self.membersCount):
            break
        if(self.members[self.membersList[i]]):
            numberOfPositiveVoters += 1

    assert (numberOfPositiveVoters/self.membersCount) * 100 >= self.percentPositiveVotes
    # 2. Effects
    self.ready = True
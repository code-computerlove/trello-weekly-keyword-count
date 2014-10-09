require 'test/unit'
require 'rspec-expectations'
require 'securerandom'

class WeeklyKeywordCountTests < Test::Unit::TestCase	
	include AgileTrello

	def test_user_connects_to_trello_with_public_key
		public_key = SecureRandom.uuid
		mockTrelloFactory = self
		WeeklyKeywordCountVelocity.new(trello_factory: mockTrelloFactory, public_key: public_key) 
		expect(@trello_credentials.public_key).to eql(public_key)
	end 

	# SELF-SHUNT
	def create(trello_credentials)
		@trello_credentials = trello_credentials
		@created_trello
	end

	def get_board(board_id)
		@retrieved_board_id = board_id
	end
end
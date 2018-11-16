require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}
  # pending "add some examples to (or delete) #{__FILE__}"

  it { should validate_uniqueness_of(:username) }
  subject(:fred) { User.create(username: "fred", password: "123456")}

  it { should validate_presence_of(:session_token) }

  describe 'session token' do
    it 'assigns a session_token if one is not given' do
      harry = User.create(username: 'harry_potter', password: 'abcdef')
      expect(harry.session_token).not_to be_nil
    end
  end

  

end

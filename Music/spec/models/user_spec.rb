require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  subject(:user) {User.create!(email: "alia.shafi@gmail.com", password: '123456')}
  
  
  describe 'validations' do 
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password) }
  end

  describe '#is_password?' do 
    it 'should recognize the correct password' do
      expect(user.is_password?('123456')).to eq(true)
    end
    it 'should recognize incorrect passwords' do 
      expect(user.is_password?('1234567')).to eq(false)
    end
  end

  describe '#reset_session_token' do 
    it 'resets the current_users session token' do 
      expect(user.session_token).to_not eq(user.reset_session_token!)
    end
  end

  describe '::find_by_credentials' do
    it 'finds user by credentials' do 
      u1 = User.create!(email: "alia.shafi@gmail.com", password: '123456')
      expect(User.find_by_credentials("alia.shafi@gmail.com", '123456')).to eq(u1)
    end
  end

end

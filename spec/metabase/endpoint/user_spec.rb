# frozen_string_literal: true

RSpec.describe Metabase::Endpoint::User do
  include_context 'login'

  describe 'users', vcr: true do
    context 'success' do
      it 'returns all users' do
        users = client.users
        expect(users).to be_kind_of(Array)
      end
    end
  end

  describe 'current_user', vcr: true do
    context 'success' do
      it 'returns the current user' do
        user = client.current_user
        expect(user).to be_kind_of(Hash)
      end
    end
  end

  describe 'reactivate', vcr: true do
    context 'success' do
      it 'returns reactivated user' do
        user = client.reactivate(id: 3)
        expect(user).to be_kind_of(Hash)
      end
    end
  end

  describe 'delete_user', vcr: true do
    context 'success' do
      it 'disables the user' do
        deleted_user = client.delete_user(id: 2)
        expect(deleted_user).to be_kind_of(Hash)
      end
    end
  end
end

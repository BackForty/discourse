require 'spec_helper'

describe NotificationsController do

  context 'when logged in' do
    let!(:user) { log_in }

    before do
      xhr :get, :index
    end

    subject { response }
    it { should be_success }
  end

  context 'when not logged in' do
    it 'should raise an error' do
      lambda { xhr :get, :index }.should raise_error(Discourse::NotLoggedIn)
    end
  end

  describe 'count' do
    let(:user) { mock('User', unread_notifications: 10) }
    let(:single_sign_on) { mock('SingleSignOnRecord', user: user) }

    it 'returns the number of notifications for that user' do
      SingleSignOnRecord.stubs(:find_by)
                        .with(external_id: '123')
                        .returns(single_sign_on)

      xhr :get, :count, id: 123

      response.body.should == { notifications: 10 }.to_json
    end

    it 'returns 0 notifications for an invalid user id' do
      xhr :get, :count, id: '1234132423'

      response.body.should == { notifications: 0 }.to_json
    end
  end
end

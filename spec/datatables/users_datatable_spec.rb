require 'rails_helper'

describe UsersDatatable do
  
  before(:all) do
    User.delete_all
    30.times do
      FactoryGirl.create(:sequenced_user)
    end
    FactoryGirl.create(:user, short_name: 'JDT', surname: 'Trump', first_name: 'Donald')
  end
  
  let(:users_datatable) { UsersDatatable.new(params)}
  
  context 'returns users in a json like datatable format' do
    
    context 'retrieve without parameters' do
      let(:params) { ActionController::Parameters.new({}) }
      it 'returns the totol number of user records' do
        expect(users_datatable.as_json[:total_items]).to eq(31)
      end

      it 'returns an array of 10 (= default) user records' do
        expect(users_datatable.as_json[:items].length).to eq(10)
      end

      it 'returns the actual number (10 = default) of users records' do
        expect(users_datatable.as_json[:number_of_items]).to eq(10)
      end
    end

    context 'retrieve with parameters page, limit, sort_column, sort_direction' do
      let (:params) { ActionController::Parameters.new({
                                                           page: "1",
                                                           limit: "10",
                                                           sort_column: "surname",
                                                           sort_direction: "asc"
                                                       })}
      it 'returns the totol number of user records' do
        expect(users_datatable.as_json[:total_items]).to eq(31)
      end

      it 'returns an array of user records' do
        expect(users_datatable.as_json[:items].length).to eq(10)
      end

      it 'returns the actual number of users records' do
        expect(users_datatable.as_json[:number_of_items]).to eq(10)
      end
    end

    context 'supports search/filter on short_name' do
      let (:params) { ActionController::Parameters.new({
                                           short_name: "JDT"
                                         })}
      
      it 'returns the totol number of matching user records' do
        expect(users_datatable.as_json[:total_items]).to eq(1)
      end

      it 'returns an array of matching user records' do
        expect(users_datatable.as_json[:items].length).to eq(1)
      end

      it 'returns the actual number of matching users records' do
        expect(users_datatable.as_json[:number_of_items]).to eq(1)
      end
    end
    
    context 'supports search/filter on (surname) starts_with ' do
      let (:params) { ActionController::Parameters.new({
                                           starts_with: "Do",
                                       })}
      
      it 'returns the totol number of matching user records' do
        expect(users_datatable.as_json[:total_items]).to eq(30)
      end

      it 'returns an array of matching user records' do
        expect(users_datatable.as_json[:items].length).to eq(10)
      end

      it 'returns the actual number of matching users records' do
        expect(users_datatable.as_json[:number_of_items]).to eq(10)
      end
    end
    
    context 'search/filter with a pattern doesn\'t match any users returns no users' do
      let (:params) { ActionController::Parameters.new({
                                           starts_with: "Ken",
                                       })}
      it 'returns the totol number of matching user records' do
        expect(users_datatable.as_json[:total_items]).to eq(0)
      end

      it 'returns an array of matching user records' do
        expect(users_datatable.as_json[:items].length).to eq(0)
      end

      it 'returns the actual number of matching users records' do
        expect(users_datatable.as_json[:number_of_items]).to eq(0)
      end
    end
  end
end

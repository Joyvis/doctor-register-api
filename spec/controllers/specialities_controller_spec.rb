# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SpecialitiesController, type: :controller do
  let(:data) { JSON.parse(response.body)['data'] }

  describe 'listing specialities' do
    before do
      create(:speciality, name: 'test1')
      create(:speciality, name: 'test2')

      get :index, params: { q: filters }
    end

    context 'with filters' do
      let(:filters) { { name_eq: 'test1' } }

      it 'listing filtered results' do
        expect(data.size).to eq(1)
      end
    end

    context 'without filters' do
      let(:filters) { {} }

      it 'listing all results' do
        expect(data.size).to eq(2)
      end
    end
  end
end

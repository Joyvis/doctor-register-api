# frozen_string_literal: true    

require 'rails_helper'

RSpec.describe DoctorsController, type: :controller do
  let(:data) { JSON.parse(response.body, symbolize_names: true)[:data] }

  describe 'creating a doctor' do
    before do
      post :create, params: doctor_params
    end

    let(:specialities) { create_list(:speciality, 2) }

    let(:doctor_params) do
      { doctor: { name: 'Joyvis', crm: '1234', phone: '1333221122' }.
        merge(speciality_params) }
    end

    context 'with a existing speciality' do
      let(:speciality_params) do
        { doctor_specialities_attributes:
          [{ speciality_id: specialities.first.id },
           { speciality_id: specialities.last.id }] }
      end

      it 'doctor created' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with a not existing speciality' do
      let(:speciality_params) do
        { doctor_specialities_attributes: [{ speciality_id: 75 }] }
      end

      it 'doctor not created' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end


  describe 'updating a doctor' do
    before do
      patch :update, params: doctor_params.merge(id: doctor.id)
    end

    let(:doctor) { create(:doctor) }

    let(:speciality) { create(:speciality) }

    let(:doctor_params) do
      { doctor: { name: 'Joyvis', crm: '1234', phone: '1333221122' }.
        merge(speciality_params) }
    end

    context 'with a existing speciality' do
      let(:speciality_params) do
        { doctor_specialities_attributes: [{ speciality_id: speciality.id }] }
      end

      it 'http status success' do
        expect(response).to have_http_status(:ok)
      end

      it 'attributes updated' do
        expect(data[:name]).to eq(doctor_params[:name])
        expect(data[:crm]).to eq(doctor_params[:crm])
        expect(data[:phone]).to eq(doctor_params[:phone])
      end
    end

    context 'with a not existing speciality' do
      let(:speciality_params) do
        { doctor_specialities_attributes: [{ speciality_id: 75 }] }
      end

      it 'doctor not updated' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'listing doctors' do
    before do
      create(:doctor, name: 'test1')
      create(:doctor, name: 'test2')

      get :index, params: { q: filters }
    end

    let(:doctors) do
      [create(:doctor, name: 'test1'), create(:doctor, name: 'test2')]
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

  describe 'showing a doctor' do
    before { get :show, params: { id: doctor_id } }

    context 'with a valid id' do
      let(:doctor_id) { create(:doctor).id }

      it 'doctor found' do
        expect(response).to have_http_status(:ok)
        expect(data[:id]).to eq(doctor_id.to_s)
      end
    end

    context 'with a invalida id' do
      let(:doctor_id) { 8889 }

      it 'doctor not found' do
        expect(response).to have_http_status(:ok)
        expect(data).to be_blank
      end
    end
  end
end

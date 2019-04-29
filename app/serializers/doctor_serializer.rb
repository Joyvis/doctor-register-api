# frozen_string_literal: true   

class DoctorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :crm, :phone
  has_many :specialities
end

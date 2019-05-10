# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :doctor_specialities
  has_many :specialities, through: :doctor_specialities

  accepts_nested_attributes_for :doctor_specialities
  validates :name, :crm, :phone, presence: true
  validates_uniqueness_of :crm
  validate :specialities_size
  validate :specialities_uniqueness

  private

  def specialities_size
    message = 'Doctor must have at least 2 specialties'
    errors.add(:doctor_specialities, message) if doctor_specialities.size < 2
  end

  def specialities_uniqueness
    ids = doctor_specialities.map(&:speciality_id)
    message = 'Specialities must be differents'
    errors.add(:doctor_specialities, message) if ids != ids.uniq
  end
end

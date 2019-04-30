# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    doctors = Doctor.ransack(params[:q]).result
    render_success doctors
  end

  def show
    doctor = Doctor.find_by(id: params[:id])
    render_success doctor
  end

  def create
    doctor = Doctor.new(doctor_params)
    if doctor.save
      render_success doctor
    else
      render_error doctor
    end
  end

  def update
    doctor = Doctor.find(params[:id])
    if doctor.update_attributes(doctor_params)
      render_success doctor
    else
      render_error doctor
    end
  end

  def destroy
    doctor = Doctor.find(params[:id])
    doctor.destroy

    render_success doctor
  end

  private

  def doctor_params
    params.require(:doctor)
          .permit(:name, :crm, :phone,
                  doctor_specialities_attributes: [:speciality_id])
  end
end

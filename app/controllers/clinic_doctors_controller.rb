class ClinicDoctorsController < ApplicationController
  def index
    @clinic = Clinic.find(params[:clinic_id])
    @doctors = @clinic.doctors
    if params[:order_alphabetically]
      @doctors = @clinic.doctors.order_alphabetically
    end
    if params[:filter_by_rating]
      @doctors = @clinic.doctors.filter_by_rating(params[:filter_by_rating])
    end
  end

  def new
    @clinic = Clinic.find(params[:clinic_id])
  end

  def create
    clinic = Clinic.find(params[:clinic_id])
    doctor = clinic.doctors.create!(clinic_doctor_params)
    redirect_to "/clinics/#{clinic.id}/doctors"
  end

  def edit
    @clinic = Clinic.find(params[:clinic_id])
    @doctor = @clinic.doctors.find(params[:id])
  end

  def update
    clinic = Clinic.find(params[:clinic_id])
    doctor = clinic.doctors.find(params[:id])
    doctor.update(clinic_doctor_params)
    redirect_to "/clinics/#{clinic.id}/doctors"
  end

  def destroy
    clinic = Clinic.find(params[:clinic_id])
    doctor = clinic.doctors.find(params[:id])
    doctor.destroy
    redirect_to "/clinics/#{clinic.id}/doctors"
  end

  private

  def clinic_doctor_params
    params.permit(:name, :available, :rating, :clinic_id)
  end
end

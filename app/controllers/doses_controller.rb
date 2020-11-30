class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      flash[:success] = "Object successfully created"
      redirect_to cocktail_path(@dose.cocktail)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  # ----------------------------------------------------------------------------
  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end

class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      flash[:success] = "Object successfully created"
      redirect_to cocktail_path(@cocktail)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    if @dose.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to cocktail_path(@dose.cocktail_id)
    else
      flash[:error] = 'Something went wrong'
      redirect_to cocktail_path(@dose.cocktail_id)
    end
  end
  

  # ----------------------------------------------------------------------------
  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end

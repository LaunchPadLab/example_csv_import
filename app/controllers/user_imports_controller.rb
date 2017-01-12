class UserImportsController < ApplicationController
  def new
    @import = UserImport.new
  end

  def create
    @import = UserImport.new(user_import_params)
    process_import
  end

  def edit
    @import = UserImport.find(params[:id])
  end

  def update
    @import = UserImport.find(params[:id])
    @import.attributes = user_import_params
    process_import
  end

  def index
    @imports = UserImport.all
  end

  private

    def process_import
      if @import.import!
        return redirect_to user_imports_path, notice: "The file is being imported."
      else
        return redirect_to edit_user_import_path(@import)
      end
    end

    def user_import_params
      params.require(:user_import).permit(:file)
    end
end

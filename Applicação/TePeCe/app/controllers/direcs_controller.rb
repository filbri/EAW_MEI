class DirecsController < ApplicationController
  before_action :set_direc, only: [:show, :edit, :update, :destroy]

  # GET /direcs
  # GET /direcs.json
  def index
    #@direcs = Direc.all
	@direcs = Direc.paginate(page: params[:page])
  end

  # GET /direcs/1
  # GET /direcs/1.json
  def show
	@direc = Direc.find(params[:id])
  end

  # GET /direcs/new
  def new
    @direc = Direc.new
	@user = User.new
  end

  # GET /direcs/1/edit
  def edit
  end

  # POST /direcs
  # POST /direcs.json
  def create
    @direc = Direc.new(direc_params)
	@user = User.new(user_params)

    respond_to do |format|
      if @user.save
		@direc.user_id = @user.id;
		if @direc.save
			format.html { redirect_to @direc, notice: 'Direc was successfully created.' }
			format.json { render :show, status: :created, location: @direc }
		end
      else
        format.html { render :new }
        format.json { render json: @direc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /direcs/1
  # PATCH/PUT /direcs/1.json
  def update
    respond_to do |format|
      if @direc.update(direc_params)
        format.html { redirect_to @direc, notice: 'Direc was successfully updated.' }
        format.json { render :show, status: :ok, location: @direc }
      else
        format.html { render :edit }
        format.json { render json: @direc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /direcs/1
  # DELETE /direcs/1.json
  def destroy
    @direc.destroy
    respond_to do |format|
      format.html { redirect_to direcs_url, notice: 'Direc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_direc
      @direc = Direc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def direc_params
      params.require(:direc).permit(:nome, :dataNasc, :nBI, :morada, :cp, :localidade, :email, :user_id)
    end
	
	def user_params
      params.require(:direc).permit(:email, :password,
                                   :password_confirmation)
    end
end

class EncarregadosController < ApplicationController
  before_action :set_encarregado, only: [:show, :edit, :update, :destroy]

  # GET /encarregados
  # GET /encarregados.json
  def index
    # @encarregados = Encarregado.all
	@encarregados = Encarregado.paginate(page: params[:page])
  end

  # GET /encarregados/1
  # GET /encarregados/1.json
  def show
  end

  # GET /encarregados/new
  def new
    @encarregado = Encarregado.new
  end

  # GET /encarregados/1/edit
  def edit
  end

  # POST /encarregados
  # POST /encarregados.json
  def create
    @encarregado = Encarregado.new(encarregado_params)

    respond_to do |format|
      if @encarregado.save
        format.html { redirect_to @encarregado, notice: 'Encarregado was successfully created.' }
        format.json { render :show, status: :created, location: @encarregado }
      else
        format.html { render :new }
        format.json { render json: @encarregado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encarregados/1
  # PATCH/PUT /encarregados/1.json
  def update
    respond_to do |format|
      if @encarregado.update(encarregado_params)
        format.html { redirect_to @encarregado, notice: 'Encarregado was successfully updated.' }
        format.json { render :show, status: :ok, location: @encarregado }
      else
        format.html { render :edit }
        format.json { render json: @encarregado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encarregados/1
  # DELETE /encarregados/1.json
  def destroy
    @encarregado.destroy
    respond_to do |format|
      format.html { redirect_to encarregados_url, notice: 'Encarregado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encarregado
      @encarregado = Encarregado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encarregado_params
      params.require(:encarregado).permit(:nome, :dataNasc, :nBI, :morada, :cp, :localidade, :email, :user_id)
    end
end

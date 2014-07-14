class ResolucaosController < ApplicationController
  before_action :set_resolucao, only: [:show, :edit, :update, :destroy]

  # GET /resolucaos
  # GET /resolucaos.json
  def index
    @resolucaos = Resolucao.all
  end

  # GET /resolucaos/1
  # GET /resolucaos/1.json
  def show
  end

  # GET /resolucaos/new
  def new
    @exercicio = Exercicio.find(params[:exercicio_id])
    @resolucao = Resolucao.new
    @resolucao.exercicio = @exercicio
  end

  # GET /resolucaos/1/edit
  def edit
  end

  # POST /resolucaos
  # POST /resolucaos.json
  def create
    @resolucao = Resolucao.new(resolucao_params)
    @exercicio = Exercicio.find(@resolucao.exercicio_id)
    respond_to do |format|
      if @resolucao.save and exercicio.save
        format.html { redirect_to @exercicio, notice: 'Resolucao was successfully created.' }
        format.json { render :show, status: :created, location: @resolucao }
      else
        format.html { render :new }
        format.json { render json: @resolucao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resolucaos/1
  # PATCH/PUT /resolucaos/1.json
  def update
    respond_to do |format|
      if @resolucao.update(resolucao_params)
        format.html { redirect_to @exercicio, notice: 'Resolucao was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercicio }
      else
        format.html { render :edit }
        format.json { render json: @resolucao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resolucaos/1
  # DELETE /resolucaos/1.json
  def destroy
    @resolucao.destroy
    respond_to do |format|
      format.html { redirect_to resolucaos_url, notice: 'Resolucao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resolucao
      @exercicio = Exercicio.find(params[:exercicio_id])
      @resolucao = Resolucao.find_by_exercicio_id(params[:exercicio_id])
      if @resolucao == nil
        @resolucao = Resolucao.new
        @resolucao.exercicio = @exercicio
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resolucao_params
      params.require(:resolucao).permit(:resposta, :exercicio_id)
    end
end

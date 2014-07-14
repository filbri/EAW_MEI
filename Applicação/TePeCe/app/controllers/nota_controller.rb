class NotaController < ApplicationController
  before_action :set_notum, only: [:show, :edit, :update, :destroy]

  # GET /nota
  # GET /nota.json
  def index
    @notas = Nota.all
  end

  # GET /nota/1
  # GET /nota/1.json
  def show
  end

  # GET /nota/new
  def new
    @exercicio = Exercicio.find(params[:exercicio_id])
    @resolucao = Resolucao.find_by_exercicio_id(params[:exercicio_id])
    @nota = Nota.new
    @nota.exercicio = @exercicio
    @nota.aluno = @exercicio.aluno
    @nota.valor = 10
  end

  # GET /nota/1/edit
  def edit
  end

  # POST /nota
  # POST /nota.json
  def create
    @nota = Nota.new(notum_params)
    @exercicio = Exercicio.find(@nota.exercicio_id)
    @nota.aluno = @exercicio.aluno
    respond_to do |format|
      if @nota.save and @exercicio.save
        format.html { redirect_to @exercicio, notice: 'Nota atribuida.' }
        format.json { render :show, status: :created, location: @nota }
      else
        format.html { render :new }
        format.json { render json: @nota.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nota/1
  # PATCH/PUT /nota/1.json
  def update
    @nota.aluno = @exercicio.aluno
    respond_to do |format|
      if @nota.update(notum_params)
        format.html { redirect_to @exercicio, notice: 'Nota alterada.' }
        format.json { render :show, status: :ok, location: @nota }
      else
        format.html { render :edit }
        format.json { render json: @nota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nota/1
  # DELETE /nota/1.json
  def destroy
    @nota.destroy
    respond_to do |format|
      format.html { redirect_to nota_url, notice: 'Nota removida.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notum
      @exercicio = Exercicio.find(params[:exercicio_id])
      @resolucao = Resolucao.find_by_exercicio_id(params[:exercicio_id])
      @nota = Nota.find_by_exercicio_id(params[:exercicio_id])
      if @nota == nil
        @nota = Nota.new
        @nota.exercicio = @exercicio
        @nota.valor = 10
        @nota.aluno = @exercicio.aluno
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notum_params
      params.require(:nota).permit(:valor)
    end
end

class ExerciciosController < ApplicationController
  before_action :set_exercicio, only: [:show, :edit, :update, :destroy]

  # GET /exercicios
  # GET /exercicios.json
  def index
    if current_user.aluno
      @exercicios = Exercicio.where(:aluno_id => current_user.aluno)
    elsif current_user.encarregado
      filhos = Aluno.where(:encarregado_id => current_user.encarregado).select(:id)
      @exercicios = Exercicio.where("aluno_id in (?)",  filhos)
    elsif current_user.prof
      @exercicios = Exercicio.where(:prof_id => current_user.prof)
    else
      @exercicios = Exercicio.all
    end
  end

  # GET /exercicios/1
  # GET /exercicios/1.json
  def show
  end

  # GET /exercicios/new
  def new
    @exercicio = Exercicio.new
  	@alunos = Aluno.all
    @disciplinas = Disciplina.all
    @exercicio.disciplina_id = params[:format]
    @exercicio.prof_id = current_user.prof.id
  end

  # GET /exercicios/1/edit
  def edit
    @alunos = Aluno.all
    @disciplinas = Disciplina.all
    @exercicio.prof_id = current_user.prof.id
  end

  # POST /exercicios
  # POST /exercicios.json
  def create
    @exercicio = Exercicio.new(exercicio_params)
    @exercicio.prof_id = current_user.prof.id

    respond_to do |format|
      if @exercicio.save and @exercicio.save
        format.html { redirect_to @exercicio, notice: 'Exercicio was successfully created.' }
        format.json { render :show, status: :created, location: @exercicio }
      else
        format.html { render :new }
        format.json { render json: @exercicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercicios/1
  # PATCH/PUT /exercicios/1.json
  def update
    respond_to do |format|
      if @exercicio.update(exercicio_params)
        format.html { redirect_to @exercicio, notice: 'Exercicio was successfully updated.' }
        format.json { render :show, status: :ok, location: @exercicio }
      else
        format.html { render :edit }
        format.json { render json: @exercicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercicios/1
  # DELETE /exercicios/1.json
  def destroy
    @exercicio.destroy
    respond_to do |format|
      format.html { redirect_to exercicios_url, notice: 'Exercicio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bydisc
    excs = Exercicio.where(:disciplina_id => params[:disciplina_id])
    @disciplina = Disciplina.find(params[:disciplina_id])
    if current_user.aluno
      @exercicios = excs.where(:aluno_id => current_user.aluno)
    elsif current_user.encarregado
      filhos = Aluno.where(:encarregado_id => current_user.encarregado).select(:id)
      @exercicios = excs.where("aluno_id in (?)",  filhos)
    elsif current_user.prof
      @exercicios = excs.where(:prof_id => current_user.prof)
    else
      @exercicios = excs.all
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercicio
      @exercicio = Exercicio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exercicio_params
      params.require(:exercicio).permit(:titulo, :enunciado, :aluno_id, :disciplina_id)
    end
end

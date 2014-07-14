class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show, :edit, :update, :destroy]
  

  # GET /alunos
  # GET /alunos.json
  def index
   #@alunos = Aluno.all
	@alunos = Aluno.paginate(page: params[:page])
  end

  # GET /alunos/1
  # GET /alunos/1.json
  def show
  	@aluno = Aluno.find(params[:id])
    @encarregado = Encarregado.find(@aluno.encarregado_id)
    @turma = Turma.find(@aluno.turma_id)
  end

  # GET /alunos/new
  def new
    @aluno = Aluno.new
  	@user = User.new
    @encarregados = Encarregado.all
    @turmas = Turma.all
    @aluno.turma_id = params[:format]
  end

  # GET /alunos/1/edit
  def edit
  	@user = User.find(@aluno.user_id)
    @encarregados = Encarregado.all
    @turmas = Turma.all
  end

  # POST /alunos
  # POST /alunos.json
  def create
    @aluno = Aluno.new(aluno_params)
	@user = User.new(user_params)

    respond_to do |format|
      if @user.save
		@aluno.user_id = @user.id;
		if @aluno.save
			format.html { redirect_to @aluno, notice: 'Aluno criado com sucesso.' }
			format.json { render :show, status: :created, location: @aluno }
		end
	else
        format.html { render :new }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
    end
   end
  end

  # PATCH/PUT /alunos/1
  # PATCH/PUT /alunos/1.json
  def update
	@user = User.find(@aluno.user_id)
	
	respond_to do |format|
      if @aluno.update(aluno_params) and @user.update(user_params)
        format.html { redirect_to @aluno, notice: 'Aluno atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @aluno }
      else
        format.html { render :edit }
        format.json { render json: @aluno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alunos/1
  # DELETE /alunos/1.json
  def destroy
    @user = User.find(@aluno.user_id)
    if @aluno.destroy
  		@user.destroy
      respond_to do |format|
        format.html { redirect_to alunos_url, notice: 'Aluno apagado com sucesso.' }
        format.json { head :no_content }
      end
  	end
  end

  def statistics
    @aluno = Aluno.find(params[:aluno_id])
    @user = User.find(@aluno.user_id)
    notas = Nota.where(:aluno_id => @aluno)
    @media = notas.average(:valor)
    if not @media
      @media = "N/A"
    end
    @max = notas.maximum(:valor)
    if not @max
      @max = "N/A"
    end
    @min = notas.minimum(:valor)
    if not @min
      @min = "N/A"
    end
    @poss = notas.where("valor >= ?", 10).count()
    if not @poss
      @poss = "N/A"
    end
    @negs = notas.where("valor < ?", 10).count()
    if not @negs
      @negs = "N/A"
    end
    @cmp = notas.count()
    if not @cmp
      @cmp = "N/A"
    end
    @inc = Exercicio.all.count() - @cmp
    if not @inc
      @inc = "N/A"
    end

    melhor = 0
    nomeM = "N/A"
    pior = 20
    nomeP = "N/A"

    Disciplina.all.each do |disc|
      excs = Exercicio.where(:disciplina_id => disc.id).select(:id)
      nota = Nota.where("exercicio_id in (?)", excs).average(:valor)
      if nota
        if(nota > melhor)
          melhor = nota
          nomeM = disc.designacao
        end
        if(nota < pior)
          pior = nota
          nomeP = disc.designacao
        end
      end
    end

    @best = nomeM + " (" + melhor.to_s + ")"
    if @best.include? "N/A"
      @best = "N/A"
    end
    @worst = nomeP + " (" + pior.to_s + ")"
    if @worst.include? "N/A"
      @worst = "N/A"
    end
  end

  def statistics_index
    if current_user.encarregado
      @alunos = Aluno.where(:encarregado_id => current_user.encarregado).paginate(page: params[:page])
    else
      @alunos = Aluno.paginate(page: params[:page])
    end
  end

  def byturma
    @alunos = Aluno.where(:turma_id => params[:turma_id]).paginate(page: params[:page])
    @turma = Turma.find(params[:turma_id])
  end

  def stats_byturma
    alns = Aluno.where(:turma_id => params[:turma_id]).paginate(page: params[:page])
    @turma = Turma.find(params[:turma_id])
    if current_user.encarregado
      @alunos = alns.where(:encarregado_id => current_user.encarregado).paginate(page: params[:page])
    else
      @alunos = alns.paginate(page: params[:page])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aluno
      @aluno = Aluno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aluno_params
      params.require(:aluno).permit(:nome, :dataNasc, :nBI, :morada, :cp, :localidade, :email, :user_id, :encarregado_id, :turma_id)
    end
	
	def user_params
      params.require(:aluno).permit(:email, :password,
                                   :password_confirmation)
    end
end

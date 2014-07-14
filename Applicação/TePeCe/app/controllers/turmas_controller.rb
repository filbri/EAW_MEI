class TurmasController < ApplicationController
  before_action :set_turma, only: [:show, :edit, :update, :destroy]

  # GET /turmas
  # GET /turmas.json
  def index
    @turmas = Turma.all
  end

  # GET /turmas/1
  # GET /turmas/1.json
  def show
  end

  # GET /turmas/new
  def new
    @turma = Turma.new
  end

  # GET /turmas/1/edit
  def edit
  end

  # POST /turmas
  # POST /turmas.json
  def create
    @turma = Turma.new(turma_params)

    respond_to do |format|
      if @turma.save
        format.html { redirect_to @turma, notice: 'Turma was successfully created.' }
        format.json { render :show, status: :created, location: @turma }
      else
        format.html { render :new }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turmas/1
  # PATCH/PUT /turmas/1.json
  def update
    respond_to do |format|
      if @turma.update(turma_params)
        format.html { redirect_to @turma, notice: 'Turma was successfully updated.' }
        format.json { render :show, status: :ok, location: @turma }
      else
        format.html { render :edit }
        format.json { render json: @turma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turmas/1
  # DELETE /turmas/1.json
  def destroy
    @turma.destroy
    respond_to do |format|
      format.html { redirect_to turmas_url, notice: 'Turma was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def statistics
    @turma = Turma.find(params[:turma_id])
    alunos = Aluno.where(:turma_id => params[:turma_id])
    exercicios = Exercicio.where("aluno_id in (?)", alunos.select(:id))
    notas = Nota.where("aluno_id in (?)", alunos.select(:id))

    if alunos
      @count = alunos.count()
    else
      @count = "N/A"
    end

    @media = notas.average(:valor)
    if not @media
      @media = "N/A"
    end

    melhor = 0
    nomeM = "N/A"
    pior = 20
    nomeP = "N/A"
    bom = 0
    nomeB = "N/A"
    mau = 20
    nomeW = "N/A"

    alunos.each do |aluno|
      grades = Nota.where(:aluno_id => aluno)
      best = grades.maximum(:valor)
      worst = grades.minimum(:valor)
      avrg = grades.average(:valor)
      if best and (best > melhor)
          melhor = best
          nomeM = aluno.nome
      end
      if worst and (worst < pior)
          pior = worst
          nomeP = aluno.nome
      end
      if avrg
        if avrg > bom
            bom = avrg
            nomeB = aluno.nome
        end
        if avrg < mau
            mau = avrg
            nomeW = aluno.nome
        end
      end
    end

    @max = melhor.to_s + " (" + nomeM + ")"
    if @max.include? "N/A"
      @max = "N/A"
    end
    @min = pior.to_s + " (" + nomeP + ")"
    if @min.include? "N/A"
      @min = "N/A"
    end
    @bmed = bom.to_s + " (" + nomeB + ")"
    if @bmed.include? "N/A"
      @bmed = "N/A"
    end
    @wmed = mau.to_s + " (" + nomeW + ")"
    if @wmed.include? "N/A"
      @wmed = "N/A"
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
    @inc = exercicios.count() - @cmp
    if not @inc
      @incs = "N/A"
    end

    melhor = 0
    nomeM = "N/A"
    pior = 20
    nomeP = "N/A"

    Disciplina.all.each do |disc|
      excs = exercicios.where(:disciplina_id => disc.id).select(:id)
      nota = notas.where("exercicio_id in (?)", excs).average(:valor)
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
    @turmas = Turma.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turma
      @turma = Turma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turma_params
      params.require(:turma).permit(:designacao)
    end
end

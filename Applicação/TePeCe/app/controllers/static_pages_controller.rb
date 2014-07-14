class StaticPagesController < ApplicationController
  def home
  end

  def contact
  end

  def about
  end

  def statistics
	@alunos = Aluno.all
	@turmas = Turma.all
	notas = Nota.all
	exercicios = Exercicio.all

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

    @alunos.each do |aluno|
      grades = Nota.where(:aluno_id => aluno)
      best = grades.maximum(:valor)
      worst = grades.minimum(:valor)
      avrg = grades.average(:valor)
      if best and (best > melhor)
          melhor = best
          nomeM = aluno.nome + " / " + Turma.find(aluno.turma_id).designacao
      end
      if worst and (worst < pior)
          pior = worst
          nomeP = aluno.nome + " / " + Turma.find(aluno.turma_id).designacao
      end
      if avrg
        if avrg > bom
            bom = avrg
            nomeB = aluno.nome + " / " + Turma.find(aluno.turma_id).designacao
        end
        if avrg < mau
            mau = avrg
            nomeW = aluno.nome + " / " + Turma.find(aluno.turma_id).designacao
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

    melhor = 0
    nomeM = "N/A"
    pior = 20
    nomeP = "N/A"

    @turmas.each do |turma|
      alns = Aluno.where(:turma_id => turma)
      grades = Nota.where("aluno_id in (?)", alns.select(:id))
      avrg = grades.average(:valor)
      if avrg
        if avrg > melhor
            melhor = avrg
            nomeM = turma.designacao
        end
        if avrg < pior
            pior = avrg
            nomeP = turma.designacao
        end
      end
    end

    @bestTurma = melhor.to_s + " (" + nomeM + ")"
    if @bestTurma.include? "N/A"
      @bestTurma = "N/A"
    end
    @worstTurma = pior.to_s + " (" + nomeP + ")"
    if @bestTurma.include? "N/A"
      @bestTurma = "N/A"
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
end

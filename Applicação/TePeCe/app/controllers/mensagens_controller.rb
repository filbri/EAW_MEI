class MensagensController < ApplicationController
  before_action :set_mensagen, only: [:show, :edit, :update, :destroy]

  # GET /mensagens
  # GET /mensagens.json
  def index
      @user = current_user
	    @mensagens = Mensagen.where(:destinatario => @user).paginate(page: params[:page])
  end

  # GET /mensagens/1
  # GET /mensagens/1.json
  def show
      @user = current_user
      @mensagen = Mensagen.find(params[:id])
  end

  # GET /mensagens/new
  def new
    @user = current_user
    alunos = Aluno.select(:user_id)
    @users = User.where("id != ?", @user).where("id not in (?)", alunos)
    @mensagen = Mensagen.new
    @mensagen.origem = @user
  end

  # GET /mensagens/1/edit
  def edit
    @user = current_user
    alunos = Aluno.select(:user_id)
    @users = User.where("id != ?", @user).where("id not in (?)", alunos)
  end

  # POST /mensagens
  # POST /mensagens.json
  def create
    @mensagen = Mensagen.new(mensagen_params)
    @user = current_user
    alunos = Aluno.select(:user_id)
    @users = User.where("id != ?", @user).where("id not in (?)", alunos)
    @mensagen.origem = @user
    respond_to do |format|
      if @mensagen.save and @user.save
        format.html { redirect_to user_mensagens_path(current_user), notice: 'Mensagen enviada.' }
        format.json { render :show, status: :created, location: user_mensagens_path(current_user) }
      else
        format.html { render :new }
        format.json { render json: @mensagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensagens/1
  # PATCH/PUT /mensagens/1.json
  def update
    @user = current_user
    alunos = Aluno.select(:user_id)
    @users = User.where("id != ?", @user).where("id not in (?)", alunos)
    @mensagen = Mensagen.new(mensagen_params)
    @mensagen.origem = @user
    respond_to do |format|
      if @mensagen.update(mensagen_params)
        format.html { redirect_to user_mensagens_path(current_user), notice: 'Mensagen enviada.' }
        format.json { render :show, status: :ok, location: user_mensagens_path(current_user) }
      else
        format.html { render :edit }
        format.json { render json: @mensagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensagens/1
  # DELETE /mensagens/1.json
  def destroy
    @user = current_user
    @mensagen.destroy
    respond_to do |format|
      format.html { redirect_to user_mensagens_path(current_user), notice: 'Mensagen apagada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensagen
      @user = current_user
      if params[:id] == "new"
        @mensagen = Mensagen.new(mensagen_params)
      else
        @mensagen = Mensagen.find(params[:id])
        @mensagen.origem = @user
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensagen_params
      params.require(:mensagen).permit(:remetente, :destinatario, :assunto, :mensagem)
    end
end

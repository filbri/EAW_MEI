class MensagensController < ApplicationController
  before_action :set_mensagen, only: [:show, :edit, :update, :destroy]

  # GET /mensagens
  # GET /mensagens.json
  def index
    #@mensagens = Mensagen.all
	@mensagens = Mensagen.paginate(page: params[:page])
  end

  # GET /mensagens/1
  # GET /mensagens/1.json
  def show
  end

  # GET /mensagens/new
  def new
    @mensagen = Mensagen.new
  end

  # GET /mensagens/1/edit
  def edit
  end

  # POST /mensagens
  # POST /mensagens.json
  def create
    @mensagen = Mensagen.new(mensagen_params)

    respond_to do |format|
      if @mensagen.save
        format.html { redirect_to @mensagen, notice: 'Mensagen was successfully created.' }
        format.json { render :show, status: :created, location: @mensagen }
      else
        format.html { render :new }
        format.json { render json: @mensagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mensagens/1
  # PATCH/PUT /mensagens/1.json
  def update
    respond_to do |format|
      if @mensagen.update(mensagen_params)
        format.html { redirect_to @mensagen, notice: 'Mensagen was successfully updated.' }
        format.json { render :show, status: :ok, location: @mensagen }
      else
        format.html { render :edit }
        format.json { render json: @mensagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mensagens/1
  # DELETE /mensagens/1.json
  def destroy
    @mensagen.destroy
    respond_to do |format|
      format.html { redirect_to mensagens_url, notice: 'Mensagen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mensagen
      @mensagen = Mensagen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mensagen_params
      params.require(:mensagen).permit(:remetente, :destinatario, :assunto, :mensagem)
    end
end

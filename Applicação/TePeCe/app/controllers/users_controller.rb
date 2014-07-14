class UsersController < ApplicationController
	before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user,     only: [:destroy]
  
  def index
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  def show
  	@user = User.find(params[:id])
    yesterday = Time.now - 1.day
    newEx = Exercicio.where(["created_at >= ? AND created_at <= ?", yesterday.beginning_of_day, Time.now.end_of_day])
    newRes = Resolucao.where(["created_at >= ? AND created_at <= ?", yesterday.beginning_of_day, Time.now.end_of_day])
    notdone = Exercicio.where("id not in (?)", Resolucao.all.select(:exercicio_id))
    done = Exercicio.where("id in (?)", Resolucao.all.select(:exercicio_id))
    graded = Nota.where(["created_at >= ? AND created_at <= ?", yesterday.beginning_of_day, Time.now.end_of_day])
    received = Mensagen.where(["created_at >= ? AND created_at <= ?", yesterday.beginning_of_day, Time.now.end_of_day])
    if @user.aluno
      @news = newEx.where(:aluno_id => @user.aluno)
      @todo = notdone.where(:aluno_id => @user.aluno)
      @grades = graded.where(:aluno_id => @user.aluno)
    elsif @user.prof
      @news = newRes.where("exercicio_id in (?)", Exercicio.where(:prof_id => @user.prof).select(:id))
      tograde = done.where("id not in (?)", Nota.all.select(:exercicio_id))
      @todo = tograde.where(:prof_id => @user.prof)
    elsif @user.encarregado
      @news = newEx.where("aluno_id in (?)", Aluno.where(:encarregado_id => @user.encarregado).select(:id))
      @todo = notdone.where("aluno_id in (?)", Aluno.where(:encarregado_id => @user.encarregado).select(:id))
      @grades = graded.where("aluno_id in (?)", Aluno.where(:encarregado_id => @user.encarregado).select(:id))
    end
    @msgs = received.where(:destinatario => @user)
  end

  # GET /users/new
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Registado com sucesso!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # GET /users/1/edit
  def edit
	@user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
   
   private
   
    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation)
    end
	
	# Before filters

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
	
	def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
	
	def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end

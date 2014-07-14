class User < ActiveRecord::Base
	has_one :aluno, dependent: :destroy
	has_one :prof
	has_one :direc
	has_one :encarregado
	
	has_many :mensagens
	
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
				format: { with: VALID_EMAIL_REGEX },
				length: { maximum: 50 },
				uniqueness: true
	has_secure_password			
	validates :password, length: { minimum: 6 }
	
	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end
	
	def user_name
		if self.aluno
			self.aluno.nome
		elsif self.prof
			self.prof.nome
		elsif self.direc
			self.direc.nome
		else
			self.encarregado.nome
		end	
	end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
	
end

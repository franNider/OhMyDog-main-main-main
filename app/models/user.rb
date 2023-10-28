class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true,
    format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      message: :invalid
    }

    validates :dni, presence: true, uniqueness: true,
    format: {
      with: /\A[0-9]+\z/,
      message: :invalid
    }

    validates :password, presence: true
    validates :nombre, presence: true,
    format: {
      with: /\A[a-z-A-Z]+\z/,
      message: :invalid
    }
    validates :apellido, presence: true,
    format: {
      with: /\A[a-z-A-Z]+\z/,
      message: :invalid
    }

    validates :rol, presence: true

    before_save :downcase_attributes

    private
    
    def downcase_attributes
        self.email = email.downcase
    end
end

class User < ApplicationRecord
  has_secure_password

  before_validation :normalize_email

  validates :email, presence: true
  validates :email, format: {
    with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,
    message: "Введите корректный адрес почты"
  }
  validates :email, uniqueness: { case_sensitive: false, message: "Email уже зарегистрирован" }

  private

  def normalize_email
    self.email = email.to_s.downcase.strip
  end
end

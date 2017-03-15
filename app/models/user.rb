class User < ApplicationRecord

  #Felhasználókezelés
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Az alábbi két metódus azért került be, mert nem e-mail címmel, hanem username-mel
  # történik az autentikáció.

  def email_required?
    false
  end

  def email_changed?
    false
  end

  #Kapcsolatok
  has_many :articles

end

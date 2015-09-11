class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validate :santa_assigned?

  def need_more_santas
    self.secret_santa = "no santa"
  end

  def assign_santa
    User.all.rand
  end

  private

  def santa_assigned?
    User.where(secret_santa: self.assign_santa)
  end
end

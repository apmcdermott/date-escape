class Message < ActiveRecord::Base
  validates :trigger, :content, presence: true
  validates :uniqueness_of_trigger_and_user
  has_many :scenario_messages
  has_many :scenarios, through: :scenario_messages
  belongs_to :user
  accepts_nested_attributes_for :scenarios, :scenario_messages

  def uniqueness_of_trigger_and_user
    if current_user.messages.where(trigger: self.trigger).exists?
      errors.add(:trigger, "must be unique")
    end
  end

end

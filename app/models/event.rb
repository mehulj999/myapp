# Event model
class Event < ApplicationRecord
  belongs_to :user

  enum name: {
    event_a: 'Event A',
    event_b: 'Event B'
  }

  validates :name, presence: true

  scope :by_user, ->(user) { where(user_id: user&.id) }

  after_create :send_create_mail
  after_update :send_update_mail
  after_update :dummy
  after_destroy :send_destroy_mail

  %w[create update destroy].each do |method|
    define_method "send_#{method}_mail" do
      return unless name == 'event_b'

      iterable = IterableApi.new(user)
      iterable.send("#{method}_event_mail", user, method)
    end
  end
end

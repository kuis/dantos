class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :room
  belongs_to :user
  has_one :attachment, dependent: :destroy

  validates_presence_of :room, :user

  # validate :body_or_image_present

  # after_create :process_command

  def process_command
    if self.body =~ /\/charge \$?([\d\.]+)/
      amount = $1
      self.create_attachment html: <<~HTML.squish
        <form action="/payments" method="POST">
          <script
            src="https://checkout.stripe.com/checkout.js" class="stripe-button"
            data-key="pk_test_6pRNASCoBOKtIshFeQd4XMUh"
            data-amount="#{(amount.to_f*100).to_i}"
            data-name="Kriya"
            data-image="https://www.filestackapi.com/api/file/6hx3CLg3SQGoARFjNBGq"
            data-locale="auto"
            data-zip-code="true">
          </script>
        </form>
      HTML
      self.update body: "The charge for this task is $#{amount}, can you confirm so we can get it started?"
      logger.debug self.inspect
      logger.debug self.errors.inspect
      logger.debug self.reload.inspect
    end

    ActionCable.server.broadcast(
      "rooms:#{room.id}:messages",
      message: MessagesController.render(
        partial: 'messages/message',
        locals: {
          message: self, user: user
        }
      )
    )
  end

  def body_or_image_present
    if self.body.blank? && self.image.blank? && self.attachment.blank?
      errors[:body] << ("Please write something")
    end
  end

  def within_60_secs_from_previous?
    message = previous_message
    !message.nil? && seconds_from_message(message) <= 60
  end

  def seconds_from_message(message = previous_message)
    (self.created_at.to_f - message.created_at.to_f)
  end

  def previous_message
    room.messages.where('id < ?', self.id).last
  end

  def next_message
    room.messages.where('id > ?', self.id).first
  end

end

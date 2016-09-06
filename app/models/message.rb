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
      amount = $1.to_f*100
      self.create_attachment html: <<~HTML.squish
        <form action="/payments" method="POST">
          <script
            src="https://checkout.stripe.com/checkout.js" class="stripe-button"
            data-key="pk_test_6pRNASCoBOKtIshFeQd4XMUh"
            data-amount="#{amount.to_i}"
            data-name="Kriya"
            data-image="/assets/square-logo.ico"
            data-locale="auto"
            data-zip-code="true">
          </script>
        </form>
      HTML
      self.update body: nil
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
end

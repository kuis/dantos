module MessagesHelper

  def body_asset_pre(message)
    html = case true
             when message.asset.present?
               if message.asset.content_type.start_with? 'image'
                 link_to image_tag(message.asset.url(:thumb)), message.asset.url(:thumb), class: "fluidbox"
               else
                 link_to message.asset_identifier, message.asset.url, class: "fluidbox"
               end
             when message.body.present?
               auto_link message.body, html: {target: '_blank', rel: "nofollow"}
             else
               ''
           end
    html
  end
end

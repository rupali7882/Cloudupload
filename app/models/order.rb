class Order < ApplicationRecord

  def paypal_url(return_path)
    values = {
        business: "rupali.dev89-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: 1_000_000 + Random.rand(10_000_000 - 1_000_000),
        amount: self.price,
        item_name: self.name,
        item_number: self.id,
        item_description: "payment order detail",
        quantity: '1',
        notify_url: "#{Rails.application.secrets.app_host}/hook"

    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end

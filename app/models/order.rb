class Order < ApplicationRecord



  def paypal_url(return_path)
    values = {
        business: "rupali.dev89-facilitator@gmail.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: id,
        amount: self.price,
        order_name: self.name,
        order_number: self.id,
        quantity: '1'
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end

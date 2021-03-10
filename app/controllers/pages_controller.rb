class PagesController < ApplicationController
  def index
    data = {
        order_id: '122222',
        currency: 'INR',
        amount: 100,
        redirect_url: 'http://localhost:3000/payment_confirm',
        cancel_url: 'http://localhost:3000/payment_cancel'
    }
    # Creating encrypted data
    @encRequest = CcavenuePayment.encrypted_data(data)
    @ccavenue_request_url = CcavenuePayment.request_url
    @ccavenue_access_code = ENV.fetch('CCAVENUE_ACCESS_CODE').freeze
  end

  def payment_confirm
    # parameter to response is encrypted reponse we get from CCavenue
    @order_Id = 'null'
    if params['encResponse'].present?
      CcavenuePayment.decrypted_data(params['encResponse']) 
      # Return parameters:
      #   Auth Description: <String: Payment Failed/Success>
      #   Checksum Verification <Bool: True/False>
      #   Response Data: <HASH/Array: Order_id, amount etc>
      @order_Id = data["Order_Id"][0]
    end
  end
end

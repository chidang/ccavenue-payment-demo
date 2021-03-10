class ApplicationController < ActionController::Base
  def ccavenue
    return @ccavenue = Ccavenue::Payment.new(262578,'C3B38A390A1A32DBE9F8FF4C4D59D662','http://localhost:3000/payment_confirm')
  end
end

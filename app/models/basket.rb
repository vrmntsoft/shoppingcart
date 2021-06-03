class Basket < ApplicationRecord

  def tax_rate
    rate = 0.1

    if self.food_or_medical
      rate = 0.0
    else
      if self.imported
        rate += 0.05
      end
    end

    return rate

  end

end

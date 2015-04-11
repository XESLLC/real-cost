class Dog < ActiveRecord::Base
  belongs_to :user

  def cost
    breed = Breed.find(self.breed_id)
    life_item = breed.lifespan - self.age
    training_cost_month  =  ((1.00 / breed.training_factor) * 50).round(2)
    health_cost_month =  (breed.health_factor * 5).round(2)
    size_cost_month = ((self.weight/500.000) * 150).round(2)
    cost_month = size_cost_month + health_cost_month + training_cost_month
    @cost_hash = {lifespan: life_item, cost_month: cost_month, training_month: training_cost_month, health_month: health_cost_month, size_cost: size_cost_month}
  end

end

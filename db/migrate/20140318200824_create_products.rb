class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false

      t.timestamps
    end

    Sale.find_each do |sale|
      # create a new Product object
      # unless Product.exists?(name: sale.product_name)
      #   Product.create(name: sale.product_name)
      #   puts "Product #{sale.product_name} created!"
      # else
      #   puts "Product #{sale.product_name} already existed!"
      # end
      Product.find_or_create_by(name: sale.product_name)
    end
  end
end

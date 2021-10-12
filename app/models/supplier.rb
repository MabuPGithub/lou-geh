class Supplier < ApplicationRecord

    def self.unique_code(supplier_params)
        @supplier = Supplier.new(supplier_params)
        @supplier.unique_code = @supplier.name.delete("aeiouAEIOU")
        @supplier
    end
end

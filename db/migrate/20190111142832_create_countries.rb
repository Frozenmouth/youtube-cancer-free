class CountriesController < CountrySelect::FORMATS[:with_alpha2] = lambda do |country|
  def change
    create_table :country do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end  
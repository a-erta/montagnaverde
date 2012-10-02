# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Product.create(:title => 'Miele di castagno',
:description =>
%{<p>
Miele di castagno della Lunigiana
</p>},
:image_url => 'http://www.matrimonio.com/emp/fotos/5/7/3/5/miele%20e%20farina.jpg',
:price => 9.0)

Product.create(:title => 'Miele di acacia',
:description =>
%{<p>
Miele di acacia della Lunigiana
</p>},
:image_url => 'http://www.matrimonio.com/emp/fotos/5/7/3/5/miele%20e%20farina.jpg',
:price => 7.0)
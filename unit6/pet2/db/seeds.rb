# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Animal.delete_all
Animal.create!(name: 'Thumper',
  description: 
    %{<p>
        Thumper is a big fun loving rabbit. If you get to know him you'll never be alone.
      </p>},
  image_url:   'bunny.jpg',    
  age: 3)
# . . .
Animal.create!(name: 'Whiskers',
  description:
    %{<p>
        Whiskers is a young loveable kitten. Doesn't like children but has a soft spot for dogs.
      </p>},
  image_url: 'cat.jpg',
  age: 1)
# . . .
Animal.create!(name: 'Tucker',
  description: 
    %{<p>
        Tucker never gets tuckered out. He loves to run and play catch. He is loyal, loves cats, and wants a
        big family with kids to play with.
      </p>},
  image_url: 'dog.jpg',
  age: 4)
# . . .
Animal.create!(name: 'Wrinkly',
  description: 
    %{<p>
        Wrinkly is an old wise elephant. Not good for cities or apartments. Prefers a large back yard and warm weather.
        He is always down to play. Not good with other pets or children.
      </p>},
  image_url: 'elephant.jpg',
  age: 10)
# . . .

Animal.create!(name: 'Meowser',
  description: 
    %{<p>
        Meowser sure does meow. A very talkative cat will always let you know whats on his mind. Prefers to be a
        single cat doesn't not play well with other cats but fine with dogs.
      </p>},
  image_url: 'cat2.jpg',
  age: 6)
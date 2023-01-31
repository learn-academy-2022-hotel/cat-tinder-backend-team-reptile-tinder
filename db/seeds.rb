reptiles = [
    {
        name: 'Shakespeare',
        age: 7,
        enjoys: 'Eating crickets, a lot. Being pet on his little head. Adventuring',
        image: 'https://images.unsplash.com/photo-1619153832248-6458a856d91f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1931&q=80'
    },
    {
        name: 'Tamerin',
        age: 8,
        enjoys: 'Long walks on the beach. Basking under a heat lamp. Fruit cocktail',
        image: 'https://images.unsplash.com/photo-1666255791374-ca9c4c1fb09e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80'
    },
    {
        name: 'Snakey',
        age: 10,
        enjoys: 'Being cool and following the rules. Playing guitar. Making fun of Hannibal',
        image: 'https://static.wikia.nocookie.net/theericandreshow/images/c/ca/Bandicam_2018-10-07_01-00-15-415.jpg/revision/latest/scale-to-width-down/324?cb=20181007051730'
    },
    {
        name: 'Martin',
        age: 12,
        enjoys: 'Selling insurance. Driving his convertible. Giving boring advice about insurance.',
        image: 'https://static.wikia.nocookie.net/geicocarinsurance/images/3/34/Geico.jpg/revision/latest/scale-to-width-down/373?cb=20130923020840'
    }
]

reptiles.each do |each_reptile|
    Reptile.create each_reptile
    puts "creating reptile #{each_reptile}"
  end
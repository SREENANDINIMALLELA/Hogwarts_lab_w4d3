require_relative('../models/student')
require_relative('../models/house')


house1= House.new({
          'name' => 'Gryffindor',
          'url' => 'https://vignette.wikia.nocookie.net/harrypotter/images/b/b1/Gryffindor_ClearBG.png/revision/latest?cb=20190222162949'
          })
house2= House.new({
            'name' => 'Ravenclaw',
            'url' => 'https://vignette.wikia.nocookie.net/harrypotter/images/4/4e/RavenclawCrest.png/revision/latest?cb=20161020182442'
            })
house3= House.new({
              'name' => 'Hufflepuff',
              'url' => 'https://vignette.wikia.nocookie.net/harrypotter/images/0/06/Hufflepuff_ClearBG.png/revision/latest?cb=20161020182518'
              })
house4= House.new({
                'name' => 'slytherin',
                'url' => 'https://vignette.wikia.nocookie.net/harrypotter/images/0/00/Slytherin_ClearBG.png/revision/latest?cb=20161020182557'
                })
house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  'first_name' => 'hermione',
  'last_name' => 'granger',
  'house_id' => house1.id,
  'age' => 12 })
  student2 = Student.new({
    'first_name' => 'owen',
    'last_name' => 'cauldwell',
    'house_id' => house2.id,
    'age' => 13 })
    student3 = Student.new({
      'first_name' => 'roger',
      'last_name' => 'davies',
      'house_id' => house3.id,
      'age' => 14 })
      student4 = Student.new({
        'first_name' => 'severus',
        'last_name' => 'snape',
        'house_id' => house4.id,
        'age' => 37 })

        student1.save
        student2.save
        student3.save
        student4.save

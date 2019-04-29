# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

specialities = [
  { name: 'ALERGOLOGIA' },
  { name: 'ANGIOLOGIA' },
  { name: 'BUCO MAXILO' },
  { name: 'CARDIOLOGIA CLÍNICA' },
  { name: 'CARDIOLOGIA INFANTIL' },
  { name: 'CIRURGIA CABEÇA E PESCOÇO' },
  { name: 'CIRURGIA CARDÍACA' },
  { name: 'CIRURGIA DE TÓRAX' },
  { name: 'CIRURGIA GERAL' },
  { name: 'CIRURGIA PEDIÁTRICA' },
  { name: 'CIRURGIA PLÁSTICA' },
  { name: 'CIRURGIA TORÁCICA' },
  { name: 'CIRURGIA VASCULAR' },
  { name: 'CLÍNICA MÉDICA' }
]

Speciality.create(specialities)

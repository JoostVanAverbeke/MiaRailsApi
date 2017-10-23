# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
200.times do
  last_name = Faker::Name.last_name
  first_name = Faker::Name.first_name
  short_name = (last_name[0] + first_name[0]).upcase
  User.create({short_name: short_name, surname: last_name, first_name: first_name})
end

# Create Employees
employee_list = ['joostva', 'koenp', 'leenc', 'wimlz', 'woutercd', 'bartr', 'lievendf', 'lievenca', 'jans', 'yvesvw']
employee_list.each do |employee_name|
  Employee.create(name: employee_name)
end

# Create Projects and corresponding Job Times
project_list = [
    'G_ADT', 'G_HOML', 'G_HOUL', 'G_MDSC', 'J_LTW_OFPOM', 'GLIMS', 'MADE', 'MATE', 'MATE_JRBS',
    'J_LTW_OFORM', 'J_LCSD', 'JCE', 'G_XADT', 'G_STRE', 'G_SAGH']
random_generator = Random.new
project_list.each do |project_name|
  project = Project.create(name: "MIPS-#{project_name}Maintenance")
  Employee.all.each do |employee|
    JobTime.create(employee_id: employee.id, project_id: project.id,
                   corrective: random_generator.rand(1000),
                   functional: random_generator.rand(1000),
                   incidents: random_generator.rand(1000),
                   other: random_generator.rand(1000)
    )
  end
end



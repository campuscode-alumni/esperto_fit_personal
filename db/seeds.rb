# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Unit.load_api
#First set of customers, personals and schedules
unit = Unit.first
customer_acc = Account.create(document: '12345678900', email: 'customer@email.com', password: '123456', type: 'Customer', unit: unit)
personal_acc = Account.create!(document: '12345678910', email: 'personal@email.com', password: '123456', type: 'Personal', unit: unit)

Enrollment.new(account: customer_acc, unit: unit)

customer_prof = Profile.create(account: customer_acc, first_name: 'Customer', last_name: 'Smith', address: 'Customer Street', date_of_birth: '01-01-1970', contact: '123-456-789', gender: 'male', nickname: 'CustomerNick', payment_method: 'Credito', plan: 1)
personal_prof = Profile.create(account: personal_acc, first_name: 'Personal', last_name: 'Smith', work_document: '123.456.789.10', address: 'Personal Street', date_of_birth: '01-01-1970', contact: '123-456-789', gender: 'male', nickname: 'PersonalNick', payment_method: 'Credito', plan: 2)

schedule = Schedule.create(date: '12/11/2020', price: '50', unit: unit, start: 10, finish: 13, personal: personal_acc)
schedule.create_appointments

#second set of customers, personals and schedules
other_unit = Unit.last
other_customer_acc = Account.create(document: '12345678900'.reverse, email: 'other_customer@email.com', password: '123456', type: 'Customer', unit: other_unit)
other_personal_acc = Account.create!(document: '12345678910'.reverse, email: 'other_personal@email.com', password: '123456', type: 'Personal', unit: other_unit)

Enrollment.new(account: other_customer_acc, unit: other_unit)

other_customer_prof = Profile.create(account: other_customer_acc, first_name: 'Customer'.reverse, last_name: 'Smith'.reverse, address: 'Customer Street'.reverse, date_of_birth: '12-12-1990', contact: '123-456-789'.reverse, gender: 'female', nickname: 'CustomerNick'.reverse, payment_method: 'Debito', plan: 1)
other_personal_prof = Profile.create(account: other_personal_acc, first_name: 'Personal'.reverse, last_name: 'Smith'.reverse, work_document: '123.456.789.20', address: 'Personal Street'.reverse, date_of_birth: '11-11-1975', contact: '123-456-789'.reverse, gender: 'female', nickname: 'PersonalNick'.reverse, payment_method: 'Debito', plan: 2)

other_schedule = Schedule.create(date: '12/11/2020', price: '50', unit: other_unit, start: 10, finish: 13, personal: other_personal_acc)
other_schedule.create_appointments
#Customer without Unit

no_unit_customer = Account.create(document: '12345670000', email: 'no_unit@email.com', password: '123456', type: 'Customer')
no_unit_prof = Profile.create(account: no_unit_customer, first_name: 'NoUnit', last_name: 'Person', address: 'NoUnit Street', date_of_birth: '01-01-1970', contact: '123-456-789', gender: 'male', nickname: 'IHaveNoUnitAndIMustTrain', payment_method: 'Credito', plan: 1)

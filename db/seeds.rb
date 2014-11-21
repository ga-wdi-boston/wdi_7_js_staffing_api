# clear all tables
ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'

  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

titles = Title.create([
	{ name: 'associate' },
	{ name: 'senior associate' },
	{ name: 'manager' },
	{ name: 'senior manager' },
	{ name: 'director' }
])

# curl -d "user[first_name]=Dan&user[last_name]=Johnson&user[password]=test&user[password_confirmation]=test" -X POST localhost:3000/users

# token used in requests - d4b6db6199e646ad984d96db25ddef61

# curl -d "user[first_name]=David&user[last_name]=Thomas&user[password]=test&user[password_confirmation]=test" -X POST localhost:3000/users

# token used in requests - 0ddaab06d641407f8724673c7fdcddfd

users = User.create([
	{ first_name: 'Dan', last_name: 'Johnson', role: 1, title: Title.find_by_name('manager'), password_digest: '$2a$10$5M0fkXWcq1Z/x8F.vjfseOc7AlmlmqejHiDCU/uHyh9YxLCDoB4nS', token: 'd4b6db6199e646ad984d96db25ddef61', email: 'dan@test.com' },
	{ first_name: 'David', last_name: 'Thomas', role: 1, title: Title.find_by_name('senior associate'), password_digest: '$2a$10$DtmZhaCFk64vCq2UiuEev.ZpAEcZP4216UBDQozwv5Enyv/.DYnXa', token: '0ddaab06d641407f8724673c7fdcddfd', email: 'david@test.com' }
])

skills = Skill.create([
	{ name: 'HTML' },
	{ name: 'CSS' },
	{ name: 'JavaScript' },
	{ name: 'PHP' }
])

users[0].skills << Skill.find_by_name('HTML')
users[0].skills << Skill.find_by_name('CSS')
users[1].skills << Skill.find_by_name('JavaScript')

projects = Project.create([
	{ name: 'Wordpress Theme' },
	{ name: 'AngularJS Application' },
	{ name: 'Backbone.js Application' }
])

staffing_requests = StaffingRequest.create([
	{ project: Project.find_by_name('Wordpress Theme'), title: Title.find_by_name('senior associate'), percentage: 100, start_date: DateTime.new(2015,1,1), end_date: DateTime.new(2015,2,1), status: 0 },
	{ project: Project.find_by_name('AngularJS Application'), title: Title.find_by_name('manager'), percentage: 50, start_date: DateTime.new(2015,1,1), status: 0 },
	{ project: Project.find_by_name('AngularJS Application'), title: Title.find_by_name('associate'), percentage: 100, start_date: DateTime.new(2015,1,1), status: 0 },
	{ project: Project.find_by_name('Backbone.js Application'), title: Title.find_by_name('senior associate'), percentage: 100, start_date: DateTime.new(2015,1,1), status: 1 }
])

staffing_requests[0].skills << Skill.find_by_name('HTML')
staffing_requests[0].skills << Skill.find_by_name('CSS')
staffing_requests[0].skills << Skill.find_by_name('PHP')
staffing_requests[1].skills << Skill.find_by_name('JavaScript')

allocations = Allocation.create([
	{ user: users[1], staffing_request: staffing_requests[0]}
])

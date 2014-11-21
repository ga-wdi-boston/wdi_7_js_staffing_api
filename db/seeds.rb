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

users = User.create([
	{ first_name: 'Dan', last_name: 'Johnson', role: 1, title: Title.find_by_name('manager'), password_digest: '$2a$10$sKRAY9uoRn2kjo73pmiJ/Oe9FvvUF1banbmEN4z6CMRSyvr6CNRmq', token: '46f83a3f8c04c5ae39eb2276b474ceab', email: 'dan@test.com' },
	{ first_name: 'David', last_name: 'Thomas', role: 1, title: Title.find_by_name('senior associate'), password_digest: '$2a$10$AKSi4TZ5AEP867jQYWek..WndQ75Px9F8dtxe6kppKZQlO.IWgJ8u', token: '8071034926c6651e661859be9475cb04', email: 'david@test.com' }
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

require 'environment'

desc "Create test data for the app"
task :create_test_data => [ "db:migrate" ] do
  room_101 = Room.create( :name => "Room 101" )
  room_102 = Room.create( :name => "Room 102" )
  room_103 = Room.create( :name => "Room 103" )
  room_104 = Room.create( :name => "Room 104" )

  Talk.create(  :name         => "Writing iPhone apps for Fun and Profit",
                :start_time   => "09:00",
                :end_time     => "10:00",
                :room         => room_101,
                :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

  Talk.create(  :name         => "Jailbreaking iPhones",
                :start_time   => "10:00",
                :end_time     => "11:00",
                :room         => room_101,
                :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

  Talk.create(  :name         => "Developing with Java",
                :start_time   => "09:00",
                :end_time     => "10:00",
                :room         => room_102,
                :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

  Talk.create(  :name         => "Developing with Java",
                :start_time   => "09:00",
                :end_time     => "10:00",
                :room         => room_102,
                :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

  Talk.create(  :name         => "Developing with C++",
                :start_time   => "10:00",
                :end_time     => "11:00",
                :room         => room_102,
                :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

  Talk.create(  :name         => "Developing with .NET",
                :start_time   => "11:00",
                :end_time     => "12:00",
                :room         => room_102,
                :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

  Talk.create(  :name         => "Developing with Python",
                :start_time   => "13:00",
                :end_time     => "14:00",
                :room         => room_102,
                :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

  Talk.create(  :name         => "Developing with Django",
                :start_time   => "14:00",
                :end_time     => "15:00",
                :room         => room_102,
                :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

  Talk.create(  :name         => "Developing with ColdFusion",
                :start_time   => "15:00",
                :end_time     => "16:00",
                :room         => room_102,
                :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")

  Talk.create(  :name         => "Developing with JavaScript",
                :start_time   => "16:00",
                :end_time     => "17:00",
                :room         => room_102,
                :description  => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")


  Sponsor.create( :name     => "Google",
                  :homepage => "http://google.com",
                  :level    => "Platinum",
                  :logo_url => "http://www.google.com/logos/olympics08_rowing.gif" )

  Sponsor.create( :name     => "RDM",
                  :homepage => "http://realdigitalmedia.com",
                  :level    => "gold",
                  :logo_url => "http://realdigitalmedia.com/images/logo_rdm2.jpg" )

end

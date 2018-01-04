# output generic information about the core and buildtype chosen
message("")
message("* BattleCore rev.: ${rev_id_str} (${rev_hash_str})")
message("* BattleCore rev. date: ${rev_date_str}")
if( UNIX )
  message("* TrinityCore buildtype  : ${CMAKE_BUILD_TYPE}")
endif()
message("")

# output information about installation-directories and locations

message("* Install core to        : ${CMAKE_INSTALL_PREFIX}")
if( UNIX )
  message("* Install libraries to   : ${LIBSDIR}")
  message("* Install configs to     : ${CONF_DIR}")
endif()
message("")

# Show infomation about the options selected during configuration

if( SERVERS )
  message("* Build world/auth       : Yes (default)")
else()
  message("* Build world/authserver : No")
endif()

if( SCRIPTS )
  message("* Build with scripts     : Yes (default)")
  add_definitions(-DSCRIPTS)
else()
  message("* Build with scripts     : No")
endif()

if( TOOLS )
  message("* Build map/vmap tools   : Yes")
  add_definitions(-DNO_CORE_FUNCS)
else()
  message("* Build map/vmap tools   : No  (default)")
endif()

if( USE_COREPCH )
  message("* Build core w/PCH       : Yes (default)")
else()
  message("* Build core w/PCH       : No")
endif()

if( USE_SCRIPTPCH )
  message("* Build scripts w/PCH    : Yes (default)")
else()
  message("* Build scripts w/PCH    : No")
endif()

if( WITH_WARNINGS )
  message("* Show all warnings      : Yes")
else()
  message("* Show compile-warnings  : No  (default)")
endif()

if( WITH_COREDEBUG )
  message("* Use coreside debug     : Yes")
  add_definitions(-DTRINITY_DEBUG)
else()
  message("* Use coreside debug     : No  (default)")
endif()

if ( NOJEM )
  message("")
  message(" *** NOJEM - WARNING!")
  message(" *** jemalloc linking has been disabled!")
  message(" *** Please note that this is for DEBUGGING WITH VALGRIND only!")
  message(" *** DO NOT DISABLE IT UNLESS YOU KNOW WHAT YOU'RE DOING!")
endif()

if ( HELGRIND )
  message("")
  message(" *** HELGRIND - WARNING!")
  message(" *** Please specify the valgrind include directory in VALGRIND_INCLUDE_DIR option if you get build errors")
  message(" *** Please note that this is for DEBUGGING WITH HELGRIND only!")
  add_definitions(-DHELGRIND)
endif()

message("")


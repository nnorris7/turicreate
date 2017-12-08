include(RunCMake)

function(external_command_test NAME)
  run_cmake_command(${NAME} ${CMAKE_COMMAND} -E ${ARGN})
endfunction()

external_command_test(bad-opt1   tar cvf bad.tar --bad)
external_command_test(bad-mtime1 tar cvf bad.tar --mtime=bad .)
external_command_test(bad-from1  tar cvf bad.tar --files-from=bad)
external_command_test(bad-from2  tar cvf bad.tar --files-from=.)
external_command_test(bad-from3  tar cvf bad.tar --files-from=${CMAKE_CURRENT_LIST_DIR}/bad-from3.txt)
external_command_test(bad-from4  tar cvf bad.tar --files-from=${CMAKE_CURRENT_LIST_DIR}/bad-from4.txt)
external_command_test(bad-from5  tar cvf bad.tar --files-from=${CMAKE_CURRENT_LIST_DIR}/bad-from5.txt)
external_command_test(end-opt1   tar cvf bad.tar -- --bad)
external_command_test(end-opt2   tar cvf bad.tar --)
external_command_test(mtime      tar cvf bad.tar "--mtime=1970-01-01 00:00:00 UTC")
external_command_test(bad-format tar cvf bad.tar "--format=bad-format")
external_command_test(zip-bz2    tar cvjf bad.tar "--format=zip")
external_command_test(7zip-gz    tar cvzf bad.tar "--format=7zip")

run_cmake(7zip)
run_cmake(gnutar)
run_cmake(gnutar-gz)
run_cmake(pax)
run_cmake(pax-xz)
run_cmake(paxr)
run_cmake(paxr-bz2)
run_cmake(zip)
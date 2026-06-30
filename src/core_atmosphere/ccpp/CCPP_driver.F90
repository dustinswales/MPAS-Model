module CCPP_driver
  use mpas_ccpp_cap,      only: ccpp_register,               &
                                ccpp_init,                   &
                                ccpp_physics_init,           &
                                ccpp_physics_timestep_init,  &
                                ccpp_physics_run,            &
                                ccpp_physics_timestep_final, &
                                ccpp_physics_final,          &
                                ccpp_final
  use iso_fortran_env,    only: error_unit
  implicit none

  integer :: mythread
  integer :: nthreads
  integer :: nphys_threads
  integer :: lb
  integer :: ub
  integer :: errflg
  character(len=512) :: errmsg
  character(len=256) :: ccpp_suite='undefined'
  character(len=256) :: group_name='undefined'

  public ccpp_step
contains

  subroutine ccpp_step(step)
    character(len=*), intent(in)  :: step

    ! CCPP Register phase
    if (trim(step)=="register") then
       call ccpp_register(ccpp_suite=trim(ccpp_suite), errmsg=errmsg, errflg=errflg)
       if (errflg/=0) then
          write(error_unit,'(a,i0,a)') 'An error occurred in ccpp_register: ' // trim(errmsg) // '. Exiting...'
          return
       end if
    ! CCPP Init phase
    else if (trim(step)=="init") then
       call ccpp_init(ccpp_suite=trim(ccpp_suite), errmsg=errmsg, errflg=errflg)
       if (errflg/=0) then
          write(error_unit,'(a,i0,a)') 'An error occurred in ccpp_init: ' // trim(errmsg) // '. Exiting...'
          return
       end if
    ! CCPP Physics init
    else if (trim(step)=="physics_init") then
       call ccpp_physics_init( ccpp_suite=trim(ccpp_suite), group_name='all', &
            errmsg=errmsg, errflg=errflg, lb=1, ub=1,         &
            mythread=1, nthreads=1, nphys_threads=1)
       if (errflg/=0) then
          write(error_unit,'(a,i0,a)') 'An error occurred in ccpp_physics_init: ' // trim(errmsg) // '. Exiting...'
          return
       end if
    else if (trim(step)=="timestep_init") then
       call ccpp_physics_timestep_init(ccpp_suite=trim(ccpp_suite), group_name='all', &
            errmsg=errmsg, errflg=errflg, lb=1, ub=1,         &
            mythread=1, nthreads=1, nphys_threads=1)
       if (errflg/=0) then
          write(error_unit,'(a,i0,a)') 'An error occurred in ccpp_physics_timestep_init for group time_vary: ' // trim(errmsg) // '. Exiting...'
          return
       end if
    else if (trim(step)=="radiation" .or. trim(step)=="physics") then
       call ccpp_physics_run(ccpp_suite=trim(ccpp_suite), group_name="physics", &
            errmsg=errmsg, errflg=errflg, lb=1, ub=1, &
            mythread=1, nthreads=1, nphys_threads=1)
       if (errflg/=0) then
          write(error_unit,'(a,i0,a)') 'An error occurred in ccpp_physics_run for group physics: ' // trim(errmsg) // '. Exiting...'
          return
       endif
    else if (trim(step)=="timestep_final") then
       call ccpp_physics_timestep_final(ccpp_suite=trim(ccpp_suite), group_name="all", &
            errmsg=errmsg, errflg=errflg, lb=1, ub=1,         &
            mythread=1, nthreads=1, nphys_threads=1)
       if (errflg/=0) then
          write(error_unit,'(a,i0,a)') 'An error occurred in ccpp_physics_timestep_final group time_vary: ' // trim(errmsg) // '. Exiting...'
          return
       end if
    else if (trim(step)=="physics_final") then
       call ccpp_physics_final(ccpp_suite=trim(ccpp_suite), group_name='all', &
            errmsg=errmsg, errflg=errflg, lb=1, ub=1,         &
            mythread=1, nthreads=1, nphys_threads=1)
       if (errflg/=0) then
          write(error_unit,'(a,i0,a)') 'An error occurred in ccpp_physics_final: ' // trim(errmsg) // '. Exiting...'
          return
       end if
    else if (trim(step)=="final") then
       call ccpp_final(ccpp_suite=trim(ccpp_suite), errmsg=errmsg, errflg=errflg)
       if (errflg/=0) then
          write(error_unit,'(a,i0,a)') 'An error occurred in ccpp_final: ' // trim(errmsg) // '. Exiting...'
          return
       end if
    else
       write(error_unit,'(2a)') 'Error, undefined CCPP step ', trim(step)
       return
    end if
    
  end subroutine ccpp_step

end module CCPP_driver

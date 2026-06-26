module CCPP_driver
  use mpas_ccpp_cap,      only: ccpp_register,               &
                                ccpp_init,                   &
                                ccpp_physics_init,           &
                                ccpp_physics_timestep_init,  &
                                ccpp_physics_run,            &
                                ccpp_physics_timestep_final, &
                                ccpp_physics_final,          &
                                ccpp_final

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

  public CCPP_step
contains

  subroutine CCPP_step(step)
    character(len=*), intent(in)  :: step

  end subroutine CCPP_step

end module CCPP_driver

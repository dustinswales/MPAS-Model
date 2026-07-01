! ###########################################################################################
!> \file MPAS_typedefs.F90
! ########################################################################################### 
module MPAS_typedefs
  use mpi_f08
  use ccpp_wp, only: kind_phys, kind_dbl_prec, kind_sngl_prec
  implicit none

!> \section arg_table_MPAS_typedefs
!! \htmlinclude MPAS_typedefs.html
!!

  ! Control variables
  real (kind=kind_phys) :: dtp
  logical               :: tte_edmf
  logical               :: dspheat
  logical               :: sa3dtke
  real (kind=kind_phys) :: xkzm_m
  real (kind=kind_phys) :: xkzm_h
  real (kind=kind_phys) :: xkzm_s
  real (kind=kind_phys) :: dspfac
  real (kind=kind_phys) :: bl_upfr
  real (kind=kind_phys) :: bl_dnfr
  real (kind=kind_phys) :: rlmx
  real (kind=kind_phys) :: elmx
  logical               :: do_canopy
  logical               :: cplaqm
  integer               :: sfc_rlm
  integer               :: tc_pbl
  integer               :: use_lpt

  ! Control variable that we shouldn't have in MPAS
  logical :: ldiag3d
  integer, pointer :: dtidx(:,:) => null()
  integer :: ndtend
  real (kind=kind_phys), pointer :: dtend(:,:,:) => null()
  integer :: ntracp100
  integer :: nprocess
  logical :: flag_for_pbl_generic_tend

  ! Dimensions
  integer              :: ncols           !< total number of columns
  integer              :: nlays           !< number of vertical layers
  integer              :: ntrac           !< number of tracers
  integer              :: nlevs           !< number of vertical levels
  
  ! Grid information
  real (kind=kind_phys), pointer :: garea (:) => null()

  ! Surface
  real (kind=kind_phys), pointer :: zorl (:)  => null()
  real (kind=kind_phys), pointer :: tsfc (:)  => null()
  real (kind=kind_phys), pointer :: evap (:)  => null()
  real (kind=kind_phys), pointer :: dkt  (:,:) => null()
  real (kind=kind_phys), pointer :: dku  (:,:) => null()

  ! Diagnostics
  real (kind=kind_phys), pointer :: u10m (:)  => null()
  real (kind=kind_phys), pointer :: v10m (:)  => null()
  real (kind=kind_phys), pointer :: claie(:)  => null()
  real (kind=kind_phys), pointer :: cfch (:)  => null()
  real (kind=kind_phys), pointer :: cfrt (:)  => null() 
  real (kind=kind_phys), pointer :: cclu (:)  => null()
  real (kind=kind_phys), pointer :: cpopu(:)  => null()

  ! PBL 
  ! Vertically diffused tracer indices
  integer              :: nvdiff          !< number of vertically diffused tracers
  integer              :: rtg_ozone_index !< index for ozone in vertically diffused tracer array
  logical              :: satmedmf        !<
  integer              :: isatmedmf       !<
  integer              :: isatmedmf_vdifq !<

  ! Tracer indices
  integer              :: ntqv
  integer              :: ntcw
  integer              :: ntiw
  integer              :: ntrw
  integer              :: ntsw
  integer              :: ntlnc
  integer              :: ntinc
  integer              :: ntrnc
  integer              :: ntwa
  integer              :: ntia
  integer              :: ntgl
  integer              :: ntoz

  ! Microphysics control switches
  integer              :: imp_physics
  integer              :: imp_physics_thompson

  ! Thompson MP aerosol coupling flags
  logical              :: ltaerosol
  logical              :: mraerosol

  ! Prognostic state variables
  real (kind=kind_phys), pointer :: gq0 (:,:,:)     => null()  !< updated tracers
  real (kind=kind_phys), pointer :: gu0 (:,:)       => null()  !< updated zonal wind
  real (kind=kind_phys), pointer :: gv0 (:,:)       => null()  !< updated meridional wind
  real (kind=kind_phys), pointer :: gt0 (:,:)       => null()  !< updated temperature
  real (kind=kind_phys), pointer :: phii  (:,:) => null()   !< interface geopotential height
  real (kind=kind_phys), pointer :: prsi  (:,:) => null()   !< model level pressure in Pa
  real (kind=kind_phys), pointer :: prsik (:,:) => null()   !< Exner function at interface
  real (kind=kind_phys), pointer :: phil  (:,:) => null()   !< layer geopotential height
  real (kind=kind_phys), pointer :: prsl  (:,:) => null()   !< model layer mean pressure Pa
  real (kind=kind_phys), pointer :: prslk (:,:) => null()   !< exner function = (p/p0)**rocp
  
  ! TKE-EDMF PBL
  real (kind=kind_phys), pointer :: vdftra (:,:,:)  => null()  !< tracer concentration diffused by PBL scheme
  real (kind=kind_phys), pointer :: dvdftra (:,:,:) => null()
  integer              :: ntcw_vd
  integer              :: ntrw_vd
  integer              :: ntiw_vd
  integer              :: ntke_vd

  ! PBL
  real (kind=kind_phys), pointer :: fm (:)     => null()
  real (kind=kind_phys), pointer :: fh (:)     => null()
  ! SA-3D-TKE
  real (kind=kind_phys), pointer :: def_1 (:,:)   => null()  !< deformation
  real (kind=kind_phys), pointer :: def_2 (:,:)   => null()  !< deformation
  real (kind=kind_phys), pointer :: def_3 (:,:)   => null()  !< deformation

  ! TKE-EDMF PBL coupled to ocean
  logical              :: use_oceanuv
  real (kind=kind_phys), pointer :: usfco (:)     => null()
  real (kind=kind_phys), pointer :: vsfco (:)     => null()

  ! Radiation
  real (kind=kind_phys), pointer :: htrsw (:,:)   => null()  !< total sky sw heating rate in k/sec
  real (kind=kind_phys), pointer :: htrlw (:,:)   => null()  !< total sky lw heating rate in k/sec
  real (kind=kind_phys), pointer :: xmu   (:)     => null()

  ! SUITE VARIABLES (WILL GO AWAY WITH FULL COUPLING)
  real (kind=kind_phys), pointer :: zvfun (:)     => null()
  real (kind=kind_phys), pointer :: sigmaf (:)    => null()
  real (kind=kind_phys), pointer :: rbsoil (:)    => null()
  real (kind=kind_phys), pointer :: hflxq (:)     => null()
  real (kind=kind_phys), pointer :: spd1  (:)     => null()
  real (kind=kind_phys), pointer :: stress(:)     => null()
  integer,               pointer :: kpbl (:)      => null()
  real (kind=kind_phys), pointer :: del (:,:)     => null()
  real (kind=kind_phys), pointer :: dusfc1 (:)    => null()
  real (kind=kind_phys), pointer :: dvsfc1 (:)    => null()
  real (kind=kind_phys), pointer :: dtsfc1 (:)    => null()
  real (kind=kind_phys), pointer :: dqsfc1 (:)    => null()
  real (kind=kind_phys), pointer :: tkeh (:,:)    => null()
contains

  ! Procedure to allocate CCPP physics state variables
  subroutine create_phys_state()
    ! Grid information
    if (.not. associated(garea))   allocate (garea (ncols))
    ! Surface
    if (.not. associated(zorl))    allocate (zorl (ncols))
    if (.not. associated(tsfc))    allocate (tsfc (ncols))
    if (.not. associated(evap))    allocate (evap (ncols))
    if (.not. associated(dkt))     allocate (dkt  (ncols,nlays))
    if (.not. associated(dku))     allocate (dku  (ncols,nlays))
    ! Diagnostics/Interstitials
    if (.not. associated(u10m))    allocate (u10m (ncols))
    if (.not. associated(v10m))	   allocate (v10m (ncols))
    if (.not. associated(claie))   allocate (claie (ncols))
    if (.not. associated(cfch))    allocate (cfch  (ncols))
    if (.not. associated(cfrt))    allocate (cfrt  (ncols))
    if (.not. associated(cclu))    allocate (cclu  (ncols))
    if (.not. associated(cpopu))   allocate (cpopu (ncols))
    
    ! Prognostic state variables
    if (.not. associated(gu0))     allocate (gu0 (ncols,nlays))
    if (.not. associated(gv0))     allocate (gv0 (ncols,nlays))
    if (.not. associated(gt0))     allocate (gt0 (ncols,nlays))
    if (.not. associated(gq0))     allocate (gq0 (ncols,nlays,ntrac))
    if (.not. associated(phii))    allocate (phii (ncols,nlevs))
    if (.not. associated(prsi))    allocate (prsi  (ncols,nlevs))
    if (.not. associated(prsik))   allocate (prsik (ncols,nlevs))
    if (.not. associated(phii))    allocate (phil (ncols,nlays))
    if (.not. associated(prsl))    allocate (prsl  (ncols,nlays))
    if (.not. associated(prslk))   allocate (prslk (ncols,nlays))
    
    ! TKE-EDMF PBL
    if (.not. associated(vdftra))  allocate (vdftra  (ncols,nlays,nvdiff))
    if (.not. associated(dvdftra)) allocate (dvdftra (ncols,nlays,nvdiff))
    ! TKE-EDMF PBL coupled to ocean
    if (.not. associated(usfco))   allocate (usfco   (ncols))
    if (.not. associated(vsfco))   allocate (vsfco   (ncols))
    ! PBL
    if (.not. associated(fm))      allocate (fm      (ncols))
    if (.not. associated(fh))      allocate (fh      (ncols))
    !SA-3D-TKE
    if (.not. associated(def_1))   allocate (def_1   (ncols,nlays))
    if (.not. associated(def_2))   allocate (def_2   (ncols,nlays))
    if (.not. associated(def_3))   allocate (def_3   (ncols,nlays))
    ! Radiation
    if (.not. associated(htrsw))   allocate (htrsw   (ncols,nlays))
    if (.not. associated(htrlw))   allocate (htrlw   (ncols,nlays))
    if (.not. associated(xmu))     allocate (xmu     (ncols))
    ! SUITE_VARS
    if (.not. associated(zvfun))   allocate (zvfun   (ncols))
    if (.not. associated(sigmaf))  allocate (sigmaf  (ncols))
    if (.not. associated(rbsoil))  allocate (rbsoil  (ncols))
    if (.not. associated(hflxq))   allocate (hflxq   (ncols))
    if (.not. associated(spd1))    allocate (spd1    (ncols))
    if (.not. associated(stress))  allocate (stress  (ncols))
    if (.not. associated(kpbl))    allocate (kpbl    (ncols))
    if (.not. associated(del))     allocate (del     (ncols,nlays))
    if (.not. associated(dusfc1))  allocate (dusfc1  (ncols))
    if (.not. associated(dvsfc1))  allocate (dvsfc1  (ncols))
    if (.not. associated(dtsfc1))  allocate (dtsfc1  (ncols))
    if (.not. associated(dqsfc1))  allocate (dqsfc1  (ncols))
    if (.not. associated(tkeh))    allocate (tkeh    (ncols,nlevs))
    ! future deprecated
    if (.not. associated(dtend))   allocate (dtend(ncols,nlevs,ndtend))
    if (.not. associated(dtidx))   allocate (dtidx(ncols,nlevs))
    call reset_phys_state()
  end subroutine create_phys_state
  
  ! Procedure to reeset CCPP physics state variables 
  subroutine reset_phys_state()
    !
    garea   = 0.0_kind_phys
    !
    zorl    = 0.0_kind_phys
    tsfc    = 0.0_kind_phys
    evap    = 0.0_kind_phys
    dkt     = 0.0_kind_phys
    dku     = 0.0_kind_phys
    !
    u10m    = 0.0_kind_phys
    v10m    = 0.0_kind_phys
    claie   = 0.0_kind_phys
    cfch    = 0.0_kind_phys
    cfrt    = 0.0_kind_phys
    cclu    = 0.0_kind_phys
    cpopu   = 0.0_kind_phys
    !
    gu0     = 0.0_kind_phys
    gv0     = 0.0_kind_phys
    gt0     = 0.0_kind_phys
    gq0     = 0.0_kind_phys
    phii    = 0.0_kind_phys
    prsi    = 0.0_kind_phys
    prsik   = 0.0_kind_phys
    phil    = 0.0_kind_phys
    prsl    = 0.0_kind_phys
    prslk   = 0.0_kind_phys
    !
    vdftra  = 0.0_kind_phys
    dvdftra = 0.0_kind_phys
    !
    usfco   = 0.0_kind_phys
    vsfco   = 0.0_kind_phys
    !
    fm      = 0.0_kind_phys
    fh      = 0.0_kind_phys
    !
    def_1   = 0.0_kind_phys
    def_2   = 0.0_kind_phys
    def_3   = 0.0_kind_phys
    !
    htrsw   = 0.0_kind_phys
    htrlw   = 0.0_kind_phys
    xmu     = 0.0_kind_phys
    !
    zvfun   = 0.0_kind_phys
    sigmaf  = 0.0_kind_phys
    rbsoil  = 0.0_kind_phys
    hflxq   = 0.0_kind_phys
    spd1    = 0.0_kind_phys
    stress  = 0.0_kind_phys
    kpbl    = 0.0_kind_phys
    del     = 0.0_kind_phys
    dusfc1  = 0.0_kind_phys
    dvsfc1  = 0.0_kind_phys
    dtsfc1  = 0.0_kind_phys
    dqsfc1  = 0.0_kind_phys
    tkeh    = 0.0_kind_phys
    !
    dtend   = 0.0_kind_phys
    dtidx   = 0.0_kind_phys
  end subroutine reset_phys_state
  
end module MPAS_typedefs

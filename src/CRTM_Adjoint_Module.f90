!
! CRTM_Adjoint_Module
!
! Module containing the CRTM adjoint model function.
!
!
! CREATION HISTORY:
!       Written by:     Paul van Delst, CIMSS/SSEC 28-Jan-2005
!                       paul.vandelst@ssec.wisc.edu
!

MODULE CRTM_Adjoint_Module


  ! ------------
  ! Module usage
  ! ------------
  USE Type_Kinds,               ONLY: fp
  USE Message_Handler,          ONLY: SUCCESS, FAILURE, WARNING, Display_Message
  USE CRTM_Parameters,          ONLY: SET, NOT_SET, ZERO, ONE, &
                                      MAX_N_PROFILES         , &
                                      MAX_N_ABSORBERS        , &
                                      MAX_N_PREDICTORS       , &
                                      MAX_N_PHASE_ELEMENTS   , &
                                      MAX_N_LEGENDRE_TERMS   , &
                                      MAX_N_STOKES           , &
                                      MAX_N_ANGLES
  USE CRTM_Atmosphere_Define,   ONLY: CRTM_Atmosphere_type
  USE CRTM_Surface_Define,      ONLY: CRTM_Surface_type
  USE CRTM_GeometryInfo_Define, ONLY: CRTM_GeometryInfo_type   , &
                                      CRTM_Compute_GeometryInfo
  USE CRTM_ChannelInfo_Define,  ONLY: CRTM_ChannelInfo_type
  USE CRTM_Options_Define,      ONLY: CRTM_Options_type
  USE CRTM_Predictor,           ONLY: CRTM_Predictor_type       , &
                                      CRTM_APVariables_type     , &
                                      CRTM_Allocate_Predictor   , &
                                      CRTM_Destroy_Predictor    , &
                                      CRTM_Compute_Predictors   , &
                                      CRTM_Compute_Predictors_AD
  USE CRTM_AtmAbsorption,       ONLY: CRTM_AtmAbsorption_type      , &
                                      CRTM_AAVariables_type        , &
                                      CRTM_Allocate_AtmAbsorption  , &
                                      CRTM_Destroy_AtmAbsorption   , &
                                      CRTM_Compute_AtmAbsorption   , &
                                      CRTM_Compute_AtmAbsorption_AD
  USE CRTM_AtmScatter_Define,   ONLY: CRTM_AtmScatter_type    , &
                                      CRTM_Allocate_AtmScatter, &
                                      CRTM_Destroy_AtmScatter
  USE CRTM_AerosolScatter,      ONLY: CRTM_ASVariables_type         , &
                                      CRTM_Compute_AerosolScatter   , &
                                      CRTM_Compute_AerosolScatter_AD
  USE CRTM_CloudScatter,        ONLY: CRTM_CSVariables_type       , &
                                      CRTM_Compute_CloudScatter   , &
                                      CRTM_Compute_CloudScatter_AD
  USE CRTM_AtmOptics,           ONLY: CRTM_AOVariables_type    , &
                                      CRTM_Combine_AtmOptics   , &
                                      CRTM_Combine_AtmOptics_AD
  USE CRTM_SfcOptics,           ONLY: CRTM_SfcOptics_type     , &
                                      CRTM_Allocate_SfcOptics , &
                                      CRTM_Destroy_SfcOptics  , &
                                      CRTM_Compute_SurfaceT   , &
                                      CRTM_Compute_SurfaceT_AD
  USE CRTM_RTSolution,          ONLY: CRTM_RTSolution_type      , &
                                      CRTM_RTVariables_type     , &
                                      CRTM_Compute_nStreams     , &
                                      CRTM_Compute_RTSolution   , &
                                      CRTM_Compute_RTSolution_AD


  ! -----------------------
  ! Disable implicit typing
  ! -----------------------
  IMPLICIT NONE


  ! ------------
  ! Visibilities
  ! ------------
  ! Everything private by default
  PRIVATE
  ! Public procedures
  PUBLIC :: CRTM_Adjoint


  ! -----------------
  ! Module parameters
  ! -----------------
  ! RCS Id for the module
  CHARACTER(*), PARAMETER :: MODULE_RCS_ID = &
  '$Id$'


CONTAINS


!--------------------------------------------------------------------------------
!
! NAME:
!       CRTM_Adjoint
!
! PURPOSE:
!       Function that calculates the adjoint of top-of-atmosphere (TOA)
!       radiances and brightness temperatures for an input atmospheric
!       profile or profile set and user specified satellites/channels.
!
! CALLING SEQUENCE:
!       Error_Status = CRTM_Adjoint( Atmosphere             , &  ! FWD Input
!                                    Surface                , &  ! FWD Input
!                                    RTSolution_AD          , &  ! AD  Input
!                                    GeometryInfo           , &  ! Input
!                                    ChannelInfo            , &  ! Input
!                                    Atmosphere_AD          , &  ! AD  Output
!                                    Surface_AD             , &  ! AD  Output
!                                    RTSolution             , &  ! FWD Output
!                                    Options    =Options    , &  ! Optional FWD input
!                                    RCS_Id     =RCS_Id     , &  ! Revision control
!                                    Message_Log=Message_Log  )  ! Error messaging
!
! INPUT ARGUMENTS:
!       Atmosphere:     Structure containing the Atmosphere data.
!                       UNITS:      N/A
!                       TYPE:       TYPE(CRTM_Atmosphere_type)
!                       DIMENSION:  Rank-1 (nProfiles)
!                       ATTRIBUTES: INTENT(IN)
!
!       Surface:        Structure containing the Surface data.
!                       UNITS:      N/A
!                       TYPE:       TYPE(CRTM_Surface_type)
!                       DIMENSION:  Same as input Atmosphere structure
!                       ATTRIBUTES: INTENT(IN)
!
!       RTSolution_AD:  Structure containing the RT solution adjoint inputs.
!                       **NOTE: On EXIT from this function, the contents of
!                               this structure may be modified (e.g. set to
!                               zero.)
!                       UNITS:      N/A
!                       TYPE:       TYPE(CRTM_RTSolution_type)
!                       DIMENSION:  Rank-2 (nChannels x nProfiles)
!                       ATTRIBUTES: INTENT(IN OUT)
!
!       GeometryInfo:   Structure containing the view geometry
!                       information.
!                       UNITS:      N/A
!                       TYPE:       TYPE(CRTM_GeometryInfo_type)
!                       DIMENSION:  Same as input Atmosphere argument
!                       ATTRIBUTES: INTENT(IN)
!
!       ChannelInfo:    Structure returned from the CRTM_Init() function
!                       that contains the satellite/sensor channel index
!                       information.
!                       UNITS:      N/A
!                       TYPE:       TYPE(CRTM_ChannelInfo_type)
!                       DIMENSION:  Rank-1 (nSensors)
!                       ATTRIBUTES: INTENT(IN)
!
! OPTIONAL INPUT ARGUMENTS:
!       Options:        Options structure containing the optional forward model
!                       arguments for the CRTM.
!                       UNITS:      N/A
!                       TYPE:       TYPE(CRTM_Options_type)
!                       DIMENSION:  Same as input Atmosphere structure
!                       ATTRIBUTES: INTENT(IN), OPTIONAL
!
!       Message_Log:    Character string specifying a filename in which any
!                       messages will be logged. If not specified, or if an
!                       error occurs opening the log file, the default action
!                       is to output messages to the screen.
!                       UNITS:      N/A
!                       TYPE:       CHARACTER(*)
!                       DIMENSION:  Scalar
!                       ATTRIBUTES: INTENT(IN), OPTIONAL
!
! OUTPUT ARGUMENTS:
!       Atmosphere_AD:  Structure containing the adjoint Atmosphere data.
!                       **NOTE: On ENTRY to this function, the contents of
!                               this structure should be defined (e.g.
!                               initialized to some value based on the
!                               position of this function in the call chain.)
!                       UNITS:      N/A
!                       TYPE:       TYPE(CRTM_Atmosphere_type)
!                       DIMENSION:  Same as input Atmosphere argument
!                       ATTRIBUTES: INTENT(IN OUT)
!
!       Surface_AD:     Structure containing the tangent-linear Surface data.
!                       **NOTE: On ENTRY to this function, the contents of
!                               this structure should be defined (e.g.
!                               initialized to some value based on the
!                               position of this function in the call chain.)
!                       UNITS:      N/A
!                       TYPE:       TYPE(CRTM_Surface_type)
!                       DIMENSION:  Same as input Atmosphere argument
!                       ATTRIBUTES: INTENT(IN OUT)
!
!       RTSolution:     Structure containing the solution to the RT equation
!                       for the given inputs.
!                       UNITS:      N/A
!                       TYPE:       TYPE(CRTM_RTSolution_type)
!                       DIMENSION:  Same as input RTSolution_AD argument
!                       ATTRIBUTES: INTENT(IN OUT)
!
! OPTIONAL OUTPUT ARGUMENTS:
!       RCS_Id:         Character string containing the Revision Control
!                       System Id field for the module.
!                       UNITS:      N/A
!                       TYPE:       CHARACTER(*)
!                       DIMENSION:  Scalar
!                       ATTRIBUTES: INTENT(OUT), OPTIONAL
!
! FUNCTION RESULT:
!       Error_Status:   The return value is an integer defining the error status.
!                       The error codes are defined in the Message_Handler module.
!                       If == SUCCESS the computation was sucessful
!                          == FAILURE an unrecoverable error occurred
!                       UNITS:      N/A
!                       TYPE:       INTEGER
!                       DIMENSION:  Scalar
!
! SIDE EFFECTS:
!      Note that the input adjoint arguments are modified upon exit, and
!      the output adjoint arguments must be defined upon entry. This is
!      a consequence of the adjoint formulation where, effectively, the
!      chain rule is being used and this function could reside anywhere
!      in the chain of derivative terms.
!
! COMMENTS:
!       - The Options optional structure arguments contain
!         spectral information (e.g. emissivity) that must have the same
!         spectral dimensionality (the "L" dimension) as the RTSolution
!         structures.
!
!       - The INTENT on the output RTSolution, Atmosphere_AD, and
!         Surface_AD arguments are IN OUT rather than just OUT. This is
!         necessary because the arguments should be defined upon input.
!         To prevent memory leaks, the IN OUT INTENT is a must.
!
!--------------------------------------------------------------------------------

  FUNCTION CRTM_Adjoint( Atmosphere   , &  ! FWD Input, M
                         Surface      , &  ! FWD Input, M
                         RTSolution_AD, &  ! AD  Input, L x M   
                         GeometryInfo , &  ! Input, M
                         ChannelInfo  , &  ! Input, Scalar  
                         Atmosphere_AD, &  ! AD  Output, M
                         Surface_AD   , &  ! AD  Output, M
                         RTSolution   , &  ! FWD Output, L x M
                         Options      , &  ! Optional FWD input,  M
                         RCS_Id       , &  ! Revision control
                         Message_Log  ) &  ! Error messaging
                       RESULT( Error_Status )
    ! Arguments
    TYPE(CRTM_Atmosphere_type)       , INTENT(IN)     :: Atmosphere(:)      ! M
    TYPE(CRTM_Surface_type)          , INTENT(IN)     :: Surface(:)         ! M
    TYPE(CRTM_RTSolution_type)       , INTENT(IN OUT) :: RTSolution_AD(:,:) ! L x M
    TYPE(CRTM_GeometryInfo_type)     , INTENT(IN OUT) :: GeometryInfo(:)    ! M
    TYPE(CRTM_ChannelInfo_type)      , INTENT(IN)     :: ChannelInfo(:)     ! nSensors
    TYPE(CRTM_Atmosphere_type)       , INTENT(IN OUT) :: Atmosphere_AD(:)   ! M
    TYPE(CRTM_Surface_type)          , INTENT(IN OUT) :: Surface_AD(:)      ! M
    TYPE(CRTM_RTSolution_type)       , INTENT(IN OUT) :: RTSolution(:,:)    ! L x M
    TYPE(CRTM_Options_type), OPTIONAL, INTENT(IN)     :: Options(:)         ! M
    CHARACTER(*),            OPTIONAL, INTENT(OUT)    :: RCS_Id
    CHARACTER(*),            OPTIONAL, INTENT(IN)     :: Message_Log
    ! Function result
    INTEGER :: Error_Status
    ! Local parameters
    CHARACTER(*), PARAMETER :: ROUTINE_NAME = 'CRTM_Adjoint'
    ! Local variables
    CHARACTER(256) :: Message
    LOGICAL :: Options_Present
    LOGICAL :: User_Emissivity
    LOGICAL :: User_Direct_Reflectivity
    INTEGER :: n, nSensors,  SensorIndex
    INTEGER :: l, nChannels, ChannelIndex
    INTEGER :: m, nProfiles
    INTEGER :: ln
    INTEGER :: n_Full_Streams, n_Layers
    INTEGER, DIMENSION(6) :: AllocStatus, AllocStatus_AD
    ! Component variables
    TYPE(CRTM_Predictor_type)     :: Predictor     , Predictor_AD
    TYPE(CRTM_AtmAbsorption_type) :: AtmAbsorption , AtmAbsorption_AD
    TYPE(CRTM_AtmScatter_type)    :: AerosolScatter, AerosolScatter_AD
    TYPE(CRTM_AtmScatter_type)    :: CloudScatter  , CloudScatter_AD
    TYPE(CRTM_AtmScatter_type)    :: AtmOptics     , AtmOptics_AD 
    TYPE(CRTM_SfcOPtics_type)     :: SfcOptics     , SfcOptics_AD
    ! Component variable internals
    TYPE(CRTM_APVariables_type) :: APV  ! Predictor
    TYPE(CRTM_AAVariables_type) :: AAV  ! AtmAbsorption
    TYPE(CRTM_CSVariables_type) :: CSV  ! CloudScatter
    TYPE(CRTM_ASVariables_type) :: ASV  ! AerosolScatter
    TYPE(CRTM_AOVariables_type) :: AOV  ! AtmOptics
    TYPE(CRTM_RTVariables_type) :: RTV  ! RTSolution


    ! ------
    ! Set up
    ! ------
    Error_Status = SUCCESS
    IF ( PRESENT( RCS_Id ) ) RCS_Id = MODULE_RCS_ID


    ! ----------------------------------------
    ! If no sensors or channels, simply return
    ! ----------------------------------------
    nSensors  = SIZE(ChannelInfo)
    nChannels = SUM(ChannelInfo%n_Channels)
    IF ( nSensors == 0 .OR. nChannels == 0 ) RETURN


    ! ---------------------------
    ! RTSolution arrays too small
    ! ---------------------------
    IF ( SIZE(RTSolution   ,DIM=1) < nChannels .OR. &
         SIZE(RTSolution_AD,DIM=1) < nChannels      ) THEN
      Error_Status = FAILURE
      WRITE(Message,'("RTSolution structure arrays too small (",i0," and ",i0,&
                     &") for the number of requested channels (",i0,")")') &
                     SIZE(RTSolution,DIM=1), SIZE(RTSolution_AD,DIM=1), nChannels
      CALL Display_Message( ROUTINE_NAME, &
                            TRIM(Message), &
                            Error_Status, &
                            Message_Log=Message_Log )
      RETURN
    END IF


    ! ----------------------------
    ! Check the number of profiles
    ! ----------------------------

    ! Number of atmospheric profiles.
    nProfiles = SIZE(Atmosphere)

    ! Check that the number of profiles is not greater than
    ! MAX_N_PROFILES. This is simply a limit to restrict the
    ! size of the input arrays so they're not TOO big.
    IF ( nProfiles > MAX_N_PROFILES ) THEN
      Error_Status = FAILURE
      WRITE(Message,'("Number of passed profiles (",i0,&
                     &") > maximum number of profiles allowed(",i0,")")') &
                    nProfiles, MAX_N_PROFILES
      CALL Display_Message( ROUTINE_NAME, &
                            TRIM(Message), &
                            Error_Status, &
                            Message_Log=Message_Log )
      RETURN
    END IF

    ! Check the profile dimensionality
    ! of the other mandatory arguments
    IF ( SIZE(Surface)             /= nProfiles .OR. &
         SIZE(RTSolution_AD,DIM=2) /= nProfiles .OR. &
         SIZE(GeometryInfo)        /= nProfiles .OR. &
         SIZE(Atmosphere_AD)       /= nProfiles .OR. &
         SIZE(Surface_AD)          /= nProfiles .OR. &
         SIZE(RTSolution,   DIM=2) /= nProfiles      ) THEN
      Error_Status = FAILURE
      CALL Display_Message( ROUTINE_NAME, &
                            'Inconsistent profile dimensionality for '//&
                            'input arguments.', &
                            Error_Status, &
                            Message_Log=Message_Log )
      RETURN
    END IF

    ! Check the profile dimensionality
    ! of the other optional arguments
    Options_Present = .FALSE.
    IF ( PRESENT(Options) ) THEN
      Options_Present = .TRUE.
      IF ( SIZE(Options) /= nProfiles ) THEN
        Error_Status = FAILURE
        CALL Display_Message( ROUTINE_NAME, &
                              'Inconsistent profile dimensionality for '//&
                              'Options optional input argument.', &
                              Error_Status, &
                              Message_Log=Message_Log )
        RETURN
      END IF
    END IF

 

    !#--------------------------------------------------------------------------#
    !#                           -- PROFILE LOOP --                             #
    !#--------------------------------------------------------------------------#
    Profile_Loop: DO m = 1, nProfiles


      ! ---------------------------------------------
      ! Check the optional Options structure argument
      ! ---------------------------------------------
      ! Default action is NOT to use user specified Options
      User_Emissivity = .FALSE.
      !.... other User_XXX flags as added.

      ! Check the Options argument
      IF (Options_Present) THEN

        ! Check if the supplied emissivity should be used
        IF ( Options(m)%Emissivity_Switch == SET ) THEN
          ! Are the channel dimensions consistent
          IF ( Options(m)%n_Channels < nChannels ) THEN
            Error_Status = FAILURE
            WRITE( Message, '( "Input Options channel dimension (", i0, ") is less ", &
                              &"than the number of requested channels (",i0, ")" )' ) &
                            Options(m)%n_Channels, nChannels
            CALL Display_Message( ROUTINE_NAME, &
                                  TRIM( Message ), &
                                  Error_Status, &
                                  Message_Log=Message_Log )
            RETURN
          END IF
          ! Set to use the supplied emissivity
          User_Emissivity = .TRUE.
          ! Check if the supplied direct reflectivity should be used
          User_Direct_Reflectivity = .FALSE.
          IF ( Options(m)%Direct_Reflectivity_Switch == SET ) User_Direct_Reflectivity = .TRUE.
        END IF
      END IF


      ! ------------------------
      ! Compute derived geometry
      ! ------------------------
      Error_Status = CRTM_Compute_GeometryInfo( GeometryInfo(m), &
                                                Message_Log=Message_Log )
      IF ( Error_Status /= SUCCESS ) THEN
        Error_Status = FAILURE
        CALL Display_Message( ROUTINE_NAME, &
                              'Error computing derived GeometryInfo components', &
                              Error_Status, &
                              Message_Log=Message_Log )
        RETURN
      END IF


      !#--------------------------------------------------------------------------#
      !#                     -- ALLOCATE ALL LOCAL STRUCTURES --                  #
      !#--------------------------------------------------------------------------#
      ! The Predictor and AtmAbsorption structures
      AllocStatus(1)   =CRTM_Allocate_Predictor( Atmosphere(m)%n_Layers , &  ! Input
                                                 MAX_N_PREDICTORS       , &  ! Input
                                                 MAX_N_ABSORBERS        , &  ! Input
                                                 Predictor              , &  ! Output
                                                 Message_Log=Message_Log  )  ! Error messaging
      AllocStatus_AD(1)=CRTM_Allocate_Predictor( Atmosphere(m)%n_Layers , &  ! Input
                                                 MAX_N_PREDICTORS       , &  ! Input
                                                 MAX_N_ABSORBERS        , &  ! Input
                                                 Predictor_AD           , &  ! Output
                                                 Message_Log=Message_Log  )  ! Error messaging
      AllocStatus(2)   =CRTM_Allocate_AtmAbsorption( Atmosphere(m)%n_Layers , &  ! Input
                                                     AtmAbsorption          , &  ! Output
                                                     Message_Log=Message_Log  )  ! Error messaging
      AllocStatus_AD(2)=CRTM_Allocate_AtmAbsorption( Atmosphere(m)%n_Layers , &  ! Input
                                                     AtmAbsorption_AD       , &  ! Output
                                                     Message_Log=Message_Log  )  ! Error messaging
      ! The CloudScatter structures
      AllocStatus(3)   =CRTM_Allocate_AtmScatter( Atmosphere(m)%n_Layers , &  ! Input
                                                  MAX_N_LEGENDRE_TERMS   , &  ! Input
                                                  MAX_N_PHASE_ELEMENTS   , &  ! Input
                                                  CloudScatter           , &  ! Output
                                                  Message_Log=Message_Log  )  ! Error messaging
      AllocStatus_AD(3)=CRTM_Allocate_AtmScatter( Atmosphere(m)%n_Layers , &  ! Input
                                                  MAX_N_LEGENDRE_TERMS   , &  ! Input
                                                  MAX_N_PHASE_ELEMENTS   , &  ! Input
                                                  CloudScatter_AD        , &  ! Output
                                                  Message_Log=Message_Log  )  ! Error messaging
      ! The AerosolScatter structures
      AllocStatus(4)   =CRTM_Allocate_AtmScatter( Atmosphere(m)%n_Layers , &  ! Input
                                                  MAX_N_LEGENDRE_TERMS   , &  ! Input
                                                  MAX_N_PHASE_ELEMENTS   , &  ! Input
                                                  AerosolScatter         , &  ! Output
                                                  Message_Log=Message_Log  )  ! Error messaging
      AllocStatus_AD(4)=CRTM_Allocate_AtmScatter( Atmosphere(m)%n_Layers , &  ! Input
                                                  MAX_N_LEGENDRE_TERMS   , &  ! Input
                                                  MAX_N_PHASE_ELEMENTS   , &  ! Input
                                                  AerosolScatter_AD      , &  ! Output
                                                  Message_Log=Message_Log  )  ! Error messaging
      ! The AtmOptics structure
      AllocStatus(5)   =CRTM_Allocate_AtmScatter( Atmosphere(m)%n_Layers , &  ! Input
                                                  MAX_N_LEGENDRE_TERMS   , &  ! Input
                                                  MAX_N_PHASE_ELEMENTS   , &  ! Input
                                                  AtmOptics              , &  ! Output
                                                  Message_Log=Message_Log  )  ! Error messaging
      AllocStatus_AD(5)=CRTM_Allocate_AtmScatter( Atmosphere(m)%n_Layers , &  ! Input
                                                  MAX_N_LEGENDRE_TERMS   , &  ! Input
                                                  MAX_N_PHASE_ELEMENTS   , &  ! Input
                                                  AtmOptics_AD           , &  ! Output
                                                  Message_Log=Message_Log  )  ! Error messaging
      ! The SfcOptics structure
      AllocStatus(6)   =CRTM_Allocate_SfcOptics( MAX_N_ANGLES           , &  ! Input
                                                 MAX_N_STOKES           , &  ! Input
                                                 SfcOptics              , &  ! Output
                                                 Message_Log=Message_Log  )  ! Error messaging
      AllocStatus_AD(6)=CRTM_Allocate_SfcOptics( MAX_N_ANGLES           , &  ! Input
                                                 MAX_N_STOKES           , &  ! Input
                                                 SfcOptics_AD           , &  ! Output
                                                 Message_Log=Message_Log  )  ! Error messaging
      IF ( ANY(AllocStatus    /= SUCCESS) .OR. &
           ANY(AllocStatus_AD /= SUCCESS)      ) THEN
        Error_Status=FAILURE
        CALL Display_Message( ROUTINE_NAME, &
                              'Error allocating local data structures', &
                              Error_Status, &
                              Message_Log=Message_Log )
        RETURN
      END IF


      ! --------------------------
      ! Preprocess some input data
      ! --------------------------
      ! Average surface skin temperature for multi-surface types
      CALL CRTM_Compute_SurfaceT( Surface(m), SfcOptics )


      ! ------------------------------------------
      ! Compute predictors for AtmAbsorption calcs
      ! ------------------------------------------
      CALL CRTM_Compute_Predictors( Atmosphere(m)  , &  ! Input
                                    GeometryInfo(m), &  ! Input
                                    Predictor      , &  ! Output
                                    APV              )  ! Internal variable output


      ! Initialise channel counter for sensor(n)/channel(l) count
      ln = 0
    
      ! -----------
      ! Sensor loop
      ! -----------
      Sensor_Loop: DO n = 1, nSensors

        ! Shorter name
        SensorIndex = ChannelInfo(n)%Sensor_Index

        ! ------------
        ! Channel loop
        ! ------------
        Channel_Loop: DO l = 1, ChannelInfo(n)%n_Channels

          ! Shorter name
          ChannelIndex = ChannelInfo(n)%Channel_Index(l)

          ! Increment channel counter
          ln = ln + 1


          !#--------------------------------------------------------------------#
          !#                     -- FORWARD CALCULATIONS --                     #
          !#--------------------------------------------------------------------#
          ! ---------------------------------------------------------------
          ! Determine the number of streams (n_Full_Streams) in up+downward
          ! directions. Currently, n_Full_Streams is determined from the
          ! cloud parameters only. It will also use the aerosol parameters 
          ! when aerosol scattering is included.
          ! ---------------------------------------------------------------
          n_Full_Streams = CRTM_Compute_nStreams( Atmosphere(m)   , &  ! Input
                                                  SensorIndex     , &  ! Input
                                                  ChannelIndex    , &  ! Input
                                                  RTSolution(ln,m)  )  ! Output
          ! Transfer the number of streams
          ! to all the scattering structures
          AtmOptics%n_Legendre_Terms    = n_Full_Streams
          AtmOptics_AD%n_Legendre_Terms = n_Full_Streams
          
          
          ! --------------------------
          ! Compute the gas absorption
          ! --------------------------
          CALL CRTM_Compute_AtmAbsorption( SensorIndex  , &  ! Input
                                           ChannelIndex , &  ! Input
                                           Predictor    , &  ! Input
                                           AtmAbsorption, &  ! Output
                                           AAV            )  ! Internal variable output


          ! -----------------------------------------------------------
          ! Compute the cloud particle absorption/scattering properties
          ! -----------------------------------------------------------
          IF( Atmosphere(m)%n_Clouds > 0 ) THEN
            CloudScatter%n_Legendre_Terms = n_Full_Streams
            Error_Status = CRTM_Compute_CloudScatter( Atmosphere(m)          , &  ! Input
                                                      SensorIndex            , &  ! Input
                                                      ChannelIndex           , &  ! Input
                                                      CloudScatter           , &  ! Output
                                                      CSV                    , &  ! Internal variable output
                                                      Message_Log=Message_Log  )  ! Error messaging
            IF (Error_Status /= SUCCESS) THEN
              WRITE(Message,'("Error computing CloudScatter for ",a,&
                             &", channel ",i0)') &
                              TRIM( ChannelInfo(n)%SensorID ), &
                              ChannelInfo(n)%Sensor_Channel(l)
              CALL Display_Message( ROUTINE_NAME, &
                                    TRIM(Message), &
                                    Error_Status, &
                                    Message_Log=Message_Log )
              RETURN
            END IF
          END IF


          ! ----------------------------------------------------
          ! Compute the aerosol absorption/scattering properties
          ! ----------------------------------------------------
          IF ( Atmosphere(m)%n_Aerosols > 0 ) THEN
            AerosolScatter%n_Legendre_Terms = n_Full_Streams
            Error_Status = CRTM_Compute_AerosolScatter( Atmosphere(m)          , &  ! Input
                                                        SensorIndex            , &  ! Input
                                                        ChannelIndex           , &  ! Input
                                                        AerosolScatter         , &  ! In/Output
                                                        ASV                    , &  ! Internal variable output
                                                        Message_Log=Message_Log  )  ! Error messaging
            IF ( Error_Status /= SUCCESS ) THEN
              WRITE(Message,'("Error computing AerosolScatter for ",a,&
                             &", channel ",i0)') &
                              TRIM( ChannelInfo(n)%SensorID ), &
                              ChannelInfo(n)%Sensor_Channel(l)
              CALL Display_Message( ROUTINE_NAME, &
                                    TRIM(Message), &
                                    Error_Status, &
                                    Message_Log=Message_Log )
              RETURN
            END IF
          END IF


          ! ---------------------------------------------------
          ! Compute the combined atmospheric optical properties
          ! ---------------------------------------------------
          CALL CRTM_Combine_AtmOptics( AtmAbsorption , & ! Input
                                       CloudScatter  , & ! Input
                                       AerosolScatter, & ! Input
                                       AtmOptics     , & ! Output
                                       AOV             ) ! Internal variable output


          ! ------------------------------------
          ! Fill the SfcOptics structure for the
          ! optional emissivity input case.
          ! ------------------------------------
          ! Indicate SfcOptics ARE to be computed
          SfcOptics%Compute_Switch = SET
          ! Change SfcOptics emissivity/reflectivity
          ! contents/computation status
          IF ( User_Emissivity ) THEN
            SfcOptics%Compute_Switch  = NOT_SET
            SfcOptics%Emissivity(1,1)       = Options(m)%Emissivity(ln)
            SfcOptics%Reflectivity(1,1,1,1) = ONE - Options(m)%Emissivity(ln)

            IF ( User_Direct_Reflectivity ) THEN
              SfcOptics%Direct_Reflectivity(1,1) = Options(m)%Direct_Reflectivity(ln)
            ELSE
              SfcOptics%Direct_Reflectivity(1,1) = SfcOptics%Reflectivity(1,1,1,1)
            END IF

          END IF


          ! ------------------------------------
          ! Solve the radiative transfer problem
          ! ------------------------------------
          Error_Status = CRTM_Compute_RTSolution( Atmosphere(m)          , &  ! Input
                                                  Surface(m)             , &  ! Input
                                                  AtmOptics              , &  ! Input
                                                  SfcOptics              , &  ! Input
                                                  GeometryInfo(m)        , &  ! Input
                                                  SensorIndex            , &  ! Input
                                                  ChannelIndex           , &  ! Input
                                                  RTSolution(ln,m)       , &  ! Output
                                                  RTV                    , &  ! Internal variable output
                                                  Message_Log=Message_Log  )  ! Error messaging
          IF ( Error_Status /= SUCCESS ) THEN
            WRITE( Message, '( "Error computing RTSolution for ", a, &
                              &", channel ", i0 )' ) &
                            TRIM( ChannelInfo(n)%SensorID ), &
                            ChannelInfo(n)%Sensor_Channel(l)
            CALL Display_Message( ROUTINE_NAME, &
                                  TRIM(Message), &
                                  Error_Status, &
                                  Message_Log=Message_Log )
            RETURN
          END IF



          !#--------------------------------------------------------------------#
          !#                     -- ADJOINT CALCULATIONS --                     #
          !#--------------------------------------------------------------------#
          ! --------------------------------------------------
          ! Reinitialise profile independent adjoint variables
          ! --------------------------------------------------
          AtmOptics_AD%Optical_Depth         = ZERO
          AtmOptics_AD%Single_Scatter_Albedo = ZERO
          IF ( AtmOptics%n_Legendre_Terms > 0 ) THEN
            AtmOptics_AD%Phase_Coefficient = ZERO
            AtmOptics_AD%Asymmetry_Factor  = ZERO
            AtmOptics_AD%Delta_Truncation  = ZERO
          END IF


          ! -------------------------------------
          ! The adjoint of the radiative transfer
          ! -------------------------------------
          Error_Status = CRTM_Compute_RTSolution_AD( Atmosphere(m)          , &  ! FWD Input
                                                     Surface(m)             , &  ! FWD Input
                                                     AtmOptics              , &  ! FWD Input
                                                     SfcOptics              , &  ! FWD Input
                                                     RTSolution(ln,m)       , &  ! FWD Input
                                                     RTSolution_AD(ln,m)    , &  ! AD  Input
                                                     GeometryInfo(m)        , &  ! Input
                                                     SensorIndex            , &  ! Input
                                                     ChannelIndex           , &  ! Input
                                                     Atmosphere_AD(m)       , &  ! AD Output
                                                     Surface_AD(m)          , &  ! AD Output
                                                     AtmOptics_AD           , &  ! AD Output
                                                     SfcOptics_AD           , &  ! AD Output
                                                     RTV                    , &  ! Internal variable input
                                                     Message_Log=Message_Log  )  ! Error messaging
          IF ( Error_Status /= SUCCESS ) THEN
            WRITE( Message, '( "Error computing RTSolution_AD for ", a, &
                              &", channel ", i0 )' ) &
                            TRIM( ChannelInfo(n)%SensorID ), &
                            ChannelInfo(n)%Sensor_Channel(l)
            CALL Display_Message( ROUTINE_NAME, &
                                  TRIM(Message), &
                                  Error_Status, &
                                  Message_Log=Message_Log )
            RETURN
          END IF


          ! ------------------------------------------------------------------
          ! Compute the adjoint of the combined atmospheric optical properties
          ! ------------------------------------------------------------------
          CALL CRTM_Combine_AtmOptics_AD( AtmAbsorption    , &  ! FWD Input
                                          CloudScatter     , &  ! FWD Input
                                          AerosolScatter   , &  ! FWD Input
                                          AtmOptics        , &  ! FWD Input
                                          AtmOptics_AD     , &  ! AD  Input
                                          AtmAbsorption_AD , &  ! AD  Output
                                          CloudScatter_AD  , &  ! AD  Output
                                          AerosolScatter_AD, &  ! AD  Output
                                          AOV                )  ! Internal variable input


          ! ------------------------------------------------------------
          ! Compute the adjoint aerosol absorption/scattering properties
          ! ------------------------------------------------------------
          IF ( Atmosphere(m)%n_Aerosols > 0 ) THEN
            AerosolScatter_AD%n_Legendre_Terms = n_Full_Streams
            Error_Status = CRTM_Compute_AerosolScatter_AD( Atmosphere(m)          , &  ! FWD Input
                                                           AerosolScatter         , &  ! FWD Input
                                                           AerosolScatter_AD      , &  ! AD  Input
                                                           SensorIndex            , &  ! Input
                                                           ChannelIndex           , &  ! Input
                                                           Atmosphere_AD(m)       , &  ! AD  Output
                                                           ASV                    , &  ! Internal variable input
                                                           Message_Log=Message_Log  )  ! Error messaging
            IF ( Error_Status /= SUCCESS ) THEN
              WRITE(Message,'("Error computing AerosolScatter_AD for ",a,&
                             &", channel ",i0)') &
                              TRIM( ChannelInfo(n)%SensorID ), &
                              ChannelInfo(n)%Sensor_Channel(l)
              CALL Display_Message( ROUTINE_NAME, &
                                    TRIM(Message), &
                                    Error_Status, &
                                    Message_Log=Message_Log )
              RETURN
            END IF
          END IF


          ! ----------------------------------------------------------
          ! Compute the adjoint cloud absorption/scattering properties
          ! ----------------------------------------------------------
          IF ( Atmosphere(m)%n_Clouds > 0 ) THEN
            CloudScatter_AD%n_Legendre_Terms = n_Full_Streams
            Error_Status = CRTM_Compute_CloudScatter_AD( Atmosphere(m)          , &  ! FWD Input
                                                         CloudScatter           , &  ! FWD Input
                                                         CloudScatter_AD        , &  ! AD  Input
                                                         SensorIndex            , &  ! Input
                                                         ChannelIndex           , &  ! Input
                                                         Atmosphere_AD(m)       , &  ! AD  Output
                                                         CSV                    , &  ! Internal variable input
                                                         Message_Log=Message_Log  )  ! Error messaging
            IF ( Error_Status /= SUCCESS ) THEN
              WRITE(Message,'("Error computing CloudScatter_AD for ",a,&
                             &", channel ",i0)') &
                              TRIM( ChannelInfo(n)%SensorID ), &
                              ChannelInfo(n)%Sensor_Channel(l)
              CALL Display_Message( ROUTINE_NAME, &
                                    TRIM(Message), &
                                    Error_Status, &
                                    Message_Log=Message_Log )
              RETURN
            END IF
          END IF
          
          
          ! --------------------------------------
          ! Compute the adjoint gaseous absorption
          ! --------------------------------------
          CALL CRTM_Compute_AtmAbsorption_AD( SensorIndex     , &  ! Input
                                              ChannelIndex    , &  ! Input
                                              Predictor       , &  ! FWD Input
                                              AtmAbsorption_AD, &  ! AD  Input
                                              Predictor_AD    , &  ! AD  Output
                                              AAV               )  ! Internal variable input
          
          
        END DO Channel_Loop
      END DO Sensor_Loop


      ! -------------------------------------
      ! Adjoint of the predictor calculations
      ! -------------------------------------
      CALL CRTM_Compute_Predictors_AD ( Atmosphere(m)   , &  ! FWD Input
                                        Predictor       , &  ! FWD Input
                                        Predictor_AD    , &  ! AD  Input
                                        GeometryInfo(m) , &  ! Input
                                        Atmosphere_AD(m), &  ! AD  Output
                                        APV               )  ! Internal variable input
                                        
      ! ---------------------------
      ! Postprocess some input data
      ! ---------------------------
      ! Adjoint of average surface skin temperature for multi-surface types
      CALL CRTM_Compute_SurfaceT_AD( Surface(m), SfcOptics_AD, Surface_AD(m) )


      ! ---------------------------
      ! Deallocate local structures
      ! ---------------------------
      AllocStatus_AD(6)=CRTM_Destroy_SfcOptics( SfcOptics_AD )
      AllocStatus(6)   =CRTM_Destroy_SfcOptics( SfcOptics )
      AllocStatus_AD(5)=CRTM_Destroy_AtmScatter( AtmOptics_AD )
      AllocStatus(5)   =CRTM_Destroy_AtmScatter( AtmOptics )
      AllocStatus_AD(4)=CRTM_Destroy_AtmScatter( AerosolScatter_AD )
      AllocStatus(4)   =CRTM_Destroy_AtmScatter( AerosolScatter )
      AllocStatus_AD(3)=CRTM_Destroy_AtmScatter( CloudScatter_AD )
      AllocStatus(3)   =CRTM_Destroy_AtmScatter( CloudScatter )
      AllocStatus_AD(2)=CRTM_Destroy_AtmAbsorption( AtmAbsorption_AD )
      AllocStatus(2)   =CRTM_Destroy_AtmAbsorption( AtmAbsorption )
      AllocStatus_AD(1)=CRTM_Destroy_Predictor( Predictor_AD )
      AllocStatus(1)   =CRTM_Destroy_Predictor( Predictor )
      IF ( ANY(AllocStatus /= SUCCESS ) .OR. ANY(AllocStatus_AD /= SUCCESS ) ) THEN
        Error_Status = WARNING
        CALL Display_Message( ROUTINE_NAME, &
                              'Error deallocating local structures', &
                              Error_Status, &
                              Message_Log=Message_Log )
      END IF

    END DO Profile_Loop

  END FUNCTION CRTM_Adjoint

END MODULE CRTM_Adjoint_Module

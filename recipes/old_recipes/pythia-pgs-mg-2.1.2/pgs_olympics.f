c--------------------------------------------------------
c  PGS - Pretty Good Simulation main program
c
c        Version 4.0
c
c    This example main program generates PYTHIA or
c    HERWIG eventsc and writes out objects in the 
c    standard LHC Olympics format.
c
c                          John Conway  April 2006
c--------------------------------------------------------

      program pgs

      logical pgs_next_event
      logical lhefset
      character *80 lhef_name
      

      common /lhe/ lhef_name, lhefset
      COMMON/HEPEUP/NUP,IDPRUP,XWGTUP,SCALUP,AQCDUP,PUP,SPINUP
c -------------------------------------------------------

c get pgs_user arguments and set values to control program

      call pgs_user_args

c initialize PGS
 
      call pgs_user_init 

c initialize user analysis 

      call pgs_user_analysis('ini')      

c read or generate next event; events stored in HEPEVT
c common block format; returns false when finished
     
      iEvent=0
      do while(pgs_next_event())
         
         if ((lhefset.eqv..true.) .and. (NUP.eq.0)) goto 100
         
         iEvent=iEvent+1
         if (mod(iEvent,100).eq.0) write(*,*) 'now working on event', 
     &        iEvent
c run TAUOLA - user MUST turn off tau decays for this
c to work; presently PGS treats pi0s and etas
c from tau decay as if they were gammas, since TAUOLA
c does not decay them yet
        call tauola_scan
c perform standard and user triggers on event;
c store results in common blocks in pgs.inc include file
        call pgs_trigger       
c perform reconstruction; results stored in common

        call pgs_recon
c call user-supplied routine to make trigger selections 

        call pgs_user_trig
c perform user analysis (user supplies this routine);
c this calculates analysis cuts, stores ntuples, etc.

        call pgs_user_analysis('evt')
      enddo

 100  call pgs_user_analysis('end')

      end


      subroutine pgs_user_init

c user initialization routine

      implicit none
      include '../src/pgs.inc'  ! user needs to modify path
      
c jkt -- start command line argument parsing

      integer i,endline
      logical modeSet,eventsSet,triggerSet,fileSet, lhefSet
      character *80 lhef_name
      common /lhe/ lhef_name, lhefset
      
      modeSet = .false.
      eventsSet = .false.
      lhefSet = .false.
      triggerSet = .false.
      fileSet = .false.

      !  Usage Information

      
      if (numarg.eq.0) then
         write(*,*) '  Usage:  olympics <Mode> <Events> [Options]',
     &              ' <pgsOutputFile.lhco>'
         write(*,*) '   Mode:  --pythia <file>'
         write(*,*) '          --herwig <processNum> <file>'
         write(*,*) '          --stdhep <file>'
         write(*,*) '          --lhe <file> --pythia <file>'
         write(*,*) ' Events:  --nev <num>'
         write(*,*) '          --lum <num> (in pb^-1)'
         write(*,*) 'Options:  [--L2|--L0] [--numToPrint <num>]'
         write(*,*) '          [--logFile <file>] [--detector <file>]'
         stop
      end if
      
      !  Set Defaults
      
      ithresh = 0   ! L0 Trigger Threshold
      nprpgs = 5    ! 5 events to write for debugging
      pgs_param_file = 'pars/lhc.par'      ! PGS parameter file
      pgs_log_file = 'olympics.log'        ! default log file
      lhef_name = 'olympics.lhe'  ! default lhe file

      !  Loop through command line arguments

      i = 1
      do while (i.le.numArg)
         if (pgs_args(i)(1:1).eq.'-') then  ! if a command line option
            endline = index(pgs_args(i), ' ') - 1
            if (pgs_args(i)(1:endline).eq.'--pythia') then         ! --pythia <file>
               if (modeSet) then
                  write(*,*) 'Select only one of ',
     &                       '--pythia, --herwig, or --stdhep.'
                  stop
               end if
               modeSet = .true.
               optpgs = 'PYTHIA'
               i = i+1
               if (pgs_args(i)(1:1).eq.'-' .or. i.eq.(numarg+1)) then
                  write(*,*)  '--pythia',
     &                        ' requires one additional argument.'
                  stop
               end if
               read(pgs_args(i),'(a)') pgs_pythia_cards  ! pythia file
            else if (pgs_args(i)(1:endline).eq.'--herwig') then    ! --herwig <proc> <file>
               if (modeSet) then
                  write(*,*) 'Select only one of ',
     &                       '--pythia, --herwig, or --stdhep.'
                  stop
               end if
               modeSet = .true.
               optpgs = 'HERWIG'
               i = i+1
               if (pgs_args(i)(1:1).eq.'-' .or. i.eq.(numarg+1)) then
                  write(*,*)  '--herwig',
     &                        ' requires two additional arguments.'
                  stop
               end if
               read(pgs_args(i),'(i8)') pgs_herwig_proc   ! herwig proc
               i = i+1
               if (pgs_args(i)(1:1).eq.'-' .or. i.eq.(numarg+1)) then
                  write(*,*)  '--herwig',
     &                        ' requires two additional arguments.'
                  stop
               end if
               read(pgs_args(i),'(a)') pgs_herwig_susy    ! herwig file
            else if (pgs_args(i)(1:endline).eq.'--stdhep') then   ! --stdhep <file>
               if (modeSet) then
                  write(*,*) 'Select only one of ',
     &                       '--pythia, --herwig, or --stdhep.'
                  stop
               end if
               modeSet = .true.
               optpgs = 'FILE'
               i = i+1
               if (pgs_args(i)(1:1).eq.'-' .or. i.eq.(numarg+1)) then
                  write(*,*)  '--stdhep',
     &                        ' requires one additional argument.'
                  stop
               end if
               read(pgs_args(i),'(a)') pgs_input_file    !stdhep input file
            else if (pgs_args(i)(1:endline).eq.'--lhe') then ! --lhe <lhefile>
               if (lhefSet) then
                  write(*,*) 'Select only one LHE file '
                  stop
               end if
               lhefSet = .true.
               i = i+1
               if (pgs_args(i)(1:1).eq.'-' .or. i.eq.(numarg+1)) then
                  write(*,*)  '--lhe',
     &                        ' requires one additional argument.'
                  stop
               end if               
               read(pgs_args(i),'(a)') lhef_name
            else if (pgs_args(i)(1:endline).eq.'--nev') then      ! --nev <num>
               if (eventsSet) then
                  write(*,*) 'Select only one of ',
     &                       '--nev or --lum.'
                  stop
               end if
               eventsSet = .true.
               i = i+1
               if (pgs_args(i)(1:1).eq.'-' .or. i.eq.(numarg+1)) then
                  write(*,*)  '--nev',
     &                        ' requires one additional argument.'
                  stop
               end if               
               read(pgs_args(i),'(i8)') nevpgs
               target_lum = nevpgs
               evtlum = 'events'
            else if (pgs_args(i)(1:endline).eq.'--lum') then      ! --lum <num>
               if (eventsSet) then
                  write(*,*) 'Select only one of ',
     &                       '--nev or --lum.'
                  stop
               end if
               eventsSet = .true.
               i = i+1
               if (pgs_args(i)(1:1).eq.'-' .or. i.eq.(numarg+1)) then
                  write(*,*)  '--lum',
     &                        ' requires one additional argument.'
                  stop
               end if               
               read(pgs_args(i),'(i8)') nevpgs
               target_lum = nevpgs
               evtlum = 'pb-1'
            else if (pgs_args(i)(1:endline).eq.'--L0') then       ! --L0
               if (triggerSet) then
                  write(*,*) 'Select only one of ',
     &                       '--L0, --L1, or --L2.'
                  stop
               end if
               triggerSet = .true.
               ithresh = 0
            else if (pgs_args(i)(1:endline).eq.'--L1') then       ! --L1
               if (triggerSet) then
                  write(*,*) 'Select only one of ',
     &                       '--L0, --L1, or --L2.'
                  stop
               end if
               triggerSet = .true.
               ithresh = 1
            else if (pgs_args(i)(1:endline).eq.'--L2') then       ! --L2
               if (triggerSet) then
                  write(*,*) 'Select only one of ',
     &                       '--L0, --L1, or --L2.'
                  stop
               end if
               triggerSet = .true.
               ithresh = 2
            else if (pgs_args(i)(1:endline).eq.'--numToPrint') then   ! --numToPrint <num>
               i = i+1
               if (pgs_args(i)(1:1).eq.'-' .or. i.eq.(numarg+1)) then
                  write(*,*)  '--numToPrint',
     &                        ' requires one additional argument.'
                  stop
               end if
               read(pgs_args(i),'(i8)') nprpgs
            else if (pgs_args(i)(1:endline).eq.'--logFile') then      ! --logFile <file>
               i = i+1
               if (pgs_args(i)(1:1).eq.'-' .or. i.eq.(numarg+1)) then
                  write(*,*)  '--logFile',
     &                        ' requires one additional argument.'
                  stop
               end if
               read(pgs_args(i),'(a)') pgs_log_file  ! log file
            else if (pgs_args(i)(1:endline).eq.'--detector') then     ! --detector  <file>
               i = i+1
               if (pgs_args(i)(1:1).eq.'-' .or. i.eq.(numarg+1)) then
                  write(*,*)  '--detector',
     &                        ' requires one additional argument.'
                  stop
               end if
               read(pgs_args(i),'(a)') pgs_param_file   ! param file
            else                                                      ! unknown option
               write(*,*) 'Command line option ',
     &                    pgs_args(i)(1:endline),' not recognized.'
               stop
            end if
         else              ! output file
            endline = index(pgs_args(i), ' ') - 1
            if (fileSet) then
               write(*,*) 'Output file has already been set. ',
     &                    pgs_args(i)(1:endline),' ignored.'
               stop
            end if
            read(pgs_args(i),'(a)') pgs_output_file
            fileSet = .true.
         end if
         i = i + 1
      end do
      !  Check everything required was set
   
      if (.not.fileSet) then
         write(*,*) 'You must choose an output file.'
         stop
      else if (.not.modeSet) then
         write(*,*) 'You must select one of ',
     &              '--pythia, --herwig, or --stdhep.'
         stop
      else if (.not.eventsSet) then
         write(*,*) 'You must select one of ',
     &              '--nev or --lum.'
         stop
      end if

c jkt -- end command line argument parsing

      ! open log file

      open(pgs_log_unit,file=pgs_log_file,status='unknown')
      
c 

c set option: 'PYTHIA', 'ISAJET', 'FILE'

c      if(numarg.ge.1) then
c        optpgs = pgs_args(1)
c      else
c        optpgs = 'PYTHIA'
c      endif

c set number of events to generate

c      if(numarg.ge.2) then
c        read(pgs_args(2),'(i8)') nevpgs
c        target_lum = nevpgs
c      else
c        nevpgs = 10000
c      endif

c set whether to generate a certain number of events ('events')
c or a certain number of inverse picobarns ('pb-1')

c      if(numarg.ge.3) then
c        read(pgs_args(3)(1:6),'(a6)') evtlum
c      else
c        evtlum = 'events'
c      endif

c set trigger thresholds

c      if(numarg.ge.4) then
c        read(pgs_args(4),'(a2)') threshold
c        ithresh = 2
c        if(threshold.eq.'L0') ithresh = 0   ! no trigger required
c        if(threshold.eq.'L1') ithresh = 1   ! low thresholds
c        if(threshold.eq.'L2') ithresh = 2   ! high thresholds (use for blinded samples!)
c      else
c        ithresh = 0                         ! default is high thresholds
c      endif

c number of events to print

c      if(numarg.ge.5) then
c        read(pgs_args(5),'(i8)') nprpgs
c      else
c        nprpgs = 5
c      endif

c PYTHIA card file name

c      if(optpgs(1:6).eq.'PYTHIA') then
c        if(numarg.ge.6) then
c          read(pgs_args(6),'(a)') pgs_pythia_cards
c        else
c          pgs_pythia_cards = 'cards/lhco.pyt'   ! process to generate, decays, etc.
c        endif
c      elseif(optpgs(1:6).eq.'HERWIG') then
c        read(pgs_args(6),'(i8)') pgs_herwig_proc
c      elseif(optpgs(1:3).eq.'ALP') then
c        if (numarg.ge.6) then
c          read(pgs_args(6),'(a)') pgs_alpgen_stem
c        else
c          write (*,*) 'too few arguments for ALPGEN mode'
c          write (*,*) 'must specify filestem:  use file for file.unw'
c        endif
c      elseif(optpgs(1:4).eq.'FILE') then
c        read(pgs_args(6),'(a)') pgs_input_file
c      endif

c output LHC Olympics file name

c c     if(numarg.ge.7) then
c c       read(pgs_args(7),'(a)') pgs_output_file
c c     else
c c       pgs_output_file = 'lhco.lhc'   
c c     endif

c log file

c      if(numarg.ge.8) then
c        read(pgs_args(8),'(a)') pgs_log_file
c      else
c        pgs_log_file = 'olympics.log'   
c      endif
c
c      

c HERWIG SUSY data 
c
c drawn from http://www.hep.phy.cam.ac.uk/~richardn/HERWIG/HDECAY/lhc.html

c      if(numarg.ge.9) then
c        read(pgs_args(9),'(a)') pgs_herwig_susy
c      else
c        pgs_herwig_susy = 'SUSY-data/sugra_pth1.1200.in'
c      endif

c set up PGS *after* user initialization

      call pgs_initialize
    
      return
      end


      subroutine pgs_user_herwig(process)

cc user initialization of HERWIG
c
c      include '../src/herwig65.inc'  ! includes implicit none
c
c      integer process ! supplied via pgs_herwig_proc, which user
c                      ! needs to set in pgs_user_init
cc beam particles
c
c      part1 = 'P'
c      part2 = 'P'
c
cc beam momentum
c
c      pbeam1 = 7000.
c      pbeam2 = 7000.
c
cc process to generate
c
c      iproc = process 
c
      return
      end

      subroutine pgs_user_pythia

c      character *80 lhef_name
c      logical lhefset
c      common /lhe/ lhef_name, lhefset
cc Pythia parameters
c      integer mstp,msti
c      real*8  parp,pari
c      common/pypars/mstp(200),parp(200),msti(200),pari(200)     
c
c      if (lhefset .eqv. .true.) then
c         lfn=25
c         open(lfn,file=lhef_name,status='old')
c         MSTP(161)=lfn
c         MSTP(162)=lfn
c         call PYGIVE('MSUB(481)=0')  ! This is a MARMOSET specific flag.  jkt
c         call PYGIVE('MSUB(482)=0')  ! This is a MARMOSET specific flag.  jkt
c         call PYGIVE('MSUB(483)=0')  ! This is a MARMOSET specific flag.  jkt
c         
c         call pyinit('USER',' ',' ',0d0)
c     
c      else
c         call pyinit('CMS','p','p',14000.0d0) !  14 TeV p-p
c         
c      endif
cc     call pylist(12)  ! need a list of decay modes?  
cc     stop

      return
      end



c set up beam type and energy for PYTHIA here

c      call pyinit('CMS','p','p',14000.0d0) !  14 TeV p-p
     
c     call pylist(12)  ! need a list of decay modes?  
c     stop

c      return
c      end


      subroutine pgs_user_analysis(command)

c routine to perform user's analysis 

      implicit none
      include '../src/pgs.inc'  ! user needs to modify path

      character*3 command

c initialize ---------------------------------------------

      if(command.eq.'ini') then

        call pgs_olympics_output('open')

      endif      

c analyze event ------------------------------------------

      if(command.eq.'evt') then

c merge non-isolated muons into jets

        call harv_muon_isolator

c write out event if triggered

        if(trigword.ne.0) call pgs_olympics_output('write')

      endif

c done - wrap up -----------------------------------------

      if(command.eq.'end') then

c close Olympics file

        call pgs_olympics_output('close')

      endif      

      return
      end


      subroutine pgs_olympics_output(command)

      implicit none
      include '../src/pgs.inc'

      character*(*) command

      integer i,j,ieta,iphi,iobj,jobj,kobj,type
      real*8 eta,phi,pt,mass,ntrks,btag
      real*8 dum0,dum1,dum2,hadem
      real*8 theta_temp

      integer closejet
C      logical muflags
      integer maxmus
      parameter (maxmus=100)
      common /harvmuon/closejet(maxmus)
      integer object_index(100)

      double precision ptiso, etiso, etrat
C
      do i=1,100
         object_index(i)=0
      enddo

c  open file      

      if(command.eq.'open') then
         
         open(87,file=pgs_output_file,status='unknown')
         
         write(87, '(''  #  typ      eta    phi    '',
     .        ''  pt    jmas  ntrk  btag   had/em  dum1'',  
     .        ''  dum2'')' )
         
      endif
      
c  write event

      if(command.eq.'write') then         

         kobj = 0
         do iobj=1,numobj
            if(unique(iobj)) then
               kobj=kobj+1
               object_index(iobj)=kobj ! loop to figure out which objects
                                       ! are written to the data files
            endif
         enddo

          write (87,'(i3,i14,i7)') -1, NEVHEP, nhep
          do i = 1, nhep
              write (87,fmt=584) i, isthep(i), idhep(i),
     .                 jmohep(1,i), jmohep(2,i),
     .                 jdahep(1,i), jdahep(2,i),
     .                 phep(1,i), phep(2,i), phep(3,i), phep(4,i),
     .                 phep(5,i),
     .                 vhep(1,i), vhep(2,i), vhep(3,i), vhep(4,i)             
          enddo 
 584  format(i6,i4,i11,4i6,9f12.2)
c 584  format(i5,i3,i10,4i5,9f9.2)

c     write out trigger word object     
         
         write(87,'(i3,i14,i7)')
     .        0,nevhep,trigword
     
         kobj = 0
         do iobj=1,numobj !do:581
            if(unique(iobj)) then !582
               type = typobj(iobj)
               eta = eta_obj(iobj)
               phi = phi_obj(iobj)
               pt = pt_obj(iobj)
               mass = v4mass(pobj(1,iobj))
c     ntrks
               if(typobj(iobj).eq.4) then
                  ntrks = vecobj(4,iobj) ! for jet, it's the number of tracks
               else if (typobj(iobj).eq.3) then
                  if (qobj(iobj).ge.0) then
                     ntrks=vecobj(4,iobj)
                  else          !taus (1 or 3 prong)
                     ntrks=-vecobj(4,iobj)
                  endif
               else
                  ntrks = qobj(iobj) ! for non-jets and non-taus, it's the charge
               endif
c     btag
               btag = 0.
               if(typobj(iobj).eq.4) then
                  if (vecobj(7,iobj).eq.1.0) then
                     btag = vecobj(7,iobj) !loose b tag
                     if (vecobj(8,iobj).eq.1.0) then
                        btag=2.0 !tight b tag
                     endif
                  endif
               else if (typobj(iobj).eq.2) then
                  if(closejet(iobj).gt.0) then
                     btag=real(object_index(closejet(iobj))) !for muons it's closest jet
                  endif
               endif
c     hadem
               hadem=0.d0
               if (typobj(iobj).eq.3) then
                  if (vecobj(1,iobj).ne.0d0) then
                     hadem=vecobj(2,iobj)/vecobj(1,iobj)
                     if(hadem.ge.999) then 
                        hadem=999.0
                     endif
                  else
                     hadem=999.0
                  endif
               else if (typobj(iobj).eq.0.or.typobj(iobj).eq.1) then
                  hadem=vecobj(9,iobj) !hadem
               else if (typobj(iobj).eq.4) then
                  if (vecobj(1,iobj).ne.0d0) then
                     hadem=vecobj(2,iobj)/vecobj(1,iobj)
                     if(hadem.ge.999) then 
                        hadem=999.0
                     endif
                  else
                     hadem=999.0
                  endif
               else if (typobj(iobj).eq.2) then
                  theta_temp = 2. * atan( exp(-eta) )
                  hadem=vecobj(6,iobj) 
                  if (hadem.gt.999) then
                     hadem=999
                  endif
                  ptiso=dble(int(hadem))
                  call pgs_etaphi_index(eta,phi,ieta,iphi)
                  call pgs_tower_isosum(ieta,iphi,etiso) !get Etiso of surrounding cells
                  etiso=etiso+sin(theta_temp)*ecal(ieta,iphi) + 
     .                 sin(theta_temp)*hcal(ieta,iphi) !add in cell of muon
                  if (pt.ne.0) then
                     etrat=etiso/pt
                     if (etrat.ge.0.99) then
                        etrat=0.99
                     endif
                  else
                     write (*,*) 'problem: how is pt(mu) =0?'
                  endif
                  hadem=ptiso+etrat                 
               endif

c               dum1=0.d0
c               dum2=0.d0
               if(typobj(iobj).eq.0) then
                  dum1 = qobj(iobj)
                  dum2 = vecobj(8, iobj)
               else if(typobj(iobj).eq.1) then
                  dum1 = qobj(iobj)
                  dum2 = vecobj(8, iobj)
               else if(typobj(iobj).eq.2) then
                  dum1 = qobj(iobj)
                  dum2 = vecobj(6, iobj)
               else if(typobj(iobj).eq.3) then
                  dum1 = qobj(iobj)
                  dum2 = vecobj(8, iobj)
               else if(typobj(iobj).eq.4) then
                  dum1 = qobj(iobj)
                  dum2 = vecobj(6, iobj)
               else
                  dum1=0.d0
                  dum2=0.d0
               endif

               kobj = kobj + 1
     
               write(87,'(i3,i5,f9.3,f7.3,f8.2,
     .              f8.2,2f6.1,f9.2,2f6.1)')
     .              kobj,type,eta,phi,pt,mass,ntrks,btag,hadem,dum1,dum2
            endif !endif582
         enddo !enddo:581

c  write out MET 'object'

         kobj = kobj + 1
         type = 6
         pobj(1,iobj) = met_cor * cos(phi_met_cor)
         pobj(2,iobj) = met_cor * sin(phi_met_cor)
         pobj(3,iobj) = 0.0
         pobj(4,iobj) = sqrt(pobj(1,iobj)**2 + pobj(2,iobj)**2)
         vecobj(4,iobj) = 0.
         eta = 0.
         phi = phi_met_cor
         pt = met_cor
         mass = 0.
         ntrks = 0.
         btag = 0.
         hadem=0.d0
         dum1=0.d0
         dum2=0.d0
         write(87,'(i3,i5,f9.3,f7.3,f8.2,f8.2,2f6.1,f9.2,2f6.1)')
     .        kobj,type,eta,phi,pt,mass,ntrks,btag,hadem,dum1,dum2

      endif      
      
c  close file

      if(command.eq.'close') then
        close(87)
      endif

      return
      end



      subroutine pgs_user_event

c dummy routine to make linker happy

      return
      end


      subroutine pgs_user_trig

c user trigger routine - sets trigword and ntrigged

      implicit none
      include '../src/pgs.inc'

      integer ndiphoton_trigger
      integer ndielectron_trigger
      integer ndimuon_trigger
      integer nditau_trigger
      integer ndijet_trigger
      integer nelectron_emu_trigger
      integer nmuon_emu_trigger
      integer nelectron_lplustau_trigger
      integer nmuon_lplustau_trigger
      integer nelectron_lplusjet_trigger
      integer nmuon_lplusjet_trigger
      integer ntau_lplustau_trigger
      integer nelectron_llplusjet_trigger
      integer nmuon_llplusjet_trigger

      real single_lepton_rectrig_threshold
      real lplusjet_lepton_rectrig_threshold
      real lplusjet_jet_rectrig_threshold
      real dilepton_rectrig_threshold
      real llplusjet_dilepton_rectrig_threshold
      real llplusjet_jet_rectrig_threshold
      real emu_rectrig_threshold

      real lplustau_lepton_rectrig_threshold
      real lplustau_tau_rectrig_threshold
      real ditau_rectrig_threshold
      real single_photon_rectrig_threshold
      real diphoton_rectrig_threshold

      real met_rectrig_threshold
      real single_jet_rectrig_threshold
      real jetplusmet_jet_rectrig_threshold
      real jetplusmet_met_rectrig_threshold
      real acoplanar_jet_and_met_jet_rectrig_threshold
      real acoplanar_jet_and_met_met_rectrig_threshold
      real acoplanar_jet_and_met_rectrig_phimin
      real acoplanar_jet_and_met_rectrig_phimax
      real acoplanar_dijet_rectrig_threshold
      real acoplanar_dijet_rectrig_phimax

      integer isingle_lepton_trigger_bit
      integer ilplusjet_trigger_bit
      integer idilepton_trigger_bit
      integer illplusjet_trigger_bit
      integer iemu_trigger_bit

      integer ilplustau_trigger_bit
      integer iditau_trigger_bit
      integer isingle_photon_trigger_bit
      integer idiphoton_trigger_bit

      integer imet_trigger_bit
      integer isingle_jet_trigger_bit
      integer ijetplusmet_trigger_bit
      integer iacoplanar_jet_and_met_trigger_bit
      integer iacoplanar_dijet_trigger_bit

      parameter(isingle_lepton_trigger_bit=0)
      parameter(ilplusjet_trigger_bit=1)
      parameter(idilepton_trigger_bit=2)
      parameter(illplusjet_trigger_bit=3)
      parameter(iemu_trigger_bit=4)

      parameter(ilplustau_trigger_bit=5)
      parameter(iditau_trigger_bit=6)
      parameter(isingle_photon_trigger_bit=7)
      parameter(idiphoton_trigger_bit=8)

      parameter(imet_trigger_bit=9)
      parameter(isingle_jet_trigger_bit=10)
      parameter(ijetplusmet_trigger_bit=11)
      parameter(iacoplanar_jet_and_met_trigger_bit=12)
      parameter(iacoplanar_dijet_trigger_bit=13)

      real*8 xet,xphi,xx,xy
      integer i,matchtype
      real*8 smphi,smet,cost,smeta
      integer idijet
      real phi_dijet(50)

      data ntrigged/0/
      integer ievent
      data ievent/0/

c clear trigger words (i.e. trig fails); set to 1 for automatic pass

      trigword = 0

c get MET and its phi

       xet  = met_cor
       xphi = phi_met_cor

c perform trigger selections ----------------------------------------------

       if(ithresh.le.0) then  

         trigword = 1

       else if(ithresh.eq.1) then 

C Low Thresholds

C.....Inclusive isolated lepton (muon, electron)  30 GeV
C.....Lepton (muon, electron) plus jet (20 GeV, 100 GeV)
C.....Isolated dileptons (mumu,ee)  15 GeV
C.....Dileptons (mumu,ee) plus jet (10 GeV, 100 GeV)
C.....Isolated dileptons (emu)  10 GeV

C.....Isolated lepton (muon,electron) plus isolated tau (15 GeV, 45 GeV)
C.....Isolated ditau 60 GeV
C.....Inclusive isolated photon 80 GeV
C.....Isolated diphoton 25 GeV

C.....Inclusive MET 90 GeV
C.....Inclusive single-jet 400 GeV
C.....Jet plus MET (180 GeV, 80 GeV)
C.....Acoplanar jet and MET (100 GeV, 80 GeV, 1<Dphi<2)
C.....Acoplanar dijets (200 GeV, Dphi<2)

        single_lepton_rectrig_threshold=30.0
        lplusjet_lepton_rectrig_threshold=20.0
        lplusjet_jet_rectrig_threshold=100.0
        dilepton_rectrig_threshold=15.0
        llplusjet_dilepton_rectrig_threshold=10.0
        llplusjet_jet_rectrig_threshold=100.0
        emu_rectrig_threshold=10.0

        lplustau_lepton_rectrig_threshold=15.0
        lplustau_tau_rectrig_threshold=45.0
        ditau_rectrig_threshold=60.0
        single_photon_rectrig_threshold=80.0
        diphoton_rectrig_threshold=25.0

        met_rectrig_threshold=90.0
        single_jet_rectrig_threshold=400.0
        jetplusmet_jet_rectrig_threshold=180.0
        jetplusmet_met_rectrig_threshold=80.0
        acoplanar_jet_and_met_jet_rectrig_threshold=100.0
        acoplanar_jet_and_met_met_rectrig_threshold=80.0
        acoplanar_jet_and_met_rectrig_phimin=1.0
        acoplanar_jet_and_met_rectrig_phimax=2.0
        acoplanar_dijet_rectrig_threshold=200.0
        acoplanar_dijet_rectrig_phimax=2.0

       else

C High Thresholds

C.....Inclusive isolated lepton (muon, electron)  180 GeV
C.....Lepton (muon, electron) plus jet (130 GeV, 200 GeV)
C.....Isolated dileptons (mumu,ee)  60 GeV
C.....Dileptons (mumu,ee) plus jet (45 GeV, 150 GeV)
C.....Isolated dileptons (emu)  30 GeV

C.....Isolated lepton (muon,electron) plus isolated tau (45 GeV, 60 GeV)
C.....Isolated ditau 60 GeV
C.....Inclusive isolated photon 80 GeV
C.....Isolated diphoton 40 GeV

C.....Inclusive MET 200 GeV
C.....Inclusive single-jet 1000 GeV
C.....Jet plus MET (300 GeV, 125 GeV)
C.....Acoplanar jet and MET (150 GeV, 80 GeV, 1<Dphi<2)
C.....Acoplanar dijets (400 GeV, Dphi<2)

        single_lepton_rectrig_threshold=180.0
        lplusjet_lepton_rectrig_threshold=130.0
        lplusjet_jet_rectrig_threshold=200.0
        dilepton_rectrig_threshold=60.0
        llplusjet_dilepton_rectrig_threshold=45.0
        llplusjet_jet_rectrig_threshold=150.0
        emu_rectrig_threshold=30.0

        lplustau_lepton_rectrig_threshold=45.0
        lplustau_tau_rectrig_threshold=60.0
        ditau_rectrig_threshold=60.0
        single_photon_rectrig_threshold=80.0
        diphoton_rectrig_threshold=40.0

        met_rectrig_threshold=200.0
        single_jet_rectrig_threshold=1000.0
        jetplusmet_jet_rectrig_threshold=300.0
        jetplusmet_met_rectrig_threshold=125.0
        acoplanar_jet_and_met_jet_rectrig_threshold=150.0
        acoplanar_jet_and_met_met_rectrig_threshold=80.0
        acoplanar_jet_and_met_rectrig_phimin=1.0
        acoplanar_jet_and_met_rectrig_phimax=2.0
        acoplanar_dijet_rectrig_threshold=400.0
        acoplanar_dijet_rectrig_phimax=2.0

       endif

       if(numobj.gt.0) then

        ndiphoton_trigger = 0
        ndielectron_trigger = 0
        ndimuon_trigger = 0
        nditau_trigger = 0
        ndijet_trigger = 0
        nelectron_emu_trigger = 0
        nmuon_emu_trigger = 0
        nelectron_lplustau_trigger = 0
        nmuon_lplustau_trigger = 0
        ntau_lplustau_trigger = 0
        nelectron_lplusjet_trigger = 0
        nmuon_lplusjet_trigger = 0
        nelectron_llplusjet_trigger = 0
        nmuon_llplusjet_trigger = 0

        do i=1,numobj
         do matchtype = 0,4
          if(unique(i).and.typobj(i).eq.matchtype) then

           smeta = eta_obj(i)
           smphi = phi_obj(i)
           smet  =  et_obj(i)

C.....Inclusive isolated lepton (muon, electron)
C.....Isolated dileptons (mumu,ee)
C.....Isolated dileptons (emu)

           if(typobj(i).eq.1) then
              if(smet.gt.single_lepton_rectrig_threshold) then
                 trigword=ibset(trigword,isingle_lepton_trigger_bit)
              endif
              if(smet.gt.lplustau_lepton_rectrig_threshold) then
                 nelectron_lplustau_trigger = 
     +             nelectron_lplustau_trigger + 1
              endif
              if(smet.gt.lplusjet_lepton_rectrig_threshold) then
                 nelectron_lplusjet_trigger = 
     +             nelectron_lplusjet_trigger + 1
              endif
              if(smet.gt.llplusjet_dilepton_rectrig_threshold) then
                 nelectron_llplusjet_trigger = 
     +             nelectron_llplusjet_trigger + 1
              endif
              if(smet.gt.dilepton_rectrig_threshold) then
                 ndielectron_trigger = ndielectron_trigger + 1
                 if(ndielectron_trigger.eq.2) then
                    trigword=ibset(trigword,idilepton_trigger_bit)
                 endif
              endif
              if(smet.gt.emu_rectrig_threshold) then
                 nelectron_emu_trigger = nelectron_emu_trigger + 1
                 if(nelectron_emu_trigger.gt.0
     +             .and.nmuon_emu_trigger.gt.0) then
                    trigword=ibset(trigword,iemu_trigger_bit)
                 endif
              endif
           endif
           if(typobj(i).eq.2) then
              if(smet.gt.single_lepton_rectrig_threshold) then
                 trigword=ibset(trigword,isingle_lepton_trigger_bit)
              endif
              if(smet.gt.lplustau_lepton_rectrig_threshold) then
                 nmuon_lplustau_trigger = 
     +             nmuon_lplustau_trigger + 1
              endif
              if(smet.gt.lplusjet_lepton_rectrig_threshold) then
                 nmuon_lplusjet_trigger = 
     +             nmuon_lplusjet_trigger + 1
              endif
              if(smet.gt.llplusjet_dilepton_rectrig_threshold) then
                 nmuon_llplusjet_trigger = 
     +             nmuon_llplusjet_trigger + 1
              endif
              if(smet.gt.dilepton_rectrig_threshold) then
                 ndimuon_trigger = ndimuon_trigger + 1
                 if(ndimuon_trigger.eq.2) then
                    trigword=ibset(trigword,idilepton_trigger_bit)
                 endif
              endif
              if(smet.gt.emu_rectrig_threshold) then
                 nmuon_emu_trigger = nmuon_emu_trigger + 1
                 if(nelectron_emu_trigger.gt.0
     +             .and.nmuon_emu_trigger.gt.0) then
                    trigword=ibset(trigword,iemu_trigger_bit)
                 endif
              endif
           endif

C.....Isolated lepton (muon,electron) plus isolated tau
C.....Isolated ditau
               
           if(typobj(i).eq.3) then
              if(smet.gt.lplustau_tau_rectrig_threshold) then
                 if(nelectron_lplustau_trigger
     +             +nmuon_lplustau_trigger.gt.0) then
                   trigword=ibset(trigword,ilplustau_trigger_bit)
                 endif
              endif
              if(smet.gt.ditau_rectrig_threshold) then
                 nditau_trigger = nditau_trigger + 1
                 if(nditau_trigger.eq.2) then
                    trigword=ibset(trigword,iditau_trigger_bit)
                 endif
              endif
           endif

C.....Inclusive isolated photon
C.....Isolated diphoton

           if(typobj(i).eq.0) then
              if(smet.gt.single_photon_rectrig_threshold) then
                 trigword=ibset(trigword,isingle_photon_trigger_bit)
              endif
              if(smet.gt.diphoton_rectrig_threshold) then
                 ndiphoton_trigger = ndiphoton_trigger + 1
                 if(ndiphoton_trigger.eq.2) then
                    trigword=ibset(trigword,idiphoton_trigger_bit)
                 endif
              endif
           endif

C.....Inclusive MET

           if(xet.gt.met_rectrig_threshold) then
              trigword=ibset(trigword,imet_trigger_bit)
           endif

C.....Inclusive single-jet
C.....Jet plus MET
C.....Acoplanar jet and MET

           if(typobj(i).eq.4) then
              if(smet.gt.single_jet_rectrig_threshold) then
                 trigword=ibset(trigword,isingle_jet_trigger_bit)
              endif
              if(smet.gt.jetplusmet_jet_rectrig_threshold) then
                 if(xet.gt.jetplusmet_met_rectrig_threshold) then
                    trigword=ibset(trigword,ijetplusmet_trigger_bit)
                 endif
              endif
              if(smet.gt.acoplanar_jet_and_met_jet_rectrig_threshold
     +           .and.
     +           xet.gt.acoplanar_jet_and_met_met_rectrig_threshold.and.
     +           cos(xphi-smphi).lt.
     +           cos(acoplanar_jet_and_met_rectrig_phimin)
     +           .and.
     +           cos(xphi-smphi).gt.
     +           cos(acoplanar_jet_and_met_rectrig_phimax)
     +           ) then
            trigword=ibset(trigword,iacoplanar_jet_and_met_trigger_bit)
              endif
           endif

C.....Acoplanar dijets

           if(typobj(i).eq.4) then
              if(smet.gt.acoplanar_dijet_rectrig_threshold) then
                 ndijet_trigger = ndijet_trigger + 1
                 phi_dijet(ndijet_trigger) = smphi
                 do idijet=1,ndijet_trigger-1
                    if(cos(phi_dijet(ndijet_trigger)-phi_dijet(idijet))
     +                .gt.cos(acoplanar_dijet_rectrig_phimax)) then
                  trigword=ibset(trigword,iacoplanar_dijet_trigger_bit)
                    endif
                 enddo
              endif
           endif

C.....Lepton (muon, electron) plus jet
C.....Dileptons (mumu,ee) plus jet

           if(typobj(i).eq.4) then
              if(smet.gt.lplusjet_jet_rectrig_threshold) then
                if(nelectron_lplusjet_trigger
     +            +nmuon_lplusjet_trigger.gt.0) then
            trigword=ibset(trigword,ilplusjet_trigger_bit)
                endif
              endif
              if(smet.gt.llplusjet_jet_rectrig_threshold) then
                if(nelectron_llplusjet_trigger.gt.1.OR.
     +             nmuon_llplusjet_trigger.gt.1) then
            trigword=ibset(trigword,illplusjet_trigger_bit)
                endif
              endif
           endif

          endif 
         enddo
        enddo
       endif

c  update user on progress

      ievent = ievent + 1
      if(trigword.ne.0) ntrigged = ntrigged + 1

      if (ievent.lt.100.and.mod(ievent,10).eq.0) then
           write(6,*) 'Now at event number', ievent, ' of', nevpgs,
     .          '  (Triggered on:', ntrigged, ')'
          write(pgs_log_unit,*)
     .          'Now at event number', ievent, ' of', nevpgs,
     .          '  (Triggered on:', ntrigged, ')'
      else if (ievent.lt.1000.and.mod(ievent,100).eq.0) then
           write(6,*) 'Now at event number', ievent, ' of', nevpgs,
     .          '  (Triggered on:', ntrigged, ')'
           write(pgs_log_unit,*)
     .          'Now at event number', ievent, ' of', nevpgs,
     .          '  (Triggered on:', ntrigged, ')'
      else if (mod(ievent,1000).eq.0) then
           write(6,*) 'Now at event number', ievent, ' of', nevpgs,           
     .          '  (Triggered on:', ntrigged, ')'
           write(pgs_log_unit,*)
     .          'Now at event number', ievent, ' of', nevpgs,
     .          '  (Triggered on:', ntrigged, ')'
      end if

      return
      end


      subroutine harv_muon_isolator
c     subroutine to get information about muon isolation
C     for each muon, determines the closest reconstructed jet in delta R
c     (stores in closejet)
C     determines whether there exists a jet with pt >pt muon
C     within a delta R of muconesize
c     blame Aaron Pierce and Jesse Thaler
C
      implicit none
      include '../src/pgs.inc'

      integer iobj,jobj,jclose
      real*8 del_phi_muj,del_eta_muj, del_r_muj
      real*8 del_r_min
      real*8 muconesize
      parameter (muconesize=0.4)
C
      integer closejet
      integer maxmus
      parameter (maxmus=100)
      common /harvmuon/closejet(maxmus)

      do iobj=1,maxmus
         closejet(iobj)=0       !initialize arrays
      enddo
      do iobj=1,numobj          !loop over muons
         del_r_min=1000.d0      !a random big number
         jclose=0
         if (typobj(iobj).eq.2) then 
            do jobj=1,numobj    !loop over jets
               if(typobj(jobj).eq.4.and.unique(jobj)) then
                  del_phi_muj=abs(phi_obj(iobj)-phi_obj(jobj))                 
                  if(del_phi_muj.gt.pi) del_phi_muj = 
     .                 2.0*pi- del_phi_muj !go short way round circle  
                  del_eta_muj=eta_obj(iobj)-eta_obj(jobj)
                  del_r_muj=sqrt(del_phi_muj**2+del_eta_muj**2) !mu jet separation
                  if(del_r_muj.lt.del_r_min) then
                     del_r_min=del_r_muj
                     jclose=jobj !its the new closest jet
                  endif
               endif
            enddo               !end loop over jets
            closejet(iobj)=jclose !identity of the closest jet
         endif
      enddo                     !end loop over muons
      return
      end

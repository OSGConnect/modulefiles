c-------------
c     Clean Olympics Output
c     Blame Jesse Thaler/Aaron Pierce
c-------------
      PROGRAM CLEAN
      implicit none

c&&&&&&&&&&&&&&&&&&&
      integer NMXHEP1
      parameter (NMXHEP1=4000)
      common/HEPEVT1/NEVHEP1,NHEP1,ISTHEP1(NMXHEP1),IDHEP1(NMXHEP1),
     &JMOHEP1(2,NMXHEP1),JDAHEP1(2,NMXHEP1),PHEP1(5,NMXHEP1),
     &VHEP1(4,NMXHEP1), BeginStdhep1, EndStdhep1, i1
      character*80  BeginStdhep1, EndStdhep1
      integer NEVHEP1,NHEP1,ISTHEP1,IDHEP1,JMOHEP1,JDAHEP1,i1
      double precision PHEP1,VHEP1
      save /HEPEVT1/
C...      NEVHEP       - event number
C...      NHEP         - number of entries in this event
C...      ISTHEP(..)   - status code
C...      IDHEP(..)    - particle ID, P.D.G. standard
C...      JMOHEP(1,..) - position of mother particle in list
C...      JMOHEP(2,..) - position of second mother particle in list
C...      JDAHEP(1,..) - position of first daughter in list
C...      JDAHEP(2,..) - position of last daughter in list
C...      PHEP(1,..)   - x momentum in GeV/c
C...      PHEP(2,..)   - y momentum in GeV/c
C...      PHEP(3,..)   - z momentum in GeV/c
C...      PHEP(4,..)   - energy in GeV
C...      PHEP(5,..)   - mass in GeV/c**2
C...      VHEP(1,..)   - x vertex position in mm
C...      VHEP(2,..)   - y vertex position in mm
C...      VHEP(3,..)   - z vertex position in mm
C...      VHEP(4,..)   - production time in mm/c
c&&&&&&&&&&&&&&&&&&& 

      integer numargs,iarg,dummy
      character*80 filetoclean,filetooutput,tmpinfo
      character*80 firstline

      integer nob,i
      parameter (nob=100)

      integer KCOUNTp,KTYPEp      
      double precision XETAp,XPHIp,XPTp,XMASSp,XNTRACKp,
     &                 XBTAGp,XHADEMp,XDUM1p,XDUM2p
      common /PARTICLE/KCOUNTp,KTYPEp,XETAp,
     &              XPHIp,XPTp,XMASSp,
     &              XNTRACKp,XBTAGp,XHADEMp,
     &              XDUM1p,XDUM2p
     

      integer KCOUNT,KTYPE,NPART
      double precision XETA,XPHI,XPT,XMASS,XNTRACK,
     &                 XBTAG,XHADEM,XDUM1,XDUM2
      common /EVENT/KCOUNT(0:nob),KTYPE(0:nob),XETA(0:nob),
     &              XPHI(0:nob),XPT(0:nob),XMASS(0:nob),
     &              XNTRACK(0:nob),XBTAG(0:nob),XHADEM(0:nob),
     &              XDUM1(0:nob),XDUM2(0:nob),NPART       


      integer lfn
      logical ismuonclean,istriggerremove,isfirstremove
      logical isoldformat
      common /FLAGS/lfn,ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat


      lfn = 53

      

      
c... Get command line arguments

      numargs = IArgC()
      
      call getArg(numargs-1,filetoclean)
      call getArg(numargs,filetooutput)

      
      open(47,file=filetoclean,form='formatted',status='old')
      open(53,file=filetooutput, ACCESS='APPEND')

            
      ismuonclean=.false.
      isfirstremove=.false.
      istriggerremove=.false.
      isoldformat=.false.

      do iarg = 1, numargs-2
         call getArg(iarg,tmpinfo)
         if (tmpinfo(1:index(tmpinfo,' ')).eq.'-muon') then
            ismuonclean = .true.
         else if (tmpinfo(1:index(tmpinfo,' ')).eq.'-first') then
            isfirstremove = .true.
         else if (tmpinfo(1:index(tmpinfo,' ')).eq.'-trigger') then
            istriggerremove = .true.
         else if (tmpinfo(1:index(tmpinfo,' ')).eq.'-old') then
            isoldformat = .true.  
         else
            write(6,*) "Command line argument ", 
     &              tmpinfo(1:index(tmpinfo,' ')),
     &              " not-recognized."
         end if
      end do
C
      if(isoldformat.and.istriggerremove) then
         write(6,*) "When Old format called, Trigger option not needed"
         write(6,*) "Will remove the zero objects automatically"
      endif
      if(isoldformat.and.ismuonclean) then
         write(6,*) "When Old format called. Muon option not needed"
         write(6,*) "will combine muons automatically"
      endif
      if(isoldformat) then
         write (6,*) "I will convert the file to the old format and"
         write (6,*) "merge the non-isolated muons with jets"
      else if (ismuonclean) then
         write(6,*) "I will merge non-isolated muons with jets..."
      else if (istriggerremove) then
         write(6,*) "I will remove trigger object and put trigger"
         write(6,*) "word in the missing ET HAD/EM fraction..."
      end if
      
      if (isfirstremove) then
         write(6,*) "I will remove the first line..."
      endif
      


c... Read in data to common blocks

 600  format(i3,i5,f9.3,f7.3,f8.2,f8.2,2f6.1,f9.2,2f6.1)
 601  format(i3,i14,i7)
 602  format(i3)
      read(47,end=100,fmt='(a80)') firstline  ! first line is junk, store for later output
      if (isfirstremove) then
      else if (isoldformat) then
 630     format(1x,2a3,2x,2a7,1X,2a9,2a7) !write out the old header line instead
         write(lfn,630) '  #','typ','    eta','    phi','       pt',
     $        '     jmas',' ntrack','   btag'
      else
         write(lfn,'(a80)') firstline !spit back out the first line
      end if

c      write (lfn,*) 'debug147: '
      do while (.true.)
         read(47,end=100,fmt='(a80)') tmpinfo

         read(tmpinfo,fmt=602) KCOUNTp

         if (KCOUNTp.eq.(-1) ) then
c            write (lfn,*) 'debug153: '
            read(tmpinfo,fmt=601) dummy, NEVHEP1, nhep1
            do i = 1, nhep1
               read(47, *) i1, isthep1(i), idhep1(i),
     .               jmohep1(1,i), jmohep1(2,i),
     .               jdahep1(1,i), jdahep1(2,i),
     .               phep1(1,i), phep1(2,i), phep1(3,i), phep1(4,i),
     .               phep1(5,i),
     .               vhep1(1,i), vhep1(2,i), vhep1(3,i), vhep1(4,i)
            enddo

         else if (KCOUNTp.eq.0) then
c            write (lfn,*) 'debug164: '
            read(tmpinfo,fmt=601) dummy,KCOUNTp, KTYPEp
            call startEvent

         else
c            write (lfn,*) 'debug169: '
            read(tmpinfo,end=100,fmt=600) KCOUNTp,KTYPEp,
     &           XETAp,XPHIp,XPTp,XMASSp,
     &           XNTRACKp,XBTAGp,XHADEMp,
     &           XDUM1p,XDUM2p
         end if

         if(KCOUNTp.eq.(-1) ) cycle;

c         write (lfn,*) 'debug174: '
         call addParticle

c         write (lfn,*) 'debug176: '
         if (KTYPEp.eq.6) call endEvent
c         write (lfn,*) 'debug178: '

      end do

c      write (lfn,*) 'debug182: '
 100  continue
      write(6,*) "Thank you for using the olympics output cleaner."

c      write (lfn,*) 'debug186: '
      end

C------ Start Event

      subroutine startEvent

c&&&&&&&&&&&&&&&&&&&
      integer NMXHEP1
      parameter (NMXHEP1=4000)
      common/HEPEVT1/NEVHEP1,NHEP1,ISTHEP1(NMXHEP1),IDHEP1(NMXHEP1),
     &JMOHEP1(2,NMXHEP1),JDAHEP1(2,NMXHEP1),PHEP1(5,NMXHEP1),
     &VHEP1(4,NMXHEP1), BeginStdhep1, EndStdhep1, i1
      character*80  BeginStdhep1, EndStdhep1
      integer NEVHEP1,NHEP1,ISTHEP1,IDHEP1,JMOHEP1,JDAHEP1, i1
      double precision PHEP1,VHEP1
      save /HEPEVT1/
C...      NEVHEP       - event number
C...      NHEP         - number of entries in this event
C...      ISTHEP(..)   - status code
C...      IDHEP(..)    - particle ID, P.D.G. standard
C...      JMOHEP(1,..) - position of mother particle in list
C...      JMOHEP(2,..) - position of second mother particle in list
C...      JDAHEP(1,..) - position of first daughter in list
C...      JDAHEP(2,..) - position of last daughter in list
C...      PHEP(1,..)   - x momentum in GeV/c
C...      PHEP(2,..)   - y momentum in GeV/c
C...      PHEP(3,..)   - z momentum in GeV/c
C...      PHEP(4,..)   - energy in GeV
C...      PHEP(5,..)   - mass in GeV/c**2
C...      VHEP(1,..)   - x vertex position in mm
C...      VHEP(2,..)   - y vertex position in mm
C...      VHEP(3,..)   - z vertex position in mm
C...      VHEP(4,..)   - production time in mm/c
c&&&&&&&&&&&&&&&&&&& 
      
      integer nob,i
      parameter (nob=100)

      integer KCOUNTp,KTYPEp      
      double precision XETAp,XPHIp,XPTp,XMASSp,XNTRACKp,
     &                 XBTAGp,XHADEMp,XDUM1p,XDUM2p
      common /PARTICLE/KCOUNTp,KTYPEp,XETAp,
     &              XPHIp,XPTp,XMASSp,
     &              XNTRACKp,XBTAGp,XHADEMp,
     &              XDUM1p,XDUM2p

      integer KCOUNT,KTYPE,NPART
      double precision XETA,XPHI,XPT,XMASS,XNTRACK,
     &                 XBTAG,XHADEM,XDUM1,XDUM2
      common /EVENT/KCOUNT(0:nob),KTYPE(0:nob),XETA(0:nob),
     &              XPHI(0:nob),XPT(0:nob),XMASS(0:nob),
     &              XNTRACK(0:nob),XBTAG(0:nob),XHADEM(0:nob),
     &              XDUM1(0:nob),XDUM2(0:nob),NPART        

      integer lfn
      logical ismuonclean,istriggerremove,isfirstremove
      logical isoldformat
      common /FLAGS/lfn,ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat
     
      NPART = -1  ! The trigger object is the 0th object
     
      do i = 0, nob
         KCOUNT(i) = 0
         KTYPE(i)  = 0
         XETA(i)   = 0 
         XPHI(i)   = 0
         XPT(i)    = 0 
         XMASS(i)  = 0 
         XNTRACK(i)= 0
         XBTAG(i)  = 0
         XHADEM(i) = 0
         XDUM1(i)  = 0
         XDUM2(i)  = 0
      end do

          write (lfn,*) 'BeginEvent  ', NEVHEP1

          write (lfn,*) 'BeginStdhep'
          write (lfn,*) nhep1
          do i = 1, nhep1
              write (lfn,fmt=282) i, isthep1(i), idhep1(i),
     .                 jmohep1(1,i), jmohep1(2,i),
     .                 jdahep1(1,i), jdahep1(2,i),
     .                 phep1(1,i), phep1(2,i), phep1(3,i), phep1(4,i),
     .                 phep1(5,i),
     .                 vhep1(1,i), vhep1(2,i), vhep1(3,i), vhep1(4,i)             
          enddo 
 282  format(i6,i4,i11,4i6,9f12.2)
c 282  format(i5,i3,i10,4i5,9f9.2)
          write (lfn,*) 'EndStdhep'

          write (lfn,*) 'BeginReco'
     
      if (istriggerremove.or.isoldformat) then
      else
c         write (lfn,*) 'debug286: '
         write(lfn,'(i3,i14,i7)') 0,KCOUNTp,KTYPEp 
      end if
     
      end

C------ Add Particle

      subroutine addParticle
      
      integer nob,i
      parameter (nob=100)

      integer KCOUNTp,KTYPEp      
      double precision XETAp,XPHIp,XPTp,XMASSp,XNTRACKp,
     &                 XBTAGp,XHADEMp,XDUM1p,XDUM2p
      common /PARTICLE/KCOUNTp,KTYPEp,XETAp,
     &              XPHIp,XPTp,XMASSp,
     &              XNTRACKp,XBTAGp,XHADEMp,
     &              XDUM1p,XDUM2p

      integer KCOUNT,KTYPE,NPART
      double precision XETA,XPHI,XPT,XMASS,XNTRACK,
     &                 XBTAG,XHADEM,XDUM1,XDUM2
      common /EVENT/KCOUNT(0:nob),KTYPE(0:nob),XETA(0:nob),
     &              XPHI(0:nob),XPT(0:nob),XMASS(0:nob),
     &              XNTRACK(0:nob),XBTAG(0:nob),XHADEM(0:nob),
     &              XDUM1(0:nob),XDUM2(0:nob),NPART       

      integer lfn
      logical ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat
      common /FLAGS/lfn,ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat
      NPART = NPART + 1

      KCOUNT(NPART) = KCOUNTp
      KTYPE(NPART)  = KTYPEp
      XETA(NPART)   = XETAp 
      XPHI(NPART)   = XPHIp
      XPT(NPART)    = XPTp 
      XMASS(NPART)  = XMASSp 
      XNTRACK(NPART)= XNTRACKp
      XBTAG(NPART)  = XBTAGp      
      XHADEM(NPART) = XHADEMp
      XDUM1(NPART)  = XDUM1p
      XDUM2(NPART)  = XDUM2p
      if (isoldformat) then     
C need to fix up btags column, massage number of tracks and charge
         if(KTYPEp.eq.4.and.XBTAGp.eq.1.0.or.XBTAGp.eq.2.0) then !btag for jets
            XBTAG(NPART)=1.0
         else if(KTYPEp.eq.4.and.XBTAGp.eq.1.0) then 
            XBTAG(NPART)=0.0
         endif
         if (KTYPEp.le.2) then  !for electrons and muons
            XMASS(NPART)=XNTRACKp !puts charge back in the mass column
         endif
         if (KTYPEp.eq.3) then  !for taus
            if (XNTRACKp.gt.0) then
               XMASS(NPART)=1.0
            else
               XMASS(NPART)=-1.0
               XNTRACK(NPART)=ABS(XNTRACKp)
            end if
         endif
      endif

      end

C------ End Event

      subroutine endEvent
      
      integer nob,i,k
      parameter (nob=100)

      integer KCOUNT,KTYPE,NPART
      double precision XETA,XPHI,XPT,XMASS,XNTRACK,
     &                 XBTAG,XHADEM,XDUM1,XDUM2
      common /EVENT/KCOUNT(0:nob),KTYPE(0:nob),XETA(0:nob),
     &              XPHI(0:nob),XPT(0:nob),XMASS(0:nob),
     &              XNTRACK(0:nob),XBTAG(0:nob),XHADEM(0:nob),
     &              XDUM1(0:nob),XDUM2(0:nob),NPART    

      integer lfn
      logical ismuonclean,istriggerremove,isfirstremove
      logical isoldformat
      common /FLAGS/lfn,ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat
C     
      double precision  ptiso, etrat
      double precision ptisomax, etratmax
      parameter(ptisomax=5d0)
      parameter(etratmax=.1125d0)
      logical jetcloseflag

C
      if (.Not.isoldformat) then
         if (istriggerremove) then
c      write (lfn,*) 'L375: NPART = ', NPART
            do i = 1, NPART
               if (KTYPE(i).eq.6) then ! if missing ET object
                  XHADEM(i) = KTYPE(0) !move the trigger word there
               end if
            end do
         end if 
      endif
      
      if (ismuonclean.or.isoldformat) then
c      write (lfn,*) 'L385: NPART = ', NPART
         do i = 1, NPART
            if (KTYPE(i).eq.2) then
C     we'll check to see if muon passes cuts     
               ptiso=DBLE(INT(XHADEM(i))) 
               etrat=XHADEM(i)-ptiso !decimal part
               if (ptiso .ge. ptisomax .or. etrat.ge. etratmax) then
                  KTYPE(i) = 999 ! remove muon 
C     add it to the closest jet in delta R if there is a jet in event
C     otherwise the muon just gets deleted.
                  if (int(XBTAG(i)).gt.0) then
                     call mergeMuon(i,int(XBTAG(i)))
                  endif
               end if
            endif
         end do
      end if
      
      
      k = 0  ! renumber events
  
c      write (lfn,*) 'L406: NPART = ', NPART
      do i = 1, NPART  ! trigger word has already been printed in startEvent
         if (KTYPE(i).ne.999) then ! if not a deleted object 
            k = k + 1
            if(isoldformat) then
               if (ktype(i).ne.6) then
c                  write (lfn,*) 'debug412: '
                  write(lfn,fmt=601) k,KTYPE(i),XETA(i),
     &                 XPHI(i),XPT(i),XMASS(i),XNTRACK(i),XBTAG(i)
               else
c                  write (lfn,*) 'debug416: '
                  write(lfn,601) k,6,0.0,xphi(i),xpt(i),0.0,0.0,0.0
               end if
            else
c               write (lfn,*) 'debug420: '
               write(lfn,fmt=600) k,KTYPE(i),XETA(i),
     &              XPHI(i),XPT(i),XMASS(i),
     &              XNTRACK(i),XBTAG(i),XHADEM(i),
     &              XDUM1(i),XDUM2(i)
            end if
         end if
      end do
      
 600  format(i3,i5,f9.3,f7.3,f8.2,f8.2,2f6.1,f9.2,2f6.1)
 601  format(1x,2i3,2x,2f7.3,1X,2f9.2,2f7.1)

          write (lfn,*) 'EndReco'

          write (lfn,*) 'EndEvent'
      end

      
C------ Merge Muon

      subroutine mergeMuon(imuon,ijet)
      
      integer nob,i,k
      parameter (nob=100)

      double precision PX1,PY1,PZ1,PE1,PX2,PY2,PZ2,PE2,ETA,PHI,PT,MASS

      integer KCOUNT,KTYPE,NPART
      double precision XETA,XPHI,XPT,XMASS,XNTRACK,
     &                 XBTAG,XHADEM,XDUM1,XDUM2
      common /EVENT/KCOUNT(0:nob),KTYPE(0:nob),XETA(0:nob),
     &              XPHI(0:nob),XPT(0:nob),XMASS(0:nob),
     &              XNTRACK(0:nob),XBTAG(0:nob),XHADEM(0:nob),
     &              XDUM1(0:nob),XDUM2(0:nob),NPART   
      logical ismuonclean,istriggerremove,isfirstremove
      logical isoldformat
      common /FLAGS/lfn,ismuonclean,istriggerremove,isfirstremove,
     &     isoldformat
C     
      call fourVector(XETA(imuon),XPHI(imuon),XPT(imuon),XMASS(imuon),
     &      PX1,PY1,PZ1,PE1)
       
      call fourVector(XETA(ijet),XPHI(ijet),XPT(ijet),XMASS(ijet),
     &      PX2,PY2,PZ2,PE2)
C
      PX2 = PX1 + PX2
      PY2 = PY1 + PY2
      PZ2 = PZ1 + PZ2
      PE2 = PE1 + PE2

      call etaPhiPtMass(PX2,PY2,PZ2,PE2,ETA,PHI,PT,MASS)
        
      XETA(ijet) = ETA
      XPHI(ijet) = PHI
      XPT(ijet) = PT
      XMASS(ijet) = MASS
      if (.not.isoldformat) then
         XNTRACK(ijet)= XNTRACK(ijet)+1.1
      else
         XNTRACK(ijet)= XNTRACK(ijet)+1.0
      endif
      end

C----------------------------------------------------------------------
C...Begin subroutine fourVector
C----------------------------------------------------------------------

      subroutine fourVector(ETA,PHI,PT,MASS,PX,PY,PZ,PE)

      double precision ETA,PHI,PT,MASS,PX,PY,PZ,PE

      PX = PT * cos(PHI)
      PY = PT * sin(PHI)
      PZ = PT * sinh(ETA)
      PE=SQRT (PX**2+PY**2+PZ**2+MASS**2)
      end

C----------------------------------------------------------------------
C...Begin subroutine etaPhiPtMass
C----------------------------------------------------------------------

      subroutine etaPhiPtMass(PX,PY,PZ,PE,ETA,PHI,PT,MASS)
      implicit none
      double precision ETA,PHI,PT,MASS,PX,PY,PZ,PE
      double precision MASSSQ,PTSQ,PTEMP
      double precision pi
      parameter (pi=3.1415926d0)
      MASSSQ=PE**2 - PX**2 - PY**2 - PZ**2
      if (MASSSQ.gt.0d0) then
         MASS=sqrt(MASSSQ)
      else
         MASS=0d0
      endif
C     
      PTSQ=PX**2+PY**2
      IF (PTSQ.gt.0d0) then
         PT = SQRT(PTSQ)
      else
         PT=0d0
      endif
C
      PHI = atan2(PY,PX)
      if (PHI.le.0d0)  THEN 
         PHI = PHI + 2.0d0*pi
      endif
C
      ETA = 0
      PTEMP=SQRT(PTSQ+PZ**2)
      if ( (PTEMP-PZ).ne.0.0) then
        ETA = dlog(PT/(PTEMP-PZ))
      endif
      return
      end








      subroutine WRDIAG(I,J,NHW,NHE,NVN,NVS)

      include "parameters.h"
      include "blk11a.h"
      include "blk8a.h"
      include "blkc.h"
      integer,parameter :: iunhd=311
      INTEGER,PARAMETER :: iuqdr=312

      logical :: isopen
      CHARACTER(len=40) :: fname
      if(I==1.and.J==1)then
      inquire(unit=iunhd, opened=isopen)
      if(isopen)then
      close(iunhd)            
      endif

      inquire(unit=iuqdr, opened=isopen)
      if(isopen)then
      close(iuqdr)      
      endif

      write(fname,'(A,I4,A)')'hcnd_vr.',IYRC,'.txt'
      open(iunhd,file=fname,status='unknown')
      write(fname,'(A,I4,A)')'QDRAI.',IYRC,'.txt'
      open(iuqdr,file=fname,status='unknown')
      endif
      DO 9695 NX=NHW,NHE
      DO 9690 NY=NVN,NVS
      write(iunhd,*)(HCND3(3,L,NY,NX),L=NU(NY,NX)
     2,NL(NY,NX))
      write(iuqdr,*)(QDRAIZ(L,NY,NX),L=NU(NY,NX)
     2,NL(NY,NX))      
9690  CONTINUE
9695  CONTINUE

      end subroutine WRDIAG

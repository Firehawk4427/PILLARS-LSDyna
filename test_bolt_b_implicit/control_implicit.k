$-----------------------------------------------------------------------------
$
$ Example provided by Dr. Nils Karajan (DYNAmore Corporation)
$
$ Date: Wed Apr 11 10:42:53 CET 2018
$
$ E-Mail: info@dynamore.de
$ Web: http://www.dynamore.de
$
$ Copyright, 2018 DYNAmore Corp.
$ Copying for non-commercial usage allowed if
$ copy bears this notice completely.
$
$-------------------------------------------------------------------------------
$
$ Run main file as is. It was tested with LS-DYNA R9.2 with double precision.
$ 
$-------------------------------------------------------------------------------
$# Units: kg / mm / ms / kN / GPa / kN-mm
$-------------------------------------------------------------------------------
$
*KEYWORD
$
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$ CONTROL cards for implicit
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
*CONTROL_IMPLICIT_GENERAL
$#  imflag       dt0    imform      nsbs       igs     cnstn      form    zero_v
         1      &dt0         2         1         2                              
$
$--- Switch on/off dynamic effects over time
$
*CONTROL_IMPLICIT_DYNAMICS
$#   imass     gamma      beta    tdybir    tdydth    tdybur     irate     alpha
       -42      0.60   0.38000
*DEFINE_CURVE
$#    lcid      sidr       sfa       sfo      offa      offo    dattyp     lcint
        42                                                                      
$#                a1                  o1  
                 0.0                 1.0
             &tDyDth                 1.0
             &tDyBur                 0.0
        &tDyBir*0.99                 0.0
             &tDyBir                 1.0
             &tInfty                 1.0
$
$--- Set Key points in time to reach exactly
$
*CONTROL_IMPLICIT_AUTO
$#   iauto    iteopt    itewin     dtmin     dtmax     dtexp     kfail    kcycle
         1        40        10    &dtMin       -24                        
*DEFINE_CURVE
$#    lcid      sidr       sfa       sfo      offa      offo    dattyp     lcint
        24                                                                      
$#                a1                  o1  
             &tDyDth              &dtMax
             &tDyBur              &dtMax
             &tDyBir              &dtMax
$
$---
$
*CONTROL_IMPLICIT_SOLUTION
$#  nsolvr    ilimit    maxref     dctol     ectol     rctol     lstol    abstol
        12         6        12    1.0e-3    1.0e-2                       1.0e-20
$#   dnorm    diverg     istif   nlprint    nlnorm   d3itctl     cpchk
         1                             3         4         1          
$#  arcctl    arcdir    arclen    arcmth    arcdmp    arcpsi    arcalf    arctim
                                                                                
$#   lsmtd     lsdir      irad      srad      awgt      sred
         4                                                   
*CONTROL_IMPLICIT_SOLVER
$#  lsolvr    lprint     negev     order      drcm    drcprm   autospc   autotol
                   1                   2                             2          
*COMMENT *CONTROL_IMPLICIT_EIGENVALUE
$#    neig    center     lflag    lftend     rflag    rhtend    eigmth    shfscl
        20
$#   solid     ibeam    ishell   itshell    mstres    evdump   mstrscl
                                                                  0.01
$
$---
$
*CONTROL_ACCURACY
$#     osu       inn    pidosu      iacc
         1         4                   1
$
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$ CONTROL cards - mostly recommendations for explicit crash applications
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
*CONTROL_SOLUTION
$#    soln       nlq     isnan     lcint     
                             1      1001
*CONTROL_ENERGY
$#    hgen      rwen    slnten     rylen     
         2         2         2         2
*CONTROL_HOURGLASS
$#     ihq        qh  
         8       0.1
*CONTROL_BULK_VISCOSITY
$#      q1        q2      type     btype     
       1.5      0.06        -1          
*CONTROL_CONTACT
$#  slsfac    rwpnal    islchk    shlthk    penopt    thkchg     orien    enmass
      0.80       1.0         2                   1                              
$#  usrstr    usrfrc     nsbcs    interm     xpene     ssthk      ecdt   tiedprj
                                                                                
$#   sfric     dfric       edc       vfc        th     th_sf    pen_sf      
                                                                      
$#  ignore    frceng   skiprwg    outseg   spotstp   spotdel   spothin       
         2                             1         2         1          
$#    isym    nserod    rwgaps    rwgdth     rwksf      icov    swradf    ithoff
                             1                 1.0                              
$#  shledg    pstiff    ithcnt    tdcnof     ftall    unused    shltrw      
                                                                      
*CONTROL_RIGID
$#     lmf      jntf    orthmd     partm    sparse    metalf    plotel     rbsms
                                                                                
$#  norbic   gjadstf   gjadvsc   tjadstf   tjadvsc
                    
*CONTROL_SHELL
$#  wrpang     esort     irnxx    istupd    theory       bwc     miter      proj
      30.0         1                   1                                       1
$# rotascl    intgrd    lamsht    cstyp6    thshel      
                                                  
$# psstupd   sidt4tu     cntco    itsflg    irquad    w-mode   stretch      icrq
                                                                                
$#  nfail1    nfail4   psnfail    keepcs     delfr   drcpsid    drcprm   intperr
                   1                                               1.0          
*CONTROL_SOLID
$#   esort   fmatrix   niptets    swlocl    psfail   t10jtol    icohed    tet13k
         1                             1                                        
$#   pm1     pm2     pm3     pm4     pm5     pm6     pm7     pm8     pm9    pm10
                                                                                
*CONTROL_OUTPUT
$#   npopt    neecho    nrefup    iaccop     opifs    ipnint    ikedit    iflush
         1         3                   1                                        
$#   iprtf    ierode   tet10s8    msgmax    ipcurv      gmdt   ip1dblt      eocs
                   1               10000                                        
$#   tolev    newleg    frfreq     minfo    solsig    msgflg    cdetol      
                                                                      
*CONTROL_MPP_IO_NODUMP
$
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
$ CONTACT cards
$
$---+----1----+----2----+----3----+----4----+----5----+----6----+----7----+----8
$
*CONTACT_AUTOMATIC_SINGLE_SURFACE_MORTAR_ID
$#     cid                                                                 title
     10001 Global Contact
$
$#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr
     10101                   2                                                  
$#      fs        fd        dc        vc       vdc    penchk        bt        dt
      0.15      0.10       1.0                                              
$#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf
                                                                                
$#    soft    sofscl    lcidab    maxpar     sbopt     depth     bsort    frcfrq
                                                                               1
$#  penmax    thkopt    shlthk     snlog      isym     i2d3d    sldthk    sldstf
                                                                                
$#    igap    ignodprfac/mpadtstif/mpar2   unused     unused    flangl   cid_rcf
         3         2                                                            
$#   q2tri    dtpchk     sfnbr    fnlscl   dnlscl       tcso    tiedid    shledg
                                                                                
$#  sharec    cparm8    ipback     srnde    fricsf      icor     ftorq    region
                                                                                
$#  pstiff   ignroff   beam-cs       
                              
*SET_PART_ADD
$#     sid       da1       da2       da3       da4    solver      
     10101                                                  
$#   spid1     spid2     spid3     spid4     spid5     spid6     spid7     spid8
     10001     10100
$
$---
$
*CONTACT_FORCE_TRANSDUCER_PENALTY_ID
$#     cid                                                                 title
     10002 Contact Force Between Sheets
$
$#    ssid      msid     sstyp     mstyp    sboxid    mboxid       spr       mpr
        10        20         3         3                                        
$#      fs        fd        dc        vc       vdc    penchk        bt        dt
                                                                                
$#     sfs       sfm       sst       mst      sfst      sfmt       fsf       vsf
                                                                                
*END

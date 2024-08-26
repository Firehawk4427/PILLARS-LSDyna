$# LS-DYNA Keyword file created by LS-PrePost(R) V4.10.5-23Jun2023
$# Created on Aug-8-2024 (14:33:02)
*KEYWORD
*TITLE
$#                                                                         title
LS-DYNA keyword deck by LS-PrePost
*CONTROL_TERMINATION
$#  endtim    endcyc     dtmin    endeng    endmas     nosol
      40.0         0       0.0       0.01.000000E8         0
*DATABASE_ABSTAT
$#      dt    binary      lcur     ioopt
       0.5         0         0         1
*DATABASE_BINARY_D3PLOT
$#      dt      lcdt      beam     npltc    psetid
       0.5         0         0         0         0
*MAT_FABRIC_TITLE
Airbag
$#     mid        ro        ea        eb         -      prba      prab         -
         17.86000E-7       0.3       0.2                 0.2       0.2          
$#     gab         -         -       cse        el       prl    lratio      damp
      0.04                           1.0      0.06      0.35       0.1       0.2
$#    aopt       flc       fac       ela      lnrc      form     fvopt    tsrfac
       0.0       0.0       0.0       0.0       0.0         0         0       0.0
$#  unused    rgbrth     a0ref        a1        a2        a3        x0        x1
                 0.0         0       0.0       0.0       0.0       0.0       0.0
$#      v1        v2        v3         -         -         -      beta    isrefg
       0.0       0.0       0.0                                     0.0         0
*MAT_RIGID_TITLE
Gas Nozzle
$#     mid        ro         e        pr         n    couple         m     alias
         27.80000E-6     200.0       0.3       0.0       0.0       0.0          
$#     cmo      con1      con2
       1.0         7         7
$#lco or a1        a2        a3        v1        v2        v3
       0.0       0.0       0.0       0.0       0.0       0.0
*DEFINE_CURVE_TITLE
Mass Flow Rate
$#    lcid      sidr       sfa       sfo      offa      offo    dattyp     lcint
         1         0       1.0       1.0       0.0       0.0         0         0
$#                a1                  o1
                 0.0                 0.0
                30.0                0.01
                40.0                 0.0
*AIRBAG_SIMPLE_AIRBAG_MODEL
$#     sid    sidtyp      rbid      vsca      psca      vini       mwd      spsf
         1         1         0       1.0       1.0       0.0       0.0       0.0
$#      cv        cp         t      lcid        mu      area        pe        ro
   196.168     274.6     800.0         1       0.7       0.01.01300E-41.22500E-9
$#     lou      text         a         b        mw      gasc
         0       0.0       0.0       0.0       0.0       0.0
*SECTION_SHELL_TITLE
Shell
$#   secid    elform      shrf       nip     propt   qr/irid     icomp     setyp
         1         5       1.0         4       1.0         0         0         1
$#      t1        t2        t3        t4      nloc     marea      idof    edgset
       0.4       0.4       0.4       0.4       0.0       0.0       0.0         0
*SET_PART_LIST_TITLE
Airbag
$#     sid       da1       da2       da3       da4    solver
         1       0.0       0.0       0.0       0.0MECH
$#    pid1      pid2      pid3      pid4      pid5      pid6      pid7      pid8
         1         2         0         0         0         0         0         0
*END

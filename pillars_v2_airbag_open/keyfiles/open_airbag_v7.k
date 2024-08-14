$# LS-DYNA Keyword file created by LS-PrePost(R) V4.10.5-23Jun2023
$# Created on Jul-17-2024 (15:02:44)
*KEYWORD
*TITLE
$#                                                                         title
LS-DYNA keyword deck by LS-PrePost
*CONTROL_TERMINATION
      40.0         0       0.0       0.01.000000E8         0
*DATABASE_ABSTAT
       0.5         0         0         1
*DATABASE_BINARY_D3PLOT
       0.5         0         0         0         0
*MAT_FABRIC_TITLE
Airbag
         17.86000E-7       0.3       0.2                 0.2       0.2          
      0.04                           1.0      0.06      0.35       0.1       0.2
       0.0       0.0       0.0       0.0       0.0         0         2       0.0
                 0.0         0       0.0       0.0       0.0       0.0       0.0
       0.0       0.0       0.0                                     0.0         0
*MAT_RIGID_TITLE
Gas Nozzle
         27.80000E-6     200.0       0.3       0.0       0.0       0.0          
       1.0         7         7
       0.0       0.0       0.0       0.0       0.0       0.0
*MAT_NULL
         31.00000E-7       0.0       0.0       0.0       0.0       0.0       0.0
*DEFINE_CURVE_TITLE
Mass Flow Rate
         1         0       1.0       1.0       0.0       0.0         0         0
                 0.0                 0.0
                30.0                0.01
                40.0                 0.0
*AIRBAG_SIMPLE_AIRBAG_MODEL
         1         1         0       1.0       1.0       0.0       0.0       0.0
   196.168     274.6     800.0         1       0.7       0.01.01300E-41.22500E-9
         0       0.0       0.0       0.0       0.0       0.0
*RIGIDWALL_PLANAR_ID
         1floor
         0         0         0       0.0       0.01.00000E20       1.0
       0.0       0.0     -40.0       0.0       0.0     350.0       0.0       0.0
*SECTION_SHELL_TITLE
Shell
         1         5       1.0         4       1.0         0         0         1
       0.4       0.4       0.4       0.4       0.0       0.0       0.0         0
*SET_PART_LIST_TITLE
Airbag
         1       0.0       0.0       0.0       0.0MECH
         2         0         0         0         0         0         0         0
*END

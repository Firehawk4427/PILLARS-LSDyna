
## V1
- model is currently 600m wide with a 80m wide inflator.
- used part trim and ele_edit to delete inner 150m radius from both side of airbag mesh
- Runs very simliar to $_{cv}$ case, but blows up at end
## V2
![[Pasted image 20240716163009.png]]
- very similar, although the blowout was much worse at the end
- worry about this later, setting up collisions is much harder and more important
## V3
- added rigidwall for floor
## V10
- resized everything to 60 m wide (outer)
- ran into bug where after deleting old parts and then transforming a new part, the old ones would reappear, merge into the new part, and irreversibly fuck up everything, then id restart. this happened far too many times
- *still need to remap keywords* 
## V12
- mapped keywords, but the null material exploded during simulation
![[null-explode.gif]]

## V13
- changed null mesh back to fabric
- same issues as before
## V16
- added pid 1 to airbag part list
- works as desired, just inflates too quick and vanishes
## V17
- divided maximum of mass flow rate curve by 10
- made no difference
## V18
- added timestep card (1e-5)
- inflated as quick, but didnt blow up til later
## V19
- slightly slowed down explosion of mesh by changing timestep to 1e-7
## V20
- changed load curve and limited end time to 30 (s)
![[Pasted image 20240718120135.png]]
## V21
- resized and translated RIGIWALL_PLANAR
- needs to move down 1 (m)
- also might need to swap this for solid mesh if im planning on adding anchor nodes
## V23
- deleted RIGIDWALL_PLANAR
- created solid box mesh
[[Pasted image 20240718134644.png]] (details on mesh)
- copied gas nozzle properties over to it
- 1000s of errors cause by SECTION_SHELL being attached to PID 4 when it is a SOLID.
![[Pasted image 20240718141656.png]]
## V24
- fixed last error by creating a SECTION_SOLI card and assigning it to PID 4.
- now everything works the same as before the resize
## V25
- created null material with 1e-5 YM and 1e-7 density, these are pulled out of nowhere and will change later. 
- attached null material card to PID 2
![[null-material-v25.gif]]
- at the end i showed the null material. I dont know why it explodes like that. Also collisions havent been implemented yet, this just didnt inflate enough to collide
## V26
- changed null material properties ![[Pasted image 20240718151501.png]]
- runtime is ~ 10s
- problem appears to be null material doesnt stop expanding when the fabric does. this needs to be restricted
## V27
- set pressure cutoff of null to 1
- no effect
## V28
- changed it to 1e-5
- same thing
- need to find some way to limit the maximum volume or pressure of the airbag. simple volume math
## V29
- changed endtime to 40 s
- sim explodes at 10s
## V30
![[Pasted image 20240719115124.png]]
## V31
- not sure if A or B is the master or slave (might matter for collisions)
![[Pasted image 20240719143547.png]]
- the model floats away, probably cause the null material is peircing the solid box below
- but collisions work
- will try null material as fabric with max porosity next
![[collisions-on-null-fucked.gif]]
## V32
- added fabric card and made it more permeable and attached it to null material
![[Pasted image 20240719150533.png]]
- seems to work, turns upside down because inflation pressure too high and no anchor nodes yet
- for anchor nodes, need to look back at parachute model for reference
![[collisions-on-null=porous-fabric.gif]]
## V34
- considering adding physical anchors to mesh, would need to redesign.
	- problem with this would be control volume airbag would be penetrated and no longer closed. (raises error and wont run correctly if i were to do this)
		- would work for the wind tunnel case (not currently running)
	- might just figure out how to use joints / beams to keep it anchored in the meantime
- gonna try and bring base plate closer and see if inflation still works
	- TESTED: still works fine

![[Pasted image 20240722144103.png]] ![[Pasted image 20240722144515.png]] 

## V35
- started with 2 beams using ele_edit
- beams group together automatically
- saving now before i break the keywords
## V36
- added section id for beams with spotweld beam property (ELFORM=9) and attached the spotweld material card

*** Warning 20123 (STR+123)
     spotweld material type 100 yield stress is invalid,
     and has been reset to one percent of Youngs modulus
     for part id= 5
     
 *** Warning 20282 (STR+282)
     warpage angle of element ID= 15 is computed as 3.9438E+01 degrees.
     
 *** Warning 30105 (INI+105)
     improperly numbered segment
     segment connectivity: 3062 3113 1089 1038
     
 *** Warning 30106 (INI+106)
	additional segments are being renumbered but not printed
	convergence of normal check obtained in  16 iterations
	region 1 has 4020 segments.
	number of independent regions where normal vectors
	are checked and if necessary reset =    1
	number of renumbered segments = 2026
![[Screenshot 2024-07-22 151701.png|200]]
## V39
- tweaked keycards for beam, now ETA is 2m
- runs well, but slightly incorrect geometry due to inner mesh constraining outer mesh
	- This is fine if we assume there is a mechanism in place to constrain our mesh from moving radially outwards.
	- We only want to focus on anchors anyways
## V40
- added 2 anchors
- when merging new beams to pid 5, pid 6 didn't delete, idfk why
 
 *** Error 10125 (KEY+125)
     Checking PART and SECTION definition input.
     PART ID 6 with
     SECTION ID 0 does not exist.
     This is PART 6 in the order of input.
 
 *** Error 10133 (KEY+133)
     input data failed with: 1 errors
## V41
- deleted PID 6
- geometry too constrained, need to try and get rid of inner mesh
![[4-anchor-test.gif|200]]

## V42
- added gravity
- inflated geometry more triangular from top-down view, even though the anchors havent changed
![[Pasted image 20240723131424.png|200]]
## V43
- changed gravity to that of the moon
- fixed the triangular geometry
## V44
- added CONTACT_AIRBAG_SINGLE_SURFACE

*** Warning 20282 (STR+282)
     warpage angle of element ID= 53 is computed as 3.8339E+01 degrees.
*** Warning 20289 (STR+289)
     Number of elements exceed warpage angle = 112
*** Warning 30105 (INI+105)
     improperly numbered segment
     segment connectivity: 3164 3215 1191 1140
 *** Warning 30106 (INI+106)
     additional segments are being renumbered but not printed
	convergence of normal check obtained in  16 iterations
	 region 1 has 4020 segments.
	 number of independent regions where normal vectors
	 are checked and if necessary reset =    1
	 number of renumbered segments = 2026
 *** Warning 30107 (INI+107)
     Number of improperly numbered segments 2026
     for control volume 1
## V47
- swapped airbag for auto contact
	- less accurate but fixes errors
- ETA 3m
## V48
- deleted permeability keyword
- swapped to WANG_NEFSKE
![[Pasted image 20240724143157.png|300]]![[Pasted image 20240724143221.png|300]]![[Pasted image 20240724143244.png|300]]
## V51
- tried a few changes with inner mesh density to see if i could get it to stretch more and not restrict the outer geometry.
	- all it did was exponentially increase runtime and simulation ran almost the same
## V52
- put parameters for AIRBAG_WANG_NEFSKE in SI units
	- load curve probably needs to be adapted to this
- changed inner mesh density back
- errors runninng, too many to put here
## V53
- changed mass flow rate to SI
- changed timestep to 0 (LS-Dyna decides)
## V54
- changed fabric 1 to SI units
## V55
- changed all other materials to SI units
	- made the rigid body equivalent to concrete
- ETA 20m
- stress on fabric around 10s of Mpa
## V56
- deleted MAT_ADD_POROSITY
- Tweaked parameters for leakage
	- SA of fabric ~ 3300 $m^{2}$, of inner mesh ~2300 $m^{2}$
- ETA 20min
- Inflation pressure seems low
	- i think the probem is the leakage occurs everywhere and not just the blue area. maybe i can treat the rest as blockage
	- also something could be wrong with thicknss of .25
## V57
- reverted back to null material for inner mesh with 0 pressure cutoff. 
- what if the fabric mesh was attached to the gas nozlzle with beams? would this fix the problem?
## V60
- gave up on null material cause its a pain to work with
- trying to get leakage keyword to work
- tweaked poroous fabric keyword
## V66
- reverted everything back to V56 when everything ran
- trying to make beams rigid / immovable and able to measure stress
## V67 
- gonna try to model anchors as 2 cylinders each with contact cards
## V68
- split top and bottom fabric in half
## V69
- trying to do one anchor with square mesh and refine down 
	- levels scale exponentially.
	- made 1e7 dense nodes twice on accient and it crashed
- square mesh trimmed down, just need to delete excess, mirror down, then elegen
## V70
- excess trimmed
## V71
- mirrored down 3.25m
- refined fabric mesh around anchor
## V72
- part trimmed
## V73
- shell base added and refined for 1 anchor
## V75
- anchor finished, now to delete everything else
## V76
- deleted unnecessary parts
- renamed evrything else
## V77
- redid keywords to fit new parts
## V78
- autocleaned keyword errors
- ran into errors with warpage and improperly numbered segments
## V79
- attempted to fix segmentation error
![[Pasted image 20240808161710.png|400]]
## V80
- CONSTRAINE_ADAPTIVITY keyword became self aware and keeps adding itself to my shit. i deleted it again
## V81
- added 1 layer of refinement
## V82
- added 1 layer of refinement 
	- tested this with normal airbag and it increase runtime by 50x - 100x
	- expected runtime should be ~ 1 day +/- 12 hours
- warpage error disappeared, segment error remains, new error: cannot find element of slave segment 35 of interface 1
- beam prism not showing (needs to be fixed)
## V83 
- added material for anchor, constrained in x and y and all rotation
- probably need to split head and nut to separate parts and have head collide with fabric and nut with base
## V84 
- deleted set segment
## V85
- converted everything addressing set_segment_airbag to be addressing set_part_airbag
- runtime 216 days
## V86
- deleted self collision
- changed collision of bag to only care about bottom half of fabric
## V87
- lowered thickness of anchor
## V88
- decreased timestep size
- lowered endtime to 10s
- changed mfr curve
- projected time seemed smaller by a factor of 1/20, but it still terminated
## V89
- timestep changed to 6.034E-05
- seemed to increase runtime, but terminated before i could verify
## V90
- timestep changed to 1E-8
## V91
- swapped airbag on anchor one-way to two-way contact
## V92
- reverted to v80 and repeated all steps except refinement in hopes of speeding up simulations
## V93
- deleted self collision and set_segment
- ETA 3min
## V94
- swapped one-way for two-way collision
- lowered leakage area
## V95
- timestep changed to 1e-8
## V96
- shell thickness upped to 1m
## V97
- deleted anchor for testing purposes
 *** Error 20216 (STR+216)
	part # 7 is out-of-range 
	input phase will continue if possible
 
 *** Warning 20542 (STR+542)
     number of master segments is zero.
## V98
- thickness lowered to .25
## V104
- messed around with parameters to speed up basic sim.
- changed back to one way collision
- reduced end time to 20 and fitted mfr curve to match
- settled on timestep of 1e-7 (too high or low increases runtime)
- new ETA without anchor is ~1hr $\pm$ 20min